From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (arm-soc tree related)
Date: Mon, 17 Sep 2012 13:32:33 -0700
Message-ID: <20120917203233.GW4521@atomide.com>
References: <20120917212615.91bc134d237dcd5968f9f549@canb.auug.org.au>
 <201209171429.31794.arnd@arndb.de>
 <20120917172208.GN4521@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-04-ewr.mailhop.org ([204.13.248.74]:54939 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752490Ab2IQUck (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Sep 2012 16:32:40 -0400
Content-Disposition: inline
In-Reply-To: <20120917172208.GN4521@atomide.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [120917 10:25]:
> * Arnd Bergmann <arnd@arndb.de> [120917 07:30]:
> > 
> > If it requires plat/cpu.h, it should actually be limited to CONFIG_ARCH_OMAP,
> > otherwise we will get the same problem on non-OMAP ARM builds. From what
> > I can tell, the problem is the clocks_init function, which is the only
> > part that is not completely generic.
> > 
> > The trivial workaround would be to enclose the "#include <plat/cpu.h>"
> > statement in #ifdef CONFIG_ARCH_OMAP, but with the common clock code
> > in place, we should probably be able to come up with a better solution
> > that works independent of the omap platform.
> 
> There are patches coming to remove cpu_is_omap usage from drivers,
> and until then we should just ifdef the plat/cpu.h include.
> 
> It is possible to use these kind of external PM chips with other
> SoCs, they're just not omap related and that's why there drivers
> have not had the Kconfig dependency. I'll post a patch for that.

Looks like we can just remove the cpu_is_omap code with clock
aliases, patch posted with Subject:

[PATCH] mfd: Fix compile for twl-core.c by removing cpu_is_omap usage

Regards,

Tony
