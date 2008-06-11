From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: sparc32 build failure
Date: Wed, 11 Jun 2008 12:23:34 +0200
Message-ID: <20080611102334.GA32748@uranus.ravnborg.org>
References: <20080611193209.163fa2be.sfr@canb.auug.org.au> <20080611.023630.176176702.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:57095 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751302AbYFKKWw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 06:22:52 -0400
Content-Disposition: inline
In-Reply-To: <20080611.023630.176176702.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org

On Wed, Jun 11, 2008 at 02:36:30AM -0700, David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 11 Jun 2008 19:32:09 +1000
> 
> > Hi Dave, Sam,
> > 
> > Today's linux-next build (sparc32 defconfig) failed like this:
> > 
> >   Building modules, stage 2.
> > /opt/crosstool/gcc-3.4.5-glibc-2.3.6/sparc64-unknown-linux-gnu/bin/sparc64-unknown-linux-gnu-ld: .tmp_kallsyms2.o: No such file: No such file or directory
> > make[2]: *** [arch/sparc/boot/image] Error 1
> > 
> > I am guessing some kbuild change that sparc32 doesn't like.
> 
> Yes, it seems arch/sparc/Makefile needs some updates to match those
> recent Kbuild changes which eliminate the second kallsyms pass.

Killing the following lines should do the trick:
ifdef CONFIG_KALLSYMS
kallsyms.o := .tmp_kallsyms2.o
endif

They were added in 2003. See:
http://git.kernel.org/?p=linux/kernel/git/torvalds/old-2.6-bkcvs.git;a=commit;h=aa13a1c61f9a5edca32b06dba4da4ebe9fb5f766

I am not sure why and the changelog is of no help.
To me it looks like a trick to force the second pass when ever KALLSYMS is enabled.
And I do not think this is needed anymore.

	Sam

