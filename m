From: Stefan Roese <sr@denx.de>
Subject: Re: linux-next: build warnings after merge of the l2-mtd tree
Date: Sat, 02 Feb 2013 11:20:00 +0100
Message-ID: <510CE850.1050805@denx.de>
References: <20130202143817.a2d9246dcb11cfa08128f588@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mo-p05-ob.rzone.de ([81.169.146.180]:60220 "EHLO
	mo-p05-ob.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755475Ab3BBK0R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 2 Feb 2013 05:26:17 -0500
In-Reply-To: <20130202143817.a2d9246dcb11cfa08128f588@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 02/02/2013 04:38 AM, Stephen Rothwell wrote:
> Hi Artem,
> 
> After merging the l2-mtd tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> In file included from drivers/mtd/chips/cfi_cmdset_0002.c:36:0:
> include/linux/of_platform.h:107:13: warning: 'struct of_device_id' declared inside parameter list [enabled by default]
> include/linux/of_platform.h:107:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
> include/linux/of_platform.h:107:13: warning: 'struct device_node' declared inside parameter list [enabled by default]
> drivers/mtd/chips/cfi_cmdset_0002.c: In function 'cfi_cmdset_0002':
> drivers/mtd/chips/cfi_cmdset_0002.c:504:22: warning: unused variable 'np' [-Wunused-variable]
> drivers/mtd/chips/cfi_cmdset_0002.c: At top level:
> drivers/mtd/chips/cfi_cmdset_0002.c:2279:12: warning: 'cfi_ppb_lock' defined but not used [-Wunused-function]
> drivers/mtd/chips/cfi_cmdset_0002.c:2285:12: warning: 'cfi_ppb_unlock' defined but not used [-Wunused-function]
> drivers/mtd/chips/cfi_cmdset_0002.c:2382:12: warning: 'cfi_ppb_is_locked' defined but not used [-Wunused-function]
> 
> Introduced by commit c3a02f171365 ("mtd: cfi_cmdset_0002: Support
> Persistent Protection Bits (PPB) locking").

Sorry about that. I'll send a fixup patch shortly.

Thanks,
Stefan
