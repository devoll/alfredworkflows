JsOsaDAS1.001.00bplist00�Vscript_�var app = Application.currentApplication();
app.includeStandardAdditions = true;

ObjC.import('Foundation');
;
var args = $.NSProcessInfo.processInfo.arguments

// Build the normal argv/argc
var argv = [];
var argc = args.count; // -[NSArray count]

for (var i = 0; i < argc; i++) {
    argv.push( ObjC.unwrap( args.objectAtIndex(i) ) ); // -[NSArray objectAtIndex:]
}
delete args;

var query = argv[argv.length-1];

var vm = JSON.parse(query);

//app.displayAlert("Arguments: " + vm.status);

if(vm.status == "running"){
	app.doShellScript('/usr/local/bin/prlctl stop ' + vm.uuid);
}else{
	app.doShellScript('/usr/local/bin/prlctl start ' + vm.uuid);
}                              � jscr  ��ޭ