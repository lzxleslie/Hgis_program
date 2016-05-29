var carto = require('carto');
var fs=require('fs');
var path = require('path');
var yaml = require('js-yaml');
_ = require('lodash');
var input = 'project.mml';
var ext = path.extname(input);
var existsSync = require('fs').existsSync || require('path').existsSync;

if (!ext) {
    console.error("carto: please pass either a .mml file or .mss file");
    process.exit(1);
}

if (!existsSync(input)) {
    console.error("carto: file does not exist: '" + input + "'");
    process.exit(1);
}
else {
  //console.log(input);
}

function compileMML(err, data) {
    // force drain the millstone download pool now
    // to ensure we can exit without waiting
    if (err) {
        console.error(err);
        process.exit(1);
    }
    var renderer = new carto.Renderer({
        filename: input
    });
    try {
        var output = renderer.render(data);
    } catch (e) {
        if (e.stack) {
            console.error(e.stack);
        } else if (e.message) {
            console.error(e.message);
        }
        else {
            console.error(e);
        }
        process.exit(1);
    }
    fs.writeFile('../upload/style/whu.xml',output,'utf-8');
    console.log('SUCCESS');
};
try {
    var data = fs.readFileSync(input, 'utf-8');
    //console.log(data);
} catch(err) {
    console.error("carto: " + err.message.replace(/^[A-Z]+, /, ''));
    process.exit(1);
}
try {
    data = yaml.safeLoad(data);
} catch(err) {
    console.error("carto: " + err.message.replace(/^[A-Z]+, /, ''));
    process.exit(1);
}
data.Stylesheet = _.castArray(data.Stylesheet);
data.Stylesheet = data.Stylesheet.map(function(x) {
    if (typeof x !== 'string') {
        return { id: x, data: x.data }
    }
    return { id: x, data: fs.readFileSync(path.join(path.dirname(input), x), 'utf8') }
});
compileMML(null,data);
