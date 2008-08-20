From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: Tree for August 19 (mfd/ucb)
Date: Wed, 20 Aug 2008 06:21:59 +0200
Message-ID: <20080820042159.GA10066@uranus.ravnborg.org>
References: <20080819185454.d9c74915.sfr@canb.auug.org.au> <20080819170517.04d91de8.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:20245 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751136AbYHTEWK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Aug 2008 00:22:10 -0400
Content-Disposition: inline
In-Reply-To: <20080819170517.04d91de8.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sameo@openedhand.com

On Tue, Aug 19, 2008 at 05:05:17PM -0700, Randy Dunlap wrote:
> drivers/mfd/ucb1400 is a sound (AC97) driver, so it should depend
> on AC97_BUS, like in the patch below.  However, with that patch in
> place, oldconfig goes belly up on me:
> 
> 
> linux-next-20080819> make ARCH=x86_64  O=X64  V=1 oldconfig
> make -C /local/linsrc/linux-next-20080819/X64 \
> 	KBUILD_SRC=/local/linsrc/linux-next-20080819 \
> 	KBUILD_EXTMOD="" -f /local/linsrc/linux-next-20080819/Makefile \
> 	oldconfig
> make -f /local/linsrc/linux-next-20080819/scripts/Makefile.build obj=scripts/basic
> /bin/sh /local/linsrc/linux-next-20080819/scripts/mkmakefile \
> 	    /local/linsrc/linux-next-20080819 /local/linsrc/linux-next-20080819/X64 2 6
>   GEN     /local/linsrc/linux-next-20080819/X64/Makefile
> mkdir -p include/linux include/config
> make -f /local/linsrc/linux-next-20080819/scripts/Makefile.build obj=scripts/kconfig oldconfig
> scripts/kconfig/conf -o arch/x86/Kconfig
> make[2]: *** [oldconfig] Segmentation fault (core dumped)
> make[1]: *** [oldconfig] Error 2
> make: *** [sub-make] Error 2

I have an outstanding bug in kconfig where it SEGV when it
sees a circular dependency - and I think you hit it here :-(

	Sam
