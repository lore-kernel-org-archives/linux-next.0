From: Alexey Korolev <akorolev@infradead.org>
Subject: Re: linux-next: mtd tree build failure
Date: Sat, 9 Aug 2008 21:41:35 +0100 (BST)
Message-ID: <alpine.LFD.1.10.0808092131550.3488@casper.infradead.org>
References: <20080807133005.d37ea7b8.sfr@canb.auug.org.au> <20080808001939.574e7fad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:53770 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751979AbYHIUm1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 Aug 2008 16:42:27 -0400
In-Reply-To: <20080808001939.574e7fad.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Hi Stephen,

Thanks for catching export symbol problem.  
Hmm, it seems very strange why i2c_dev.c can't reference the exported symbols. 
We are looking after of the problem. I believe it will be fixed ASAP.

Thanks,
Alexey

> Hi Dave,
> 
> On Thu, 7 Aug 2008 13:30:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > ERROR: "qry_present" [drivers/mtd/chips/cfi_probe.ko] undefined!
> > ERROR: "qry_mode_off" [drivers/mtd/chips/cfi_probe.ko] undefined!
> > ERROR: "qry_mode_on" [drivers/mtd/chips/cfi_probe.ko] undefined!
> > 
> > Caused by commit 2e489e077a6ad118c4f247faedf330117b107cce ("[MTD] [NOR]
> > Add qry_mode_on()/qry_omde_off() to deal with odd chips").
> 
> Also from an arm cam60_defconfig build:
> 
> drivers/built-in.o: In function `cfi_probe_chip':
> i2c-dev.c:(.text+0x497a4): undefined reference to `qry_mode_on'
> i2c-dev.c:(.text+0x49810): undefined reference to `qry_present'
> i2c-dev.c:(.text+0x49850): undefined reference to `qry_mode_off'
> i2c-dev.c:(.text+0x498a0): undefined reference to `qry_mode_off'
> i2c-dev.c:(.text+0x498b0): undefined reference to `qry_present'
> i2c-dev.c:(.text+0x498c8): undefined reference to `qry_mode_off'
> i2c-dev.c:(.text+0x498d8): undefined reference to `qry_present'
> i2c-dev.c:(.text+0x49ca4): undefined reference to `qry_mode_off'
> 
> This is today's linux-next with these symbols exported (which obviously
> makes no difference here).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
