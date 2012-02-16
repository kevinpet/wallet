/* http://docs.angularjs.org/#!angular.filter */
angular.filter("dirtyTitle", function(vault) {
    return vault.resource.name + (vault.dirty ? "*" : "");
});
var expand = function(start, active) {
    return function(toggle) {
	if (toggle) {
	    return active;
	} else {
	    return start;
	}
    };
}
angular.filter("expandEdit", expand("Edit", "Done Editing"));
angular.filter("expandShow", expand("Show", "Hide"));