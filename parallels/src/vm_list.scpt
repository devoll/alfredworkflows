JsOsaDAS1.001.00bplist00�Vscript_avar app = Application.currentApplication();
app.includeStandardAdditions = true;
//app.displayNotification('Hello, world', {withTitle: 'Title'});

var menuitem = '<?xml version="1.0"?>\n'
				+ '<items>\n';

var vms = JSON.parse(app.doShellScript('/usr/local/bin/prlctl list --all -j'));

vms.forEach(function(vm){
	menuitem += '<item uid="' + vm.uuid + '" autocomplete="' + vm.name + '">\n'
				+ '<title>' + vm.name + '</title>\n'
				+ '<subtitle>' + vm.status + '</subtitle>\n'
				+ '<arg>' + JSON.stringify(vm) + '</arg>\n'
				+ '<icon>pvm.icns</icon>'
				+ '</item>\n';
});

menuitem += '</items>\n';                              w jscr  ��ޭ