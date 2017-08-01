From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: linux-next: build failure in the staging tree (Was: kisskb:
 FAILED linux-next/s390-allmodconfig/s390x Mon Jul 31, 17:24)
Date: Tue, 1 Aug 2017 08:29:31 +0000
Message-ID: <59803B7E.7050001@nxp.com>
References: <20170731072425.1.95853@222023911cb9>
 <20170731193546.6d0538cf@canb.auug.org.au> <597EFE81.9010407@nxp.com>
 <20170731155850.GD1262@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-db5eur01on0042.outbound.protection.outlook.com ([104.47.2.42]:48864
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751533AbdHAI3f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 04:29:35 -0400
In-Reply-To: <20170731155850.GD1262@kroah.com>
Content-Language: en-US
Content-ID: <B08FFCC8BD9954458FF0434704F65C56@eurprd04.prod.outlook.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>



On 07/31/2017 06:58 PM, Greg KH wrote:
> On Mon, Jul 31, 2017 at 09:55:14AM +0000, Laurentiu Tudor wrote:
>> Hi Stephen,
>>
>> That's because the fsl-mc driver selects GENERIC_MSI_IRQ_DOMAIN and not
>> all arches implement the support for the option. I can submit a patch
>> that adds explicit dependencies on arches that it was build-tested (x86,
>> arm, powerpc, all both 32 and 64 bits) similar to how it's done here
>> [1]. Let me know if you're ok with this fix and i'll submit the fix to
>> staging.
>
> Ugh, you should not be selecting that option, but rather depending on
> the option, right?

All users in the kernel use "select", so i don't think so. An=20
interesting use that adds explicit dependencies on architectures can be
seen here [1], in the generic code. I've proposed a patch [2] that does=20
a similar thing for mc-bus. I think it's a good approach as it keeps=20
things under control by explicitly specifying the architectures on which
the driver was compile-tested.

---
Best Regards, Laurentiu

[1]=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/pci/Kconfig#n28
[2] https://patchwork.kernel.org/patch/9871861/=
