From: Bart Van Assche <Bart.VanAssche@wdc.com>
Subject: Re: [BUG][bisected 270065e] linux-next fails to boot on powerpc
Date: Wed, 16 Aug 2017 17:21:14 +0000
Message-ID: <1502904072.2421.3.camel@wdc.com>
References: <1502902815.3305.22.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-next-owner@vger.kernel.org>
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:39003 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753021AbdHPRWB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Aug 2017 13:22:01 -0400
In-Reply-To: <1502902815.3305.22.camel@abdul.in.ibm.com>
Content-Language: en-US
Content-ID: <2D9121FA36D9FF4BBCD8394C5C05648C@namprd04.prod.outlook.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@lst.de" <hch@lst.de>, "brking@linux.vnet.ibm.com" <brking@linux.vnet.ibm.com>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "sachinp@linux.vnet.ibm.com" <sachinp@linux.vnet.ibm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "hare@suse.com" <hare@suse.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>

T24gV2VkLCAyMDE3LTA4LTE2IGF0IDIyOjMwICswNTMwLCBBYmR1bCBIYWxlZW0gd3JvdGU6DQo+
IEFzIG9mIG5leHQtMjAxNzA4MDksIGxpbnV4LW5leHQgb24gcG93ZXJwYyBib290IGh1bmcgd2l0
aCBiZWxvdyB0cmFjZQ0KPiBtZXNzYWdlLg0KPiANCj4gWyAuLi4gXQ0KPiANCj4gQSBiaXNlY3Rp
b24gcmVzdWx0ZWQgaW4gZmlyc3QgYmFkIGNvbW1pdCAoMjcwMDY1ZTkyIC0gc2NzaTogc2NzaS1t
cToNCj4gQWx3YXlzIHVucHJlcGFyZSAuLi4pIGluIHRoZSBtZXJnZSBicmFuY2ggJ3Njc2kvZm9y
LW5leHQnDQo+IA0KPiBTeXN0ZW0gYm9vdGVkIGZpbmUgd2hlbiB0aGUgYmVsb3cgY29tbWl0IGlz
IHJldmVydGVkOiANCj4gDQo+IGNvbW1pdCAyNzAwNjVlOTJjMzE3ODQ1ZDY5MDk1ZWM4ZTNkMTg2
MTZiNWIzOWQ1DQo+IEF1dGhvcjogQmFydCBWYW4gQXNzY2hlIDxiYXJ0LnZhbmFzc2NoZUB3ZGMu
Y29tPg0KPiBEYXRlOiAgIFRodSBBdWcgMyAxNDo0MDoxNCAyMDE3IC0wNzAwDQo+IA0KPiAgICAg
c2NzaTogc2NzaS1tcTogQWx3YXlzIHVucHJlcGFyZSBiZWZvcmUgcmVxdWV1aW5nIGEgcmVxdWVz
dA0KDQpIZWxsbyBCcmlhbiBhbmQgTWljaGFlbCwNCg0KRG8geW91IGFncmVlIHRoYXQgdGhpcyBw
cm9iYWJseSBpbmRpY2F0ZXMgYSBidWcgaW4gdGhlIFBvd2VyUEMgYmxvY2sgZHJpdmVyDQp0aGF0
IGlzIHVzZWQgdG8gYWNjZXNzIHRoZSBib290IGRpc2s/IEFueXdheSwgc2luY2UgYSBzb2x1dGlv
biBpcyBub3QgeWV0DQphdmFpbGFibGUsIEkgd2lsbCBzdWJtaXQgYSByZXZlcnQgZm9yIHRoaXMg
cGF0Y2guDQoNCkJhcnQu
