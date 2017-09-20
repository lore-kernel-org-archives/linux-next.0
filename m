From: robert.jarzmik@free.fr
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 20 Sep 2017 13:54:47 +0200 (CEST)
Message-ID: <1848203366.301536633.1505908487915.JavaMail.root@zimbra1-e1>
References: <20170920120151.3d7d97b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
        boundary="----=_Part_301536631_1671531831.1505908487914"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp6-g21.free.fr ([212.27.42.6]:46866 "EHLO smtp6-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751845AbdITLyv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Sep 2017 07:54:51 -0400
In-Reply-To: <20170920120151.3d7d97b8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>

------=_Part_301536631_1671531831.1505908487914
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Stephen and Mark,

This is my mess. And today my mailer is not my usual one, please don't blame me
for its probably awfull rendering.

Somehow, in my last serie, in wm9712_soc_probe(), a closing bracket has disappeared.
This affects only wm9712.c, not the others, ie. the commit :
 - 2ed1a8e "ASoC: wm9712: add ac97 new bus support"

I will resend an incremental version of this patch alone Mark this evening if that
suits you, with the bracket missing in wm9712.c:661 added.

Cheers.

--
Robert

[1] The diff, scrambled probably by my mailer, will look like the attached piece.
    My mailer refuses to add a TAB so I cannot inline it with a scissor.

------=_Part_301536631_1671531831.1505908487914
Content-Type: text/x-patch; name=wm9712.diff
Content-Disposition: attachment; filename=wm9712.diff
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3Mvd205NzEyLmMgYi9zb3VuZC9zb2MvY29kZWNz
L3dtOTcxMi5jCmluZGV4IDFlMjI4YmYuLjlkYjVjNzcgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9j
b2RlY3Mvd205NzEyLmMKKysrIGIvc291bmQvc29jL2NvZGVjcy93bTk3MTIuYwpAQCAtNjU4LDYg
KzY1OCw3IEBAIHN0YXRpYyBpbnQgd205NzEyX3NvY19wcm9iZShzdHJ1Y3Qgc25kX3NvY19jb2Rl
YyAqY29kZWMpCiAJCWlmIChJU19FUlIocmVnbWFwKSkgewogCQkJcmV0ID0gUFRSX0VSUihyZWdt
YXApOwogCQkJZ290byBlcnJfZnJlZV9hYzk3X2NvZGVjOworCQl9CiAjZW5kaWYKIAl9CiAK
------=_Part_301536631_1671531831.1505908487914--
