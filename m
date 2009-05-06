From: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>
Subject: RE: linux-next: IO BAR sizing warning
Date: Wed, 6 May 2009 12:03:00 -0600
Message-ID: <CAC4B8726E86A142B27A9E9A2F2F1247AB7A82A6@rrsmsx505.amr.corp.intel.com>
References: <20090506143007.c0ef2340.sfr@canb.auug.org.au>
	<4A013A70.30101@kernel.org>	<20090506092418.3fffab6b@hobbes>
	<CAC4B8726E86A142B27A9E9A2F2F1247AB7A8255@rrsmsx505.amr.corp.intel.com>
 <20090506110034.3c7d6e67@hobbes>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:28345 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750864AbZEFSDI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2009 14:03:08 -0400
In-Reply-To: <20090506110034.3c7d6e67@hobbes>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Yinghai Lu <yinghai@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

SWYgeW91J3JlIGdvaW5nIHRvIHNlbmQgZW1haWwgdG8gbXkgZXhjaGFuZ2UgYWNjb3VudCwgeW91
J2xsIGdldCB0b3AgcG9zdGluZy4gIFNlbmQgZW1haWwgdG8gb25lIG9mIG15IHJlYWwgYWNjb3Vu
dHMgaWYgeW91IHdhbnQgcHJvcGVyIGVtYWlsIGV0aXF1ZXR0ZS4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKZXNzZSBCYXJuZXMgW21haWx0bzpqYmFybmVzQHZpcnR1
b3VzZ2Vlay5vcmddDQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDA2LCAyMDA5IDExOjAxIEFNDQo+
IFRvOiBXaWxjb3gsIE1hdHRoZXcgUg0KPiBDYzogWWluZ2hhaSBMdTsgU3RlcGhlbiBSb3Rod2Vs
bDsgbGludXgtbmV4dEB2Z2VyLmtlcm5lbC5vcmc7IEJlbmphbWluDQo+IEhlcnJlbnNjaG1pZHQN
Cj4gU3ViamVjdDogUmU6IGxpbnV4LW5leHQ6IElPIEJBUiBzaXppbmcgd2FybmluZw0KPiANCj4g
T24gV2VkLCA2IE1heSAyMDA5IDExOjQxOjEyIC0wNjAwDQo+ICJXaWxjb3gsIE1hdHRoZXcgUiIg
PG1hdHRoZXcuci53aWxjb3hAaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+ID4gSSB0aGluayBQb3dl
clBDJ3MgSU9fU1BBQ0VfTElNSVQgaXMgZGVmaW5lZCBpbmNvcnJlY3RseS4NCj4gPg0KPiA+IE9u
IDY0LWJpdCwgaXQncyBjdXJyZW50bHkgc2V0IHRvIDB4ZmZmZidmZmZmJ2ZmZmYnZmZmZi4gIFRo
aXMgY2FuJ3QNCj4gPiBwb3NzaWJseSB3b3JrLCB0aGVyZSdzIG5vIHdheSBmb3IgdGhlIFBDSSBi
dXMgdG8gdHJhbnNtaXQgNjQtYml0DQo+ID4gSU8tcG9ydCBhZGRyZXNzZXMuICBJdCBzaG91bGQg
cHJvYmFibHkgYmUgZGVmaW5lZCB0bw0KPiA+DQo+ID4gMHhmZmZmZmZmZlUNCj4gDQo+IFRPUCBQ
T1NURVIhDQo+IA0KPiBCdXQgeWVhaCBvbiBhIGJ1cyBsZXZlbCBpdCBjbGVhcmx5IG5lZWRzIHRv
IGJlIGxpbWl0ZWQgdG8gMzIgYml0cywgYnV0DQo+IElTVFIgdGhhdCBzb21lIGFyY2hlcyB1c2Ug
dGhlIGhpZ2ggcmVzb3VyY2UgYml0cyBmb3IgdHJhY2tpbmcgSS9PDQo+IHJlc291cmNlcyBvbiBh
IHN5c3RlbXdpZGUgYmFzaXMgKHRvbyBsYXp5IHRvIGxvb2sgYXRtKS4NCj4gDQo+IFNvIGVpdGhl
ciB3ZSBuZWVkIHRvIHNwbGl0IHRoZSBkZWZpbml0aW9uIGJldHdlZW4gYnVzICYgcmVzb3VyY2Ug
dXNhZ2UsDQo+IG9yIGFkZCBhIGNhc3QgaGVyZS4uLg0KPiAtLQ0KPiBKZXNzZSBCYXJuZXMsIElu
dGVsIE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVyDQo=
