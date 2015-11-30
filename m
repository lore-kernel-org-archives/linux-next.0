From: Andi Kleen <ak@linux.intel.com>
Subject: Re: LTO build errors (Re: linux-next: clean up the kbuild tree?)
Date: Mon, 30 Nov 2015 09:46:45 -0800
Message-ID: <20151130174645.GC3528@tassilo.jf.intel.com>
References: <20151115112705.0bf4f0ed@canb.auug.org.au>
 <20151115175848.GD10150@tassilo.jf.intel.com>
 <5649D3B9.7020701@suse.cz>
 <20151121010033.GB8438@tassilo.jf.intel.com>
 <s5h4mgfzkno.wl-tiwai@suse.de>
 <20151124021231.GE8438@tassilo.jf.intel.com>
 <s5hy4dnicgv.wl-tiwai@suse.de>
 <20151125043344.GG8438@tassilo.jf.intel.com>
 <s5h7fl6a7lg.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:30254 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751484AbbK3Rso (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Nov 2015 12:48:44 -0500
Content-Disposition: inline
In-Reply-To: <s5h7fl6a7lg.wl-tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Michal Marek <mmarek@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

> > > /tmp/ccUCMU7n.ltrans21.ltrans.o: In function `do_exit':
> > > <artificial>:(.text+0xfc0): undefined reference to `sys_futex'
> > > /tmp/ccUCMU7n.ltrans22.ltrans.o: In function `_do_fork':
> > > <artificial>:(.text+0x39f7): undefined reference to `ret_from_fork'
> > > <artificial>:(.text+0x4428): undefined reference to `ret_from_kernel_thread'
> > 
> > 
> > That's new, but can be fixed by adding __visible or asmlinkage to these symbols
> > I guess it's from the recent entry* restructuring.
> > 
> > I'll do an updated tree later.
> > 
> > Everything that's called from assembler in C needs to be marked like this. It's
> > fairly mechanic.
> 
> OK, thanks for the information!

I uploaded lto-4.1/4.2/4.3 trees to my git tree. It only needed some minor changes.

However I think the problems with the assembler labels you had are due to toolchain
misconfiguration. I had the same issue when the compiler was using the non Linux binutils
as plugin ld. Unfortunately there is no way to ask the compiler to use a different
plugin ld, other than:
- rebuilding and specifying it at build time (see "Documentation/lto-build")
- or replacing the linker binary (/usr/bin/ld in a standard hosted compiler)

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only
