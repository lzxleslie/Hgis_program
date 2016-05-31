(function() {
  var map = CodeMirror.keyMap['default'];
    var cmds = CodeMirror.commands;
    var Pos = CodeMirror.Pos;
    var mac = CodeMirror.keyMap["default"] == CodeMirror.keyMap.macDefault;
    var ctrl = mac ? "Cmd-" : "Ctrl-";
    cmds[map[ctrl + "Up"] = "godocstart"] = function(cm){cm.execCommand("goDocStart");};
    cmds[map[ctrl + "Down"] = "godocend"] = function(cm){cm.execCommand("goDocEnd");};
    cmds[map[ctrl + "S"] = "submit"] = function(cm){$('#editorform').submit();};
    var txtArea = document.getElementById('mssStyle');
    var codeMirror = CodeMirror.fromTextArea(txtArea, {
        mode: "css",
        styleActiveLine: true,
        lineWrapping:true,
        auto:'auto',
        tabMode: 'shift',
        lineNumbers: true,
        smartIndent: true,
        tabSize: 2,
        autoMatchParens: true
    });
     //codeMirror.on('cursorActivity', function (a) {
        //console.log(a.cursorCoords());
        //$('#colorpicker').css(a.cursorCoords());
     //});
     $('.demo').each( function() {
         //
         // Dear reader, it's actually very easy to initialize MiniColors. For example:
         //
         //  $(selector).minicolors();
         //
         // The way I've done it below is just for the demo, so don't get confused
         // by it. Also, data- attributes aren't supported at this time...they're
         // only used for this demo.
         //
         $(this).minicolors({
             control: $(this).attr('data-control') || 'hue',
             defaultValue: $(this).attr('data-defaultValue') || '',
             format: $(this).attr('data-format') || 'hex',
             keywords: $(this).attr('data-keywords') || '',
             inline: $(this).attr('data-inline') === 'true',
             letterCase: $(this).attr('data-letterCase') || 'lowercase',
             opacity: $(this).attr('data-opacity'),
             position: $(this).attr('data-position') || 'bottom left',
             swatches: $(this).attr('data-swatches') ? $(this).attr('data-swatches').split('|') : [],
             change: function(value, opacity) {
                 if( !value ) return;
                 if( opacity ) value += ', ' + opacity;
                 if( typeof console === 'object' ) {
                     //console.log(value);
                 }
             },
             theme: 'bootstrap'
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
     });
})();
