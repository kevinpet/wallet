JsWallet = {};
(function() {
    var KEY_SIZE = 256 / 8;
    var BLOCK_SIZE = 128 / 8;
    var MODE = slowAES.modeOfOperation.CBC;
    var progress = function(cb, category) {
	return function(p) {
	    var status = "PBKDF2 (" + category + ") at " + p.toFixed() + "%";
	    if (cb && cb.progress) {
		cb.onProgress(status);
	    } else {
		console.log(status);
	    }
	}
    };
    JsWallet.cryptoVersions = {
	aesWeak: { keyRounds: 10, ivRounds: 2 },
	aesStandard: { keyRounds: 500, ivRounds: 100 },
	aesParanoid: { keyRounds: 5000, ivRounds: 1000 }
    };
    var deriveKey = function(password, salt, keyRounds, ivRounds, cb) {
	var pbkdf2_key = new PBKDF2(password, salt, keyRounds, KEY_SIZE);
	var pbkdf2_iv = new PBKDF2(password, salt, ivRounds, BLOCK_SIZE);
	pbkdf2_key.deriveKey(progress(cb, "key"), function(key) {
	    pbkdf2_iv.deriveKey(progress(cb, "iv"), function(iv) {
		cb.onKeyCompletion(key, iv);
	    });
	});
    };
    JsWallet.log_bytes = function(desc, bytes) {
	console.log(desc + ": " + bytes);
    }
    JsWallet.getSalt = function() {
	var salt1 = cryptoHelpers.getRandom(0, 2147483647);
	var salt2 = cryptoHelpers.getRandom(0, 2147483647);
	return cryptoHelpers.toHex(salt1) + cryptoHelpers.toHex(salt2);
    }
    var decryptWithKey = function(key, iv, ctext) {
	var bytes = cryptoHelpers.toNumbers(ctext);
	var ptext = slowAES.decrypt(bytes, MODE, key, iv);
	var decoded = cryptoHelpers.convertByteArrayToString(ptext);
	try {
	    console.log(decoded);
	    // TODO: remove dependency on Angular
	    return angular.fromJson(decoded);
	} catch (e) {
	    return null;
	}
    };
    JsWallet.decryptRaw = function(password, ivRounds, keyRounds, ctext, salt, cb) {
	deriveKey(password, salt, keyRounds, ivRounds, {
	    onKeyCompletion: function(key, iv) {
		var ptext = decryptWithKey(key, iv, ctext);
		console.log(ptext);
		cb.onDecrypt(ptext);
	    }
	});
    }
})();