From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: RE: arc build failures in -next due to ARCv2 patch
Date: Sat, 27 Jun 2015 11:42:55 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075665A8A84@IN01WEMBXB.internal.synopsys.com>
References: <558DE739.4020804@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_C2D7FE5348E1B147BCA15975FBA23075665A8A84IN01WEMBXBinter_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay4.synopsys.com ([198.182.47.9]:35355 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753005AbbF0LnA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 27 Jun 2015 07:43:00 -0400
In-Reply-To: <558DE739.4020804@roeck-us.net>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <private@roeck-us.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: "arc-linux-dev@synopsys.com" <arc-linux-dev@synopsys.com>

--_002_C2D7FE5348E1B147BCA15975FBA23075665A8A84IN01WEMBXBinter_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

hi,=0A=
=0A=
Sorry for top posting / html - web client access from home.=0A=
Thx for reporting the issue - I have pushed a fix (also attached) which shd=
 cure it (don't have exactly similar oldish gcc at hand).=0A=
This slipped thru the cracks as newer gcc for legacy ARCompact can still to=
lerate the new toggles.=0A=
=0A=
I will get back to you on Monday about how to go about including support fo=
r a newer gcc for ARCv2 build test as well.=0A=
=0A=
Thx,=0A=
-Vineet=0A=
________________________________________=0A=
From: Guenter Roeck [private@roeck-us.net]=0A=
Sent: Saturday, June 27, 2015 5:28 AM=0A=
To: linux-next@vger.kernel.org=0A=
Cc: Vineet Gupta=0A=
Subject: arc build failures in -next due to ARCv2 patch=0A=
=0A=
Hi,=0A=
=0A=
my arc test builds in -next now fail with=0A=
=0A=
cc1: error: unrecognized command line option "-mno-ll64"=0A=
make[2]: *** [scripts/mod/empty.o] Error 1=0A=
make[1]: *** [scripts/mod] Error 2=0A=
make[1]: *** Waiting for unfinished jobs....=0A=
cc1: error: unrecognized command line option "-mno-ll64"=0A=
make[1]: *** [kernel/bounds.s] Error 1=0A=
=0A=
due to commit 'ARCv2: Support for ARCv2 ISA and HS38x cores'.=0A=
=0A=
This is with gcc 4.8.3 built from buildroot.=0A=
=0A=
Do I now need a new compiler / toolchain to build the kernel ?=0A=
Any chance to make this change compatible to work with older=0A=
compilers ?=0A=
=0A=
Thanks,=0A=
Guenter=0A=
=0A=

--_002_C2D7FE5348E1B147BCA15975FBA23075665A8A84IN01WEMBXBinter_
Content-Type: text/x-patch;
	name="0001-ARCv2-Allow-older-gcc-to-cope-with-new-regime-of-ARC.patch"
Content-Description: 0001-ARCv2-Allow-older-gcc-to-cope-with-new-regime-of-ARC.patch
Content-Disposition: attachment;
	filename="0001-ARCv2-Allow-older-gcc-to-cope-with-new-regime-of-ARC.patch";
	size=1080; creation-date="Sat, 27 Jun 2015 11:41:27 GMT";
	modification-date="Sat, 27 Jun 2015 11:41:27 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyMTAwMDcyMWFmNWJkNjVhMmQ3NzcyNWMwZDdmZmM5ZWY2MmMwZTNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaW5lZXQgR3VwdGEgPHZndXB0YUBzeW5vcHN5cy5jb20+CkRh
dGU6IFNhdCwgMjcgSnVuIDIwMTUgMTY6NTY6NDEgKzA1MzAKU3ViamVjdDogW1BBVENIXSBBUkN2
MjogQWxsb3cgb2xkZXIgZ2NjIHRvIGNvcGUgd2l0aCBuZXcgcmVnaW1lIG9mCiBBUkN2Mi9BUkNv
bXBhY3Qgc3VwcG9ydAoKLW5vLWxsNjQgaXMgc3BlY2lmaWMgdG8gQVJDdjIgSVNBLCBhbmQgaXMg
b2J2aW91c2x5IG5vdCBzdXBwb3J0ZWQgYnkKb2xkZXIgQVJDIGdjYyAtIGluIHRoaXMgY2FzZSB0
aGUgb25lIGhvc3RlZCBieSBsaW51eC1uZXh0IHNhbml0eSBidWlsZApzZXJ2aWNlLgoKRW5zdXJl
IHRoYXQgdG9nZ2xlIG9ubHkgZ2V0cyBpbmNsdWRlZCBmb3IgSVNBX0FSQ09NUEFDVCB3aGljaCBp
cyBkZWZhdWx0CmZvciBub3cuCgpSZXBvcnRlZC1ieTogR3VlbnRlciBSb2VjayA8cHJpdmF0ZUBy
b2Vjay11cy5uZXQ+ClNpZ25lZC1vZmYtYnk6IFZpbmVldCBHdXB0YSA8dmd1cHRhQHN5bm9wc3lz
LmNvbT4KLS0tCiBhcmNoL2FyYy9NYWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJjL01ha2VmaWxl
IGIvYXJjaC9hcmMvTWFrZWZpbGUKaW5kZXggYmY2OGRjNWEwOGJlLi5kZmNmMjU2OTk2NmMgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJjL01ha2VmaWxlCisrKyBiL2FyY2gvYXJjL01ha2VmaWxlCkBAIC0z
Nyw3ICszNyw3IEBAIGNmbGFncy0kKENPTkZJR19BUkNfSEFTX0xMU0MpCQkrPSAtbWxvY2sKIGNm
bGFncy0kKENPTkZJR19BUkNfSEFTX1NXQVBFKQkJKz0gLW1zd2FwZQogCiBpZm5kZWYgQ09ORklH
X0FSQ19IQVNfTEw2NAotY2ZsYWdzLXkJCQkJKz0gLW1uby1sbDY0CitjZmxhZ3MtJHtDT05GSUdf
SVNBX0FSQ1YyfQkJKz0gLW1uby1sbDY0CiBlbmRpZgogCiBjZmxhZ3MtJChDT05GSUdfQVJDX0RX
Ml9VTldJTkQpCQkrPSAtZmFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzCi0tIAoxLjkuMQoK

--_002_C2D7FE5348E1B147BCA15975FBA23075665A8A84IN01WEMBXBinter_--
