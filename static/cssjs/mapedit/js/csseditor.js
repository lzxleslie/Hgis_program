(function() {
    // var map = CodeMirror.keyMap.["default"];
    // var cmds = CodeMirror.commands;
    // var Pos = codeMirror.Pos;
    // var mac = CodeMirror.keyMap["default"] == CodeMirror.keyMap.macDefault;
    // var ctrl = mac ? "Cmd-" : "Ctrl-";
    // cmds[map["Crtl-M"]="runkey"];
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
    codeMirror.setOption("extraKeys", {
      Crtl: function(cm) {
      alert("");
    }
  });
    // codeMirror.on('change', function (a, b) {
        // console.log(b);
    // })
})();
