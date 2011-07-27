From: "Koul, Vinod" <vinod.koul@intel.com>
Subject: RE: linux-next: manual merge of the slave-dma tree with Linus' tree
Date: Wed, 27 Jul 2011 21:55:44 +0530
Message-ID: <438BB0150E931F4B9CE701519A4463010871EAC8BD@bgsmsx502.gar.corp.intel.com>
References: <20110727120826.ea1227276707790e162dee18@canb.auug.org.au>
 <1311736331.1536.45.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:53036 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754649Ab1G0Q0H (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jul 2011 12:26:07 -0400
In-Reply-To: <1311736331.1536.45.camel@vkoul-udesk3>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, 'Grant Likely' <grant.likely@secretlab.ca>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>

PiANCj4gT24gV2VkLCAyMDExLTA3LTI3IGF0IDEyOjA4ICsxMDAwLCBTdGVwaGVuIFJvdGh3ZWxs
IHdyb3RlOg0KPiA+IEhpIFZpbm9kLA0KPiA+DQo+ID4gVG9kYXkncyBsaW51eC1uZXh0IG1lcmdl
IG9mIHRoZSBzbGF2ZS1kbWEgdHJlZSBnb3QgYSBjb25mbGljdCBpbg0KPiA+IGRyaXZlcnMvc3Bp
L3NwaS1wbDAyMi5jIChjYWxsZWQgZHJpdmVycy9zcGkvYW1iYS1wbDAyMi5jIGluIHRoZSBzbGVh
di1kbWENCj4gPiB0cmVlKSBiZXR3ZWVuIGNvbW1pdCAwODNiZTNmMDUzNzEgKCJzcGkvcGwwMjI6
IGluaXRpYWxpemUgYnVyc3RzaXplIGZyb20NCj4gPiBGSUZPIHRyaWdnZXIgbGV2ZWwiKSBmcm9t
IExpbnVzJyB0cmVlIGFuZCBjb21taXQgMDAxYjA1ODVmZjE2ICgiSW1wcm92ZQ0KPiA+IHNsYXZl
L2N5Y2xpYyBETUEgZW5naW5lIGRvY3VtZW50YXRpb24iKSBmcm9tIHRoZSBzbGF2ZS1kbWEgdHJl
ZS4NCj4gPg0KPiA+IEkgZml4ZWQgaXQgdXAgKHNlZSBiZWxvdykgYW5jIGFjbiBjYXJyeSB0aGUg
Zml4IGFzIG5lY2Vzc2FyeS4NCj4gDQo+IFRoZSBjb3JyZWN0IGZpeCB3b3VsZCBiZToNCj4gDQo+
IGRpZmYgLS1jYyBkcml2ZXJzL3NwaS9zcGktcGwwMjIuYw0KPiBpbmRleCBlYmE4OGM3LDk5ZTc4
ODAuLjAwMDAwMDANCj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLXBsMDIyLmMNCj4gKysrIGIvZHJp
dmVycy9zcGkvc3BpLXBsMDIyLmMNCj4gQEBAIC05MTAsMTEgLTkwOCwxMSArOTEwLDkgQEBAIHN0
YXRpYyBpbnQgY29uZmlndXJlX2RtYShzdHJ1Y3QgcGwwMjIgKg0KPiAgIHsNCj4gICAgICAgICBz
dHJ1Y3QgZG1hX3NsYXZlX2NvbmZpZyByeF9jb25mID0gew0KPiAgICAgICAgICAgICAgICAgLnNy
Y19hZGRyID0gU1NQX0RSKHBsMDIyLT5waHliYXNlKSwNCj4gKwkJCS5kaXJlY3Rpb24gPSBETUFf
VE9fREVWSUNFLA0KPiAgICAgICAgIH07DQo+ICAgICAgICAgc3RydWN0IGRtYV9zbGF2ZV9jb25m
aWcgdHhfY29uZiA9IHsNCj4gICAgICAgICAgICAgICAgIC5kc3RfYWRkciA9IFNTUF9EUihwbDAy
Mi0+cGh5YmFzZSksDQo+ICAgICAgICAgICAgICAgICAuZGlyZWN0aW9uID0gRE1BX1RPX0RFVklD
RSwNCj4gIC0gICAgICAgICAgICAgIC5kc3RfbWF4YnVyc3QgPSBwbDAyMi0+dmVuZG9yLT5maWZv
ZGVwdGggPj4gMSwNCj4gICAgICAgICB9Ow0KPiAgICAgICAgIHVuc2lnbmVkIGludCBwYWdlczsN
Cj4gICAgICAgICBpbnQgcmV0Ow0KPiANCkdyYW50LCBSdXNzZWxsLA0KQ2FuIHlvdSBwbGVhc2Ug
YWNrIHRoaXMgZml4IGJlZm9yZSBJIGFwcGx5IGluIG15IHRyZWUgdG8gcmVzb2x2ZSB0aGlzIGNv
bmZsaWN0DQoNCn5WaW5vZA0KDQoNCg==
