From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: linux-next: build failure after merge of the iommu tree
Date: Mon, 2 Nov 2015 09:15:07 +0900
Message-ID: <CANqRtoTANpR2xOdoufZghiP7pbFmhT3Gx3Z5S9TUz8ohjhwazA@mail.gmail.com>
References: <20151101224252.09e11a3c@canb.auug.org.au>
	<20151101151457.GM27420@8bytes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f41.google.com ([209.85.213.41]:36081 "EHLO
	mail-vk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752027AbbKBAPI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Nov 2015 19:15:08 -0500
In-Reply-To: <20151101151457.GM27420@8bytes.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Magnus Damm <damm+renesas@opensource.se>

Hi Joerg, everyone,

On Mon, Nov 2, 2015 at 12:14 AM, Joerg Roedel <joro@8bytes.org> wrote:
> Hi Stephen,
>
> On Sun, Nov 01, 2015 at 10:42:52PM +1100, Stephen Rothwell wrote:
>> After merging the iommu tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/iommu/ipmmu-vmsa.c:24:27: fatal error: asm/dma-iommu.h: No such file or directory
>>
>> Caused by commit
>>
>>   bad78b13e305 ("iommu/ipmmu-vmsa: Drop LPAE Kconfig dependency")
>>
>> Only arm has the include file ...
>>
>> I have used the iommu tree from next-20151022 for today.
>
> Thanks, I reverted the broken commit and will push out an updated tree
> soon.

Thanks for your help and my apologies for the breakage. I did not
expect this patch to enable build on non-ARM platforms but I can now
understand that the LPAE Kconfig bits may have been the last bit
stopping other architectures to build this driver.

I'm currently poking around with this driver on 32/64-bit ARM and
getting rid of those includes from asm/ is for sure on my TODO list.

/ magnus
