From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the final tree (arm-soc tree related)
Date: Mon, 17 Sep 2012 14:29:31 +0000
Message-ID: <201209171429.31794.arnd@arndb.de>
References: <20120917212615.91bc134d237dcd5968f9f549@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:49849 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756416Ab2IQO3q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Sep 2012 10:29:46 -0400
In-Reply-To: <20120917212615.91bc134d237dcd5968f9f549@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>

On Monday 17 September 2012, Stephen Rothwell wrote:
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/mfd/twl-core.c:49:22: fatal error: plat/cpu.h: No such file or directory
> 
> Caused by commit 7d7e1eba7e92 ("ARM: OMAP2+: Prepare for irqs.h removal").
> 
> I have added the following patch to restrict this driver to ARM until it
> is fixed:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 17 Sep 2012 21:18:21 +1000
> Subject: [PATCH] ARM: retrict TWL4030_CORE to ARM while it is broken
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks!

If it requires plat/cpu.h, it should actually be limited to CONFIG_ARCH_OMAP,
otherwise we will get the same problem on non-OMAP ARM builds. From what
I can tell, the problem is the clocks_init function, which is the only
part that is not completely generic.

The trivial workaround would be to enclose the "#include <plat/cpu.h>"
statement in #ifdef CONFIG_ARCH_OMAP, but with the common clock code
in place, we should probably be able to come up with a better solution
that works independent of the omap platform.

	Arnd
