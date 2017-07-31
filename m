From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: linux-next: build failure in the staging tree (Was: kisskb:
 FAILED linux-next/s390-allmodconfig/s390x Mon Jul 31, 17:24)
Date: Mon, 31 Jul 2017 09:55:14 +0000
Message-ID: <597EFE81.9010407@nxp.com>
References: <20170731072425.1.95853@222023911cb9>
 <20170731193546.6d0538cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-eopbgr10080.outbound.protection.outlook.com ([40.107.1.80]:31376
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750847AbdGaJzS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 31 Jul 2017 05:55:18 -0400
In-Reply-To: <20170731193546.6d0538cf@canb.auug.org.au>
Content-Language: en-US
Content-ID: <B36B419A2CBE3049BC3146E88BB4CC98@eurprd04.prod.outlook.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi Stephen,

That's because the fsl-mc driver selects GENERIC_MSI_IRQ_DOMAIN and not=20
all arches implement the support for the option. I can submit a patch=20
that adds explicit dependencies on arches that it was build-tested (x86,=20
arm, powerpc, all both 32 and 64 bits) similar to how it's done here=20
[1]. Let me know if you're ok with this fix and i'll submit the fix to=20
staging.

---
Thanks & Best Regards, Laurentiu

[1]=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/pci/Kconfig#n28

On 07/31/2017 12:35 PM, Stephen Rothwell wrote:
> Hi all,
>
> On Mon, 31 Jul 2017 07:24:25 -0000 noreply@ellerman.id.au wrote:
>>
>> FAILED linux-next/s390-allmodconfig/s390x Mon Jul 31, 17:24
>>
>> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fkiss=
kb.ellerman.id.au%2Fkisskb%2Fbuildresult%2F13110910%2F&data=3D01%7C01%7Clau=
rentiu.tudor%40nxp.com%7C0b58775ead154830f76f08d4d7f78d99%7C686ea1d3bc2b4c6=
fa92cd99c5c301635%7C0&sdata=3DA84bbMQe7VRz9OPK13PzaidBEfjm43Ik%2FbfCDJ89ZzM=
%3D&reserved=3D0
>>
>> Commit:   Add linux-next specific files for 20170731
>>            742f220ee69c8102eabea45e45d92aa18721fab1
>> Compiler: s390x-linux-gcc (GCC) 4.6.3
>>
>> Possible errors
>> ---------------
>>
>> include/linux/msi.h:196:21: fatal error: asm/msi.h: No such file or dire=
ctory
>> make[2]: *** [arch/s390/kernel/asm-offsets.s] Error 1
>> make[1]: *** [prepare0] Error 2
>> make: *** [sub-make] Error 2
>
> Caused by commit
>
>    03274850279c ("staging: fsl-mc: allow the driver compile multi-arch")
>
> I will revert that commit tomorrow unless it if fixed in the mean time.
>=
