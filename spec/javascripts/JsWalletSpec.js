describe("JsWallet", function() {
    var expectedPtext1 = [ { category : '', details : '', login : '', name : 'Example Name', password : '', url : '' } ];

    it ("decrypts a known value", function() {
	var deferredResult = null;
	runs(function() {
	    var salt = "664f516d251f9de3";
	    var ctext = "53ffb2a5ef8ff1f8a83a31fbb28c4424be8e793b196bfd3d7e9066c40b175737363bc1f0260f43d74a007dc99f9797d129fbce0ab143655df26949bf7a19fe9301c77b541d2f97fce8ad56106ac775def9404ef6d03a383b988e4ce6d05757a0";
	    JsWallet.decryptRaw("secret", 2, 10, ctext, salt, {
		onDecrypt: function(ptext) {
		    deferredResult = { ptext: ptext };
		}
	    });
	});
	waitsFor(function() { return deferredResult; }, "should set ptext", 250);
	runs(function() {
	    expect(deferredResult.ptext).toEqual(expectedPtext1);
	});
    });

    it ("returns null for bad password", function() {
	throw("unimplemented");
    });
});