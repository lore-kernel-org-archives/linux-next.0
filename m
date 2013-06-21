From: "Anna, Suman" <s-anna@ti.com>
Subject: RE: linux-next: manual merge of the arm-soc tree with the mailbox
 tree
Date: Fri, 21 Jun 2013 16:39:57 +0000
Message-ID: <37C860A02101E749A747FA2D3C1E3C504CDAAE@DLEE11.ent.ti.com>
References: <20130621160800.64f9965229e5042a7b77e212@canb.auug.org.au>
 <20130621064526.GJ5523@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-next-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:51185 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161494Ab3FUQk3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Jun 2013 12:40:29 -0400
In-Reply-To: <20130621064526.GJ5523@atomide.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Lindgren <tony@atomide.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>

PiAqIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PiBbMTMwNjIwIDIzOjE0
XToNCj4gPiBIaSBhbGwsDQo+ID4NCj4gPiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2YgdGhl
IGFybS1zb2MgdHJlZSBnb3QgYSBjb25mbGljdCBpbg0KPiA+IGFyY2gvYXJtL21hY2gtb21hcDIv
ZGV2aWNlcy5jIGJldHdlZW4gY29tbWl0IDRhMWMwZTgzYmI0ZSAoIkFSTToNCj4gT01BUDIrOg0K
PiA+IG1ib3g6IHJlbW92ZSBkZXBlbmRlbmNpZXMgd2l0aCBzb2MuaCIpIGZyb20gdGhlIG1haWxi
b3ggdHJlZSBhbmQgY29tbWl0DQo+ID4gODJjNWNkZTFjNGIwICgiQVJNOiBPTUFQMis6IFJlbW92
ZSBvbWFwNCBvY3Ayc2NwIHBkYXRhIikgZnJvbSB0aGUgYXJtLQ0KPiBzb2MNCj4gPiB0cmVlLg0K
PiA+DQo+ID4gSSBmaXhlZCBpdCB1cCAocmVtb3ZpbmcgdGhlIGluY2x1ZGUgb2YNCj4gPiBsaW51
eC9wbGF0Zm9ybV9kYXRhL29tYXBfb2NwMnNjcC5oKSBhbmQgY2FuIGNhcnJ5IHRoZSBmaXggYXMg
bmVjZXNzYXJ5DQo+ID4gKG5vIGFjdGlvbiBpcyByZXF1aXJlZCkuDQo+IA0KPiBUaGFua3MsIHRo
YXQncyB0aGUgcmlnaHQgZml4IGFzIHRoYXQgaGVhZGVyIHdvbid0IGJlIG5lZWRlZCBhbnkgbG9u
Z2VyDQo+IGFzIHdlJ3ZlIG1hZGUgb21hcDQgZGV2aWNlIHRyZWUgb25seS4NCj4gDQo+ID4gVGhh
dCBtYWlsYm94IHRyZWUgY29tbWl0IGxvb2tzIHZlcnkgc2ltaWxhciB0byBjb21taXQgYjhhN2Nm
OGUyYjE1ICgiQVJNOg0KPiA+IE9NQVAyKzogbWJveDogcmVtb3ZlIGRlcGVuZGVuY2llcyB3aXRo
IHNvYy5oIikgZnJvbSB0aGUgYXJtLXNvYyB0cmVlIC4uLg0KPiANCj4gVGhlIGVhcmxpZXIgbWFp
bGJveCBicmFuY2ggd2FzIG1lcmdlZCBpbnRvIGFybS1zb2MgZm9yIGEgZmV3IHdlZWtzIHVudGls
DQo+IHdlIGRlY2lkZWQgdG8gZHJvcCBpdCBhcyBKYXNzaSBpcyB3b3JraW5nIG9uIGEgbW9yZSBn
ZW5lcmljIEFQSS4gVGhhdCB3YXMNCj4gbWVyZ2VkIGluIGNvbW1pdCA1MWI1Zjg5MywgdGhlbiBy
ZXZlcnRlZCBpbiBjb21taXQgYjVjODUxODYuIFRoZSB1cGRhdGVkDQo+IG1haWxib3ggYnJhbmNo
IGFjY291bnRzIGZvciB0aGUgZ2VuZXJpYyBBUEkgY29taW5nIHVwIGZyb20gSmFzc2kuDQo+IA0K
PiBTdW1hbiwgY2FuIHlvdSBwbGVhc2UgY2hlY2sgaWYgTGludXggbmV4dCBoYXMgbWFpbGJveCBy
ZWxhdGVkIGZpbGVzIG1lcmdlZA0KPiBjb3JyZWN0bHk/DQoNClllcywgdGhleSBsb29rIGdvb2Qu
DQoNClJlZ2FyZHMNClN1bWFuDQo=
