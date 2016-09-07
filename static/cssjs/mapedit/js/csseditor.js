(function() {
  var map = CodeMirror.keyMap['default'];
    var cmds = CodeMirror.commands;
    var Pos = CodeMirror.Pos;
    var mac = CodeMirror.keyMap["default"] == CodeMirror.keyMap.macDefault;
    var ctrl = mac ? "Cmd-" : "Ctrl-";
    cmds[map[ctrl + "Up"] = "godocstart"] = function(cm){cm.execCommand("goDocStart");};
    cmds[map[ctrl + "Down"] = "godocend"] = function(cm){cm.execCommand("goDocEnd");};
    cmds[map[ctrl + "S"] = "submit"] = function(cm){$('#editorform').submit();window.localStorage['mssjson'] = JSON.stringify(mssInfo);codeMirror.setValue(jsonObjToMss(mssInfo));};
    var txtArea = document.getElementById('mssStyle');
    codeMirror = CodeMirror.fromTextArea(txtArea, {
        mode: "css",
        styleActiveLine: true,
        lineWrapping:true,
        auto:'auto',
        tabMode: 'shift',
        lineNumbers: true,
        smartIndent: true,
        tabSize: 2,
        autoMatchParens: true,
        theme:'default',
        matchBrackets: true
    });
    $('input').bind("input propertychange",function(){
      console.log('change');
      uiTocode_3($(this).attr('geotype'));
      console.log(JSON.stringify(mssInfo));
      codeMirror.setValue(jsonObjToMss(mssInfo));
      // $('#mssStyle').text();
    });
    $('.color_picker').each( function() {
      var thisInput = $(this);
      thisInput.ColorPicker({
            onSubmit: function(hsb, hex, rgb, el) {
              $(el).val(hex);
              $(el).ColorPickerHide();
            },
            onBeforeShow: function () {
              $(this).ColorPickerSetColor(this.value);
            },
            onChange: function (hsb, hex, rgb) {
              thisInput.val('rgb('+rgb.r+','+rgb.g+','+rgb.b+')');
              uiTocode_3(thisInput.attr('geotype'));

              codeMirror.setValue(jsonObjToMss(mssInfo));
              console.log(JSON.stringify(mssInfo));
            }
          })
    });
     $(this).keydown(function(event){
       if(event.which==13)
       {
         //var cur = codeMirror.getCursor();
         var value = $(this).val();
         if(codeMirror.somethingSelected())
         {
           codeMirror.replaceSelection(value);
         }
       }
     });
})();
