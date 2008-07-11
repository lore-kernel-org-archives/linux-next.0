From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: today's linux-next fails to boot
Date: Fri, 11 Jul 2008 17:00:42 +0200
Message-ID: <19f34abd0807110800o5b283f00n4be7449ed3b06e5a@mail.gmail.com>
References: <4877400B.1000400@gmail.com> <s5hy747rvpr.wl%tiwai@suse.de>
	 <48775C69.6050107@gmail.com> <20080711135937.GA25004@elte.hu>
	 <487772B6.4090100@gmail.com>
	 <19f34abd0807110754n1a095671ua9132471b6a81540@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-next-owner@vger.kernel.org>
Received: from py-out-1112.google.com ([64.233.166.183]:51090 "EHLO
	py-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470AbYGKPAo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jul 2008 11:00:44 -0400
Received: by py-out-1112.google.com with SMTP id p76so2196632pyb.10
        for <linux-next@vger.kernel.org>; Fri, 11 Jul 2008 08:00:43 -0700 (PDT)
In-Reply-To: <19f34abd0807110754n1a095671ua9132471b6a81540@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?Q?T=C3=B6r=C3=B6k_Edwin?= <edwintorok@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

PiBPbiBGcmksIEp1bCAxMSwgMjAwOCBhdCA0OjQ4IFBNLCBUw7Zyw7ZrIEVkd2luIDxlZHdpbnRv
cm9rQGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiBPbmUgcmVhbGx5IHNpbXBsZSB3YXkgb2YgZ2V0dGlu
ZyBzb21lIG1vcmUgaW5mbyBvdXQgb2YgdGhpcyBpcyB0byB0YWtlCj4+PiB0aGUgRUlQIHZhbHVl
IChoZXJlIGMwMTgxY2EwKSBhbmQgcnVuIGl0IHRocm91Z2ggYWRkcjJsaW5lOgo+Pj4KPj4+ICAg
ICAkIGFkZHIybGluZSAtZSB2bWxpbnV4IC1pIGMwMTgxY2EwCj4+Cj4+IFRoYW5rcyBmb3IgdGhl
IGhpbnQsIEkgcmVidWlsdCBhIGZhaWxpbmcga2VybmVsLCBhbmQgdGhpcyBpcyB3aGF0Cj4+IGFk
ZHIybGluZSBzYXlzOgo+Pgo+PiAkIGFkZHIybGluZSAtZSB2bWxpbnV4IC1pIGMwMTgxY2EwCj4+
Cj4+ID8/OjAKPj4gJCBhZGRyMmxpbmUgLWUgdm1saW51eCAtZiBjMDE4MWNhMAo+PiBrbWVtX2Nh
Y2hlX2FsbG9jCj4+ID8/OjAKCkJUVywgZGlkIHRoZSBuZXcga2VybmVsIGZhaWwgaW4gZXhhY3Rs
eSB0aGUgc2FtZSBwbGFjZT8gSWYgbm90LCB5b3UKc2hvdWxkIGFsc28gcmVwbGFjZSB0aGUgRUlQ
IGluIHRoZSBuZXcgY3Jhc2ggcmVwb3J0IG9uIHRoZSBhZGRyMmxpbmUKY29tbWFuZCBsaW5lLCBz
byBpbiBnZW5lcmFsOiBhZGRyMmxpbmUgLWUgdm1saW51eCAtZiAtaSA8RUlQIGhlcmU+LgoKKEkg
ZG9uJ3QgdGhpbmsgaXQgcmVhbGx5IG1ha2VzIHNlbnNlIGZvciB0aGUga2VybmVsIHRvIGNyYXNo
IGluCmttZW1fY2FjaGVfYWxsb2MoKSB0aGlzIGVhcmx5IGluIHRoZSBib290IHByb2Nlc3MsIHNv
IEknbSBndWVzc2luZyB5b3UKaGF2ZSBhIGRpZmZlcmVudCBFSVAuKQoKKEFsc28gZG9uJ3QgcmVi
dWlsZCBhIGJhZCBrZXJuZWwganVzdCB0byB0cnkgdGhpcyBvdXQgYWdhaW4sIGJ1dCBpZgp5b3Ug
aGFwcGVuIHRvIHJ1biBhY3Jvc3MgYW5vdGhlciBiYWQgb25lIGZvciBleGFtcGxlIGR1cmluZyBi
aXNlY3Rpb24sCnlvdSBjYW4gdHJ5IGl0IHRoZW4uKQoKClZlZ2FyZAoKLS0gCiJUaGUgYW5pbWlz
dGljIG1ldGFwaG9yIG9mIHRoZSBidWcgdGhhdCBtYWxpY2lvdXNseSBzbmVha2VkIGluIHdoaWxl
CnRoZSBwcm9ncmFtbWVyIHdhcyBub3QgbG9va2luZyBpcyBpbnRlbGxlY3R1YWxseSBkaXNob25l
c3QgYXMgaXQKZGlzZ3Vpc2VzIHRoYXQgdGhlIGVycm9yIGlzIHRoZSBwcm9ncmFtbWVyJ3Mgb3du
IGNyZWF0aW9uLiIKCS0tIEUuIFcuIERpamtzdHJhLCBFV0QxMDM2Cg==
