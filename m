From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: [squashfs-xz] 2.6.38?
Date: Tue, 11 Jan 2011 10:03:11 +0100
Message-ID: <AANLkTi=0xR7oPz5OZ9PKM9madm0RUU1-Lrgo9BCEPmZ_@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=000e0ce0da0a9d740d04998e5a63
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:47111 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753015Ab1AKJDM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Jan 2011 04:03:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>

--000e0ce0da0a9d740d04998e5a63
Content-Type: text/plain; charset=UTF-8

Hi,

it would be cool to see the squashfs-xz patches from [1] in 2.6.38?
A lot of distributions use it in combination with AUFS for their
Linux-live-systems.

I have pulled the squashfs-xz tree into linux-next (next-20110111) and
git could automagically solve the conflicts.
But I had to add attached fix.


Kind Regards,
- Sedat -


[1] http://git.kernel.org/?p=linux/kernel/git/pkl/squashfs-xz.git;a=summary

--000e0ce0da0a9d740d04998e5a63
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-squashfs-xz-Fix-misplaced-endif-after-merge.patch"
Content-Disposition: attachment;
	filename="0001-squashfs-xz-Fix-misplaced-endif-after-merge.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_giskp3ey0

RnJvbSBkODRlMGFlMjkzODIwMDBkNTRhYzFmMjlkOTA5OWM2MGNjZGZhMzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgpE
YXRlOiBUdWUsIDExIEphbiAyMDExIDA5OjE3OjM2ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gc3F1
YXNoZnMteHo6IEZpeCBtaXNwbGFjZWQgZW5kaWYgYWZ0ZXIgbWVyZ2UKCgpTaWduZWQtb2ZmLWJ5
OiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgotLS0KIGZzL3NxdWFzaGZzL2Rl
Y29tcHJlc3Nvci5jIHwgICAgMiArLQogMSBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvc3F1YXNoZnMvZGVjb21wcmVzc29yLmMg
Yi9mcy9zcXVhc2hmcy9kZWNvbXByZXNzb3IuYwppbmRleCBiN2I4YzQwLi5lMDNkZTBhIDEwMDY0
NAotLS0gYS9mcy9zcXVhc2hmcy9kZWNvbXByZXNzb3IuYworKysgYi9mcy9zcXVhc2hmcy9kZWNv
bXByZXNzb3IuYwpAQCAtNTksMTEgKzU5LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3F1YXNo
ZnNfZGVjb21wcmVzc29yICpkZWNvbXByZXNzb3JbXSA9IHsKIAkmc3F1YXNoZnNfemxpYl9jb21w
X29wcywKIAkmc3F1YXNoZnNfbHpvX2NvbXBfb3BzLAogCSZzcXVhc2hmc19sem1hX3Vuc3VwcG9y
dGVkX2NvbXBfb3BzLAotI2VuZGlmCiAjaWZkZWYgQ09ORklHX1NRVUFTSEZTX1haCiAJJnNxdWFz
aGZzX3h6X2NvbXBfb3BzLAogI2Vsc2UKIAkmc3F1YXNoZnNfeHpfdW5zdXBwb3J0ZWRfY29tcF9v
cHMsCisjZW5kaWYKIAkmc3F1YXNoZnNfdW5rbm93bl9jb21wX29wcwogfTsKIAotLSAKMS43LjQu
cmMwCgo=
--000e0ce0da0a9d740d04998e5a63--
