From: Bard Liao <bardliao@realtek.com>
Subject: RE: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 29 Jun 2017 02:01:16 +0000
Message-ID: <ABFD875FF5FB574BA706497D987D48D70267BA04@RTITMBSV02.realtek.com.tw>
References: <20170629115400.3f52c9aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
        boundary="_002_ABFD875FF5FB574BA706497D987D48D70267BA04RTITMBSV02realt_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rtits2.realtek.com ([211.75.126.72]:46670 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751553AbdF2CBg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Jun 2017 22:01:36 -0400
In-Reply-To: <20170629115400.3f52c9aa@canb.auug.org.au>
Content-Language: zh-TW
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--_002_ABFD875FF5FB574BA706497D987D48D70267BA04RTITMBSV02realt_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Thursday, June 29, 2017 9:54 AM
> To: Mark Brown; Liam Girdwood
> Cc: Linux-Next Mailing List; Linux Kernel Mailing List; Bard Liao
> Subject: linux-next: build failure after merge of the sound-asoc tree
>=20
> Hi all,
>=20
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> sound/soc/codecs/rt5670.c: In function 'rt5670_set_codec_sysclk':
> sound/soc/codecs/rt5670.c:2448:57: error: 'codec' undeclared (first use i=
n this
> function)
>   struct rt5670_priv *rt5670 =3D snd_soc_codec_get_drvdata(codec);
>                                                          ^
> sound/soc/codecs/rt5670.c:2448:57: note: each undeclared identifier is
> reported only once for each function it appears in
> sound/soc/codecs/rt5670.c: At top level:
> sound/soc/codecs/rt5670.c:2775:16: error: initialization from incompatibl=
e
> pointer type [-Werror=3Dincompatible-pointer-types]
>   .set_sysclk =3D rt5670_set_codec_sysclk,
>                 ^
> sound/soc/codecs/rt5670.c:2775:16: note: (near initialization for
> 'soc_codec_dev_rt5670.set_sysclk')
> cc1: some warnings being treated as errors
>=20
> Caused by commit
>=20
>   6c28ce3c425e ("ASoC: rt5670: move set_sysclk to codec level")
>=20
> I have used the sound-asoc tree from next-20170628 for today.

Sorry about that. I just sent a patch to fix it. Please check the attached.

>=20
> --
> Cheers,
> Stephen Rothwell
>=20
> ------Please consider the environment before printing this e-mail.

--_002_ABFD875FF5FB574BA706497D987D48D70267BA04RTITMBSV02realt_
Content-Type: application/octet-stream;
	name="0001-ASoC-rt5670-fix-incompatible-pointer-type-of-set_sys.patch"
Content-Description: 0001-ASoC-rt5670-fix-incompatible-pointer-type-of-set_sys.patch
Content-Disposition: attachment;
	filename="0001-ASoC-rt5670-fix-incompatible-pointer-type-of-set_sys.patch";
	size=1018; creation-date="Thu, 29 Jun 2017 01:59:54 GMT";
	modification-date="Thu, 29 Jun 2017 01:46:10 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlZGQyNDY0Yzc0YmU1N2VlN2I1ZjVkMDhiNTM5YTBkZTBiM2VjZmM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCYXJkIExpYW8gPGJhcmRsaWFvQHJlYWx0ZWsuY29tPgpEYXRl
OiBUaHUsIDI5IEp1biAyMDE3IDA5OjM3OjI0ICswODAwClN1YmplY3Q6IFtQQVRDSF0gQVNvQzog
cnQ1NjcwOiBmaXggaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBvZiBzZXRfc3lzY2xrCgpUaGUg
Zmlyc3QgcGFyYW1ldGVyIGlzIGNvZGVjIG5vdCBkYWkuCgpTaWduZWQtb2ZmLWJ5OiBCYXJkIExp
YW8gPGJhcmRsaWFvQHJlYWx0ZWsuY29tPgotLS0KU29ycnkgZm9yIG1pc3NpbmcgaXQgaW4gdGhl
ICJtb3ZlIHNldF9zeXNjbGsgdG8gY29kZWMgbGV2ZWwiIHBhdGNoCi0tLQogc291bmQvc29jL2Nv
ZGVjcy9ydDU2NzAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMgYi9zb3Vu
ZC9zb2MvY29kZWNzL3J0NTY3MC5jCmluZGV4IDdmYTYzYWQuLjY0NzU2ZGMgMTAwNjQ0Ci0tLSBh
L3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMKKysrIGIvc291bmQvc29jL2NvZGVjcy9ydDU2NzAu
YwpAQCAtMjQ0Miw3ICsyNDQyLDcgQEAgc3RhdGljIGludCBydDU2NzBfc2V0X2RhaV9mbXQoc3Ry
dWN0IHNuZF9zb2NfZGFpICpkYWksIHVuc2lnbmVkIGludCBmbXQpCiAJcmV0dXJuIDA7CiB9CiAK
LXN0YXRpYyBpbnQgcnQ1NjcwX3NldF9jb2RlY19zeXNjbGsoc3RydWN0IHNuZF9zb2NfZGFpICpk
YWksIGludCBjbGtfaWQsCitzdGF0aWMgaW50IHJ0NTY3MF9zZXRfY29kZWNfc3lzY2xrKHN0cnVj
dCBzbmRfc29jX2NvZGVjICpjb2RlYywgaW50IGNsa19pZCwKIAkJCQkgICBpbnQgc291cmNlLCB1
bnNpZ25lZCBpbnQgZnJlcSwgaW50IGRpcikKIHsKIAlzdHJ1Y3QgcnQ1NjcwX3ByaXYgKnJ0NTY3
MCA9IHNuZF9zb2NfY29kZWNfZ2V0X2RydmRhdGEoY29kZWMpOwotLSAKMi43LjQKCg==

--_002_ABFD875FF5FB574BA706497D987D48D70267BA04RTITMBSV02realt_--
