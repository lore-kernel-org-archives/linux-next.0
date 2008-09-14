From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip-core tree build wanings
Date: Sun, 14 Sep 2008 17:05:23 +0200
Message-ID: <20080914150523.GJ12522@elte.hu>
References: <20080912150753.1ce5002c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:38025 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752214AbYINPFj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 11:05:39 -0400
Content-Disposition: inline
In-Reply-To: <20080912150753.1ce5002c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (powerpc_ppc64_defconfig) produced lots of
> warnings like this:
> 
> In file included from arch/powerpc/platforms/powermac/smp.c:24:
> include/linux/kernel.h:498:1: warning: "BUILD_BUG_ON" redefined
> In file included from include/linux/linkage.h:4,
>                  from include/linux/kernel.h:11,
>                  from arch/powerpc/platforms/powermac/smp.c:24:
> include/linux/compiler.h:209:1: warning: this is the location of the previous definition
> 
> Introduced by commit 3cff9a338bd3ace9cfb501e08aeb69913b47c53d ("manual
> merge of core/debug") which recreated the definition of the BUILD_BUG_ON
> macro in kernel.h.
> 
> I applied the following patch.

ah, both of these patches were reverted in tip/master 4 days ago:

49937ca: Revert "debug: fix BUILD_BUG_ON() for non-constant expressions"
c3d4a3c: Revert "debug, x86: move BUILD_BUG_ON() and __FUNCTION__"

i've cherry-picked them over into tip/auto-core-next. Thanks,

	Ingo
