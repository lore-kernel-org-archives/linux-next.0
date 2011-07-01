From: Cong Wang <amwang@redhat.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 01 Jul 2011 13:32:04 +0800
Message-ID: <4E0D5BD4.6080403@redhat.com>
References: <20110701151931.4c2d78b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010504040304020105050908"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58541 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750836Ab1GAFcV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 Jul 2011 01:32:21 -0400
In-Reply-To: <20110701151931.4c2d78b5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------010504040304020105050908
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

于 2011年07月01日 13:19, Stephen Rothwell 写道:
> Hi Andrew,
>
> After merging the akpm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> arch/powerpc/kernel/rtas.c: In function 'rtas_restart':
> arch/powerpc/kernel/rtas.c:655:24: error: 'SYS_RESTART' undeclared (first use in this function)
> arch/powerpc/kernel/rtas.c: In function 'rtas_power_off':
> arch/powerpc/kernel/rtas.c:664:24: error: 'SYS_POWER_OFF' undeclared (first use in this function)
> arch/powerpc/kernel/rtas.c: In function 'rtas_halt':
> arch/powerpc/kernel/rtas.c:674:24: error: 'SYS_HALT' undeclared (first use in this function)
>
> Caused by commit ac050ff2a176 ("It is not necessary to share the same
> notifier.h").

I think the following patch will fix this.

Thanks.

---

Signed-off-by: WANG Cong <amwang@redhat.com>

--------------010504040304020105050908
Content-Type: text/plain;
 name="patch.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="patch.diff"

ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcnRhcy5jIGIvYXJjaC9wb3dlcnBj
L2tlcm5lbC9ydGFzLmMKaW5kZXggMjcxZmY2My4uMGUwZWE5NCAxMDA2NDQKLS0tIGEvYXJj
aC9wb3dlcnBjL2tlcm5lbC9ydGFzLmMKKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9ydGFz
LmMKQEAgLTI0LDYgKzI0LDcgQEAKICNpbmNsdWRlIDxsaW51eC9jcHVtYXNrLmg+CiAjaW5j
bHVkZSA8bGludXgvbWVtYmxvY2suaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisjaW5j
bHVkZSA8bGludXgvcmVib290Lmg+CiAKICNpbmNsdWRlIDxhc20vcHJvbS5oPgogI2luY2x1
ZGUgPGFzbS9ydGFzLmg+Cg==
--------------010504040304020105050908--
