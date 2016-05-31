#!/usr/bin/python
#-*-coding:utf-8-*-
import mapnik
import TileStache
import ModestMaps
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render,render_to_response, redirect
from django import forms
from django.http import HttpResponse, HttpResponseRedirect
from disk.models import User_import_data, User
from django.contrib.auth.hashers import make_password
from tile import *
import ModestMaps
from PIL import Image
import json
from editTileConfig import *
import dataProcess
from dataBase import *
from cartocss2xml import *
import tilelist
from form import *
from post2table import *
import commands
TILECONFIG = None
CFG = '.'
def upload(request):
    table = []
    tablename = ''
    if request.method == "POST":
        # use forms.Form
        uf = UserForm(request.POST,request.FILES)
        sf = StyleForm(request.POST)
        mss = mssStyleForm(request.POST)
        print "uf is " + str(uf.is_valid())
        print "sf is " + str(sf.is_valid())
        print "mss is " + str(mss.is_valid())
        
            # make formdata ok
        if uf.is_valid():
            tablename = userform(uf, request)  
            print tablename
            #table = post2table('select * from '+tablename)
        if sf.is_valid():
            styleform(sf, request)
            tablename  = sf.cleaned_data['usersql']
            table = post2table(tablename)
            #global CFG
            #CFG = TileStache.Config.buildConfiguration(TILECONFIG) 
        if mss.is_valid():
            mssform(mss, request)
        res = {'tablename':tablename,'table':table}
        return res
def tile(request,layer,z,y,x,extension):
    if TILECONFIG == None:
        return 
    #pre-edit tileStacheConfig file
    content = getTile(layer,extension,x,y,z,CFG )
    if extension == 'png' or extension=='jpg' :
        response = HttpResponse(content,content_type="image/"+extension)
        #img=Image.open(content)
        #img.save(response, 'png')
    else :
        # geojson format
        jsonFile = open(content)
        stmp = json.load(jsonFile)
        response = HttpResponse(json.dumps(stmp, ensure_ascii=False), content_type="application/json")
    return response
def tilelistbyregion(request):
    myData={"padding":0,"bbox":(52.55,13.28,52.46,13.51),"layer":"osm","extension":"png","filename":"","filetype":False}
    zooms=["12","13"]
    fileurllist=tilelist(myData,zooms)
    return HttpResponse(fileurllist)
def main(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    else:
        upload(request)
    return render(request, 'pages/blank.html')
def mapEdit(request,layername):
   # res = None
   # if request.user.is_authenticated():
        #res = upload(request)
    # global tilestacheFile
    global TILECONFIG
    TILECONFIG = addLayer2tileConfig(request)
    global CFG
    CFG = TileStache.Config.buildConfiguration(TILECONFIG)
    mssStyle=open('media/mss2xml/save.mss').read()
    log = ""
    print request.method
    if request.method == "POST":
        print "caocaocao"
        mssStyle = request.POST['mssStyle']       
        log = mss2xml(mssStyle)
    if log==(0, 'SUCCESS'):
        file_object = open('media/mss2xml/save.mss', 'w')
        file_object.write(mssStyle)
        file_object.close( ) 
    #else:
       # mssStyle=open('media/mss2xml/save.mss','r').read()
    port = '8888'
    if(layername==request.user.username):
        port='8000'
    return render(request, 'pages/test.html',{'layername':layername,'mssStyle':mssStyle,'log':log,'port':port,'isopen':'closed','display':'none'})
def getLayersFromMml(request):
    mmlfile=open('media/mss2xml/project.mml')
    mml=json.load(mmlfile)
    mmlfile.close()
    layers = []
    for layer in mml['Layer']:
        if layer!={}:
            layers.append(layer['name'])
    return HttpResponse(json.dumps(layers), content_type="application/json") 
def modifyLayer(request,modify_type):
    mml=json.load(open('media/mss2xml/project.mml','r'))
    if modify_type=='0':
        print ('111')
        if request.POST:
            removelayer = request.POST['removelayername']
            i=0
            for layer in mml['Layer']:
                if(layer!={} and layer['name']==removelayer):
                    print i
                    mml['Layer'].remove(layer)
                    break;
                i=i+1
    if modify_type=='1':
        if request.POST :
            addtype =request.POST['addType'] 
            info= request.POST['addlayerinfo']
            info = json.loads(info)
            print info
            if(addtype=='single'):
                mml['Layer'].append(info)
            elif(addtype=='multi'):
                mml['Layer'].extend(info)
    json.dump(mml,open('media/mss2xml/project.mml','w')) 
    commands.getstatusoutput('cd /home/whu/projects/osmdjango/media/mss2xml&&node mss2xml.js')    
def table(request,tablename):
    sql = "select * from "+tablename
    res = postGisToJson(sql)
    return HttpResponse(json.dumps(res), content_type="application/json")  
def datapage(request):
    rows = TablesOfDataBase(request.user.username)
    return render(request, 'pages/tables.html',{'rows':rows})
def mss2xml(mss):
    file_object = open('media/mss2xml/style.mss', 'w')
    file_object.write(mss)
    file_object.close( )     
    log = commands.getstatusoutput('cd /home/whu/projects/osmdjango/media/mss2xml&&node mss2xml.js')
    return log
def config_edit(s):
    editTileConfig.config['layers']['user']['provider']['mapfile']=s

def userform(fileform, request):
    username = request.user.username
    userfile = fileform.cleaned_data['userfile']
    user = User_import_data()
    user.username = username
    user.userfile = userfile
    user.save()
    filepath='media/upload/data/'+userfile.name.encode("utf-8")
    tablename = dataToPostGis(filepath, username,userfile.name.encode("utf-8"))
    # repdata=dataProcess.dataprocess(filepath)
    return tablename 

def styleform(styleform, request):
    cartocss = styleform.cleaned_data['userstyle']
    sql = styleform.cleaned_data['usersql']
    cartocss2xml(cartocss, sql, request)
def mssform(mssform,request):
    mss = mssform.cleaned_data['editor']
    print mss
def register(request):
    try:
        if request.method == 'POST':
            print request.POST
            regForm = RegisterForm(request.POST)
            if regForm.is_valid():
                # register
                user = User.objects.create(username=regForm.cleaned_data["username"], email=regForm.cleaned_data["email"], password=make_password(regForm.cleaned_data["password"]),)
                user.save()

                # login for redirect
                user.backend = 'django.contrib.auth.backends.ModelBackend'
                login(request, user)
                return HttpResponseRedirect("/main")
            else:
                return render(request, 'failure.html', {'reason': regForm.errors})
        else:
            regForm = RegisterForm()
    except Exception as e:
        print e
    return render(request,'pages/register.html',locals())

def Login(request):
    # if user logined or not
    if request.user.is_authenticated():
        return render(request, 'pages/blank.html', locals())
    try:
        if request.method == "POST":
            login_Form = LoginForm(request.POST)
            if login_Form.is_valid():
                username = login_Form.cleaned_data['username']
                password = login_Form.cleaned_data['password']
                user = authenticate(username = username, password = password)
                if user is not None:
                    user.backend = 'django.contrib.auth.backends.ModelBackend'
                    login(request, user)
                else:
                    return render(request, 'failure.html', {'reason': 'fail to Login'})
                # return render(request, 'index.html', locals())
                return HttpResponseRedirect('/main/')
            else:
                return render(request, 'failure.html', {'reason': login_Form.errors})
        else:
            login_Form = LoginForm()
    except Exception as e:
        print e
    return render(request, 'pages/login.html')

def Logout(request):
    try:
        logout(request)
    except Exception as e:
        print e
    # return render(request, 'index.html', locals())
    return HttpResponseRedirect('/main/')
