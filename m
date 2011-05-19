From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Thu, 19 May 2011 18:22:59 +0200
Message-ID: <BANLkTim7ZPr5xazm3R+DzXufaH03Zzur1Q@mail.gmail.com>
References: <20110518114912.dfdf8835.sfr@canb.auug.org.au>
	<1305684362.2856.349.camel@haakon2.linux-iscsi.org>
	<20110518135823.a809f829.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:52940 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932238Ab1ESQXB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 May 2011 12:23:01 -0400
In-Reply-To: <20110518135823.a809f829.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kiran Patil <kiran.patil@intel.com>, Joe Eykholt <jeykholt@cisco.com>, Christoph Hellwig <hch@lst.de>, Yi Zou <yi.zou@intel.com>

T24gV2VkLCBNYXkgMTgsIDIwMTEgYXQgMDU6NTgsIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5i
LmF1dWcub3JnLmF1PiB3cm90ZToKPj4gLS0tIGEvZHJpdmVycy90YXJnZXQvdGNtX2ZjL3RmY19p
by5jCj4+ICsrKyBiL2RyaXZlcnMvdGFyZ2V0L3RjbV9mYy90ZmNfaW8uYwo+PiBAQCAtMjA2LDcg
KzIwNiw4IEBAIGludCBmdF9xdWV1ZV9kYXRhX2luKHN0cnVjdCBzZV9jbWQgKnNlX2NtZCkKPj4g
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgInhpZCA8MHgleD4sIHJlbWFpbmluZyA8MHgleD4sICIKPj4gwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgImxzb19tYXggPDB4JXg+XG4iLAo+PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBfX2Z1bmNfXywg
ZnAsIGVwLT54aWQsCj4+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVtYWluaW5nLCBscG9ydC0+bHNvX21heCk7
Cj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKHVuc2lnbmVkIGludClyZW1haW5pbmcsCj4+ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgbHBvcnQtPmxzb19tYXgpOwo+Cj4gR2l2ZW4gdGhhdCAicmVtYWluaW5nIiByZWFsbHkgaXMg
YSBsZW5ndGgsIHN1cmVseSBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvCgpFeGFjdGx5IG15IGNvbW1l
bnRzIC4uLgoKPiBwcmludCBpdCB3aXRoICV6ZCB0aGFuIHRvIGNhc3QgaXQgYW5kIHByaW50IGl0
IHdpdGggJXggLi4uCgouLi4gZXhjZXB0IHRoYXQgc2l6ZV90IGlzIHVuc2lnbmVkLCBzbyAlenUg
d291bGQgYmUgYSBsaXR0bGUgYml0IGJldHRlci4KCkdye29ldGplLGVldGluZ31zLAoKwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIMKgwqAgLS0gTGludXMgVG9ydmFs
ZHMK
