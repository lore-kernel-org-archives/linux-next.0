From: Ken Lewis <kennylewis@gmail.com>
Subject: [Patch 1/1] rt2x00lib.h has wrong headers
Date: Sat, 12 Sep 2009 09:18:07 +0100
Message-ID: <5a44caba0909120118q2f2eba89oba6fb07e3235669d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016e6d99d9f91de0604735d12ce
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f206.google.com ([209.85.219.206]:62299 "EHLO
	mail-ew0-f206.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097AbZILISE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 12 Sep 2009 04:18:04 -0400
Received: by mail-ew0-f206.google.com with SMTP id 2so1691965ewy.17
        for <linux-next@vger.kernel.org>; Sat, 12 Sep 2009 01:18:07 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

--0016e6d99d9f91de0604735d12ce
Content-Type: text/plain; charset=ISO-8859-1

Patch for net/drivers/wireless/rt2x00/rt2x00lib.h correct -- the
headers don't match the function as used in rt2x00crypto.c

I've had this problem since next-20090903 and it is resolved by the patch

--0016e6d99d9f91de0604735d12ce
Content-Type: text/x-diff; charset=US-ASCII; name="diff-fix-for-rt2x00lib.h.patch"
Content-Disposition: attachment; filename="diff-fix-for-rt2x00lib.h.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fzi33wo60

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3J0MngwMC9ydDJ4MDBsaWIuaCBiL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL3J0MngwMC9ydDJ4MDBsaWIuaAppbmRleCA1NDYyY2I1Li41Njdm
MDI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9ydDJ4MDAvcnQyeDAwbGliLmgK
KysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvcnQyeDAwL3J0MngwMGxpYi5oCkBAIC0zODAsNyAr
MzgwLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHJ0MngwMGNyeXB0b190eF9pbnNlcnRfaXYoc3Ry
dWN0IHNrX2J1ZmYgKnNrYiwKIHsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIHJ0MngwMGNyeXB0
b19yeF9pbnNlcnRfaXYoc3RydWN0IHNrX2J1ZmYgKnNrYiwgYm9vbCBsMnBhZCwKK3N0YXRpYyBp
bmxpbmUgdm9pZCBydDJ4MDBjcnlwdG9fcnhfaW5zZXJ0X2l2KHN0cnVjdCBza19idWZmICpza2Is
CiAJCQkJCSAgICAgdW5zaWduZWQgaW50IGhlYWRlcl9sZW5ndGgsCiAJCQkJCSAgICAgc3RydWN0
IHJ4ZG9uZV9lbnRyeV9kZXNjICpyeGRlc2MpCiB7Cg==
--0016e6d99d9f91de0604735d12ce--
