From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] sparc64: use unsigned long long for u64
Date: Sat, 27 Dec 2008 00:54:52 -0800 (PST)
Message-ID: <20081227.005452.261413194.davem@davemloft.net>
References: <20081222230035.GB4074@uranus.ravnborg.org>
	<20081222151338.3b6ef997.akpm@linux-foundation.org>
	<20081223131746.GA7456@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:41406
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751295AbYL0Iyu (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 27 Dec 2008 03:54:50 -0500
In-Reply-To: <20081223131746.GA7456@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sam@ravnborg.org
Cc: akpm@linux-foundation.org, sparclinux@vger.kernel.org, mingo@elte.hu, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, kenchen@google.com, paulus@samba.org, tglx@linutronix.de, hpa@zytor.com, linux-next@vger.kernel.org

RnJvbTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KRGF0ZTogVHVlLCAyMyBEZWMg
MjAwOCAxNDoxNzo0NiArMDEwMA0KDQo+IEl0IG1heSB0YWtlIGEgZmV3IGRheXMgYmVmb3JlIHRo
ZSBkcml2ZXJzIGdldHMgZml4ZWQuDQo+IENocmlzdG1hcyBpcyBhcHByb2FjaGluZyBmYXN0IGJ5
IG5vdy4NCg0KRXZlbiB3aXRoIHRoaXMgYW5kIHlvdXIgZHJpdmVyIHBhdGNoIGFwcGxpZWQsIHRo
ZSB0cmVlDQpkb2Vzbid0IGJ1aWxkIHN1Y2Nlc3NmdWxseToNCg0KY2MxOiB3YXJuaW5ncyBiZWlu
ZyB0cmVhdGVkIGFzIGVycm9ycw0KYXJjaC9zcGFyYy9rZXJuZWwvcHN5Y2hvX2NvbW1vbi5jOiBJ
biBmdW5jdGlvbiDigJhwc3ljaG9fY2hlY2tfc3RjX2Vycm9y4oCZOg0KYXJjaC9zcGFyYy9rZXJu
ZWwvcHN5Y2hvX2NvbW1vbi5jOjEwNDogd2FybmluZzogZm9ybWF0IOKAmCUwMTZseOKAmSBleHBl
Y3RzIHR5cGUg4oCYbG9uZyB1bnNpZ25lZCBpbnTigJksIGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBl
IOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnTigJkNCg0KRGlkIHlvdSByZW1vdmUgc3BhcmMncyAt
V2Vycm9yIHdoZW4gZG9pbmcgdGVzdCBidWlsZHMNCm9mIHRoZXNlIGNoYW5nZXM/IDotKQ0KDQpF
aXRoZXIgd2F5IHRoZXNlIG5lZWQgc29tZSB3b3JrIGJlZm9yZSB0aGV5IHNob3VsZCBiZQ0KYWRk
ZWQgdG8gYW55IHRyZWUuDQoNCkFuZHJldyB5b3UgcHJvYmFibHkgd2FudCB0byB0b3NzIHRoZXNl
IGZyb20geW91ciB0cmVlDQpzaW5jZSBhdCBhIG1pbmltdW0gdGhleSB3aWxsIGJyZWFrIHRoZSBz
cGFyYzY0IGJ1aWxkLg0KDQpTYW0gd2lsbCBmaXggdGhlbSB1cCBhbmQgcmVzdWJtaXQsIGFuZCBJ
J2xsIGFwcGx5IHRoZW0sDQpkb24ndCB3b3JyeS4gOikNCg0K
