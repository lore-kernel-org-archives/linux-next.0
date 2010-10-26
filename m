From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: linux-next: build warnings after merge of the final tree (mtd
 tree related)
Date: Tue, 26 Oct 2010 11:43:34 -0500
Message-ID: <0D753D10438DA54287A00B027084269764818E2136@AUSP01VMBX24.collaborationhost.net>
References: <20101026134959.86b807d1.sfr@canb.auug.org.au>
	 <1288083108.29264.14.camel@macbook.infradead.org>
 <1288090180.29264.26.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-next-owner@vger.kernel.org>
Received: from p01c12o148.mxlogic.net ([208.65.145.71]:45279 "EHLO
	p01c12o148.mxlogic.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760082Ab0JZQxo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2010 12:53:44 -0400
In-Reply-To: <1288090180.29264.26.camel@macbook.infradead.org>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

T24gVHVlc2RheSwgT2N0b2JlciAyNiwgMjAxMCAzOjUwIEFNLCBEYXZpZCBXb29kaG91c2Ugd3Jv
dGU6DQo+IE9uIFR1ZSwgMjAxMC0xMC0yNiBhdCAwOTo1MSArMDEwMCwgRGF2aWQgV29vZGhvdXNl
IHdyb3RlOg0KPj4gT24gVHVlLCAyMDEwLTEwLTI2IGF0IDEzOjQ5ICsxMTAwLCBTdGVwaGVuIFJv
dGh3ZWxsIHdyb3RlOg0KPj4+IA0KPj4+IEkgYW0gbm90IHN1cmUgd2hlcmUgdGhlc2UgY2FtZSBm
cm9tIC4uLiANCj4+IA0KPj4gSXQncyBhIGNvbmZpZyBpc3N1ZS4gWW91IGhhdmUgY2hvc2VuIHRv
IGJ1aWxkIE5PUiBmbGFzaCBzdXBwb3J0Lg0KPj4gDQo+PiBOT1IgZmxhc2ggY2FuIGJlIHdpcmVk
IHVwIG1hbnkgd2F5cy4gSXQgY291bGQgYmUgZm91ciA4LWJpdCBjaGlwcyBpbg0KPj4gcGFyYWxs
ZWwgaW4gYSAzMi1iaXQgYnVzLCB0d28gMTYtYml0IGNoaXBzIGluIGEgMzItYml0IGJ1cywgMiA4
LWJpdA0KPj4gY2hpcHMgaW4gYSAxNi1iaXQgYnVzLCBvbmUgMTYtYml0IGNoaXAgaW4gYSAxNi1i
dXMgYnVzLCBldGMuLi4NCj4+IA0KPj4gWW91IGhhdmUgZWxlY3RlZCB0byBzdXBwb3J0ICpub25l
KiBvZiB0aG9zZSBjb25maWd1cmF0aW9ucy4gTm8gTk9SIGNoaXANCj4+IHN1cHBvcnQgY2FuIHdv
cmsuDQo+PiANCj4+IFlvdSBkb24ndCBnZXQgdG8gY2hvb3NlIGluZGl2aWR1YWwgZ2VvbWV0cnkg
b3B0aW9ucyB1bmxlc3MgeW91IHNldA0KPj4gQ09ORklHX01URF9BRFZfT1BUSU9OUyAtLSBieSBk
ZWZhdWx0IHlvdSBnZXQgYSBmdWxseSB2ZXJzYXRpbGUgZHJpdmVyDQo+PiB3aGljaCBjYW4gY29w
ZSB3aXRoIGFueXRoaW5nIGF0IHJ1bnRpbWUuDQo+PiANCj4+IEknbGwgYnVpbGQgYSBwcGM0NHhf
ZGVmY29uZmlnIGFuZCB3b3JrIG91dCB3aGF0J3MgZ29pbmcgd3JvbmcuIEknZA0KPj4gZXhwZWN0
IHRoaXMga2luZCBvZiB0aGluZyB3aXRoIHJhbmRjb25maWcsIGJ1dCBub3QgYSBkZWZjb25maWcu
DQo+DQo+IEZpeGVkIGJ5IHJldmVydGluZyB0aGUgb2ZmZW5kaW5nIGNvbW1pdDoNCj4gaHR0cDov
L2dpdC5pbmZyYWRlYWQub3JnL210ZC0yLjYuZ2l0L2NvbW1pdGRpZmYvNjQxMWJmNmNkDQoNCkkg
ZGlkbid0IGZvbGxvdyB0aGUgbG9naWMgZm9yIHRoZSBNVERfTUFQX0JBTktfV0lEVEhfKiBhbGwg
dGhlIHdheSB0aHJ1Lg0KDQpIb25lc3RseSBJIHN0aWxsIGRvbid0IHF1aXRlIGdldCBpdC4gIElm
IE1URF9DRklfR0VPTUVUUlkgaXMgbiB3b3VsZG4ndA0KYWxsIHRoZSBNVERfTUFQX0JBTktfV0lE
VEhfKiBhbHNvIGJlIG4/DQoNClNvcnJ5IGFib3V0IHRoZSB0cm91YmxlLg0KDQpIYXJ0bGV5
