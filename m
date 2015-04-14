From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: Re: linux-next: Tree for Apr 14 (crash due to modpost patch)
Date: Tue, 14 Apr 2015 18:36:03 +0200
Message-ID: <20150414163603.GD2925@chrystal.uk.oracle.com>
References: <20150414184244.0f1d1383@canb.auug.org.au>
 <20150414161114.GA18420@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:36061 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753852AbbDNQdw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2015 12:33:52 -0400
Content-Disposition: inline
In-Reply-To: <20150414161114.GA18420@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Quentin Casasnovas <quentin.casasnovas@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>

On Tue, Apr 14, 2015 at 09:11:14AM -0700, Guenter Roeck wrote:
> On Tue, Apr 14, 2015 at 06:42:44PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any v4.2 material to your linux-next included trees
> > until after v4.1-rc1 is released.
> > 
> > Changes since 20150413:
> > 
> > Dropped tree: idle (complex conflict)
> > 
> > The arm-soc tree still had its build failure for which I reverted
> > a commit.
> > 
> > The vfs tree gained conflicts against the ext4 and xfs trees.
> > 
> > The pm tree lost its build failure.
> > 
> > The idle tree gained a complex conflict against the pm tree so I dropped
> > it for today.
> > 
> > The irqchip tree lost its build failure.
> > 
> > The ftrace tree gained a conflict against the net-next tree.
> > 
> > The rcu tree stilll had its build failure for which I reverted a commit.
> > 
> > The xen-tip tree gained a build failure so I used the version from
> > next-20150410.
> > 
> > Non-merge commits (relative to Linus' tree): 9605
> >  8774 files changed, 407882 insertions(+), 199408 deletions(-)
> > 
> This version results in a modpost crash when building a score target.
> 
> /bin/sh: line 1: 18057 Floating point exception(core dumped) scripts/mod/modpost -o ./Module.symvers -S vmlinux.o
> scripts/Makefile.modpost:97: recipe for target 'vmlinux.o' failed
> make[1]: *** [vmlinux.o] Error 136
> Makefile:949: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 2
> 
> Culprit is commit 52dc0595d540 ("modpost: handle relocations mismatch in
> __ex_table.). That patch has a number of problems.
> 
> +       if (!extable_entry_size && cur == start + 1 &&
> +           strcmp("__ex_table", sec) == 0)
> +               extable_entry_size = r->r_offset * 2;
> 
> Debugging shows that "cur - start" can be anywhere in multiples of 8
> (arm, score) to 24 (alpha). I have never seen it to be 1. As a result,
> extable_entry_size will never be set, or at least not for the
> architectures I looked at.

Derp sorry about this :(

I moved that "cur == start + 1" test from section_rel[a]() to here but
completely missed to properly cast before doing the pointer arithmetics.

> 
> +static inline bool is_extable_fault_address(Elf_Rela *r)
> +{
> +       if (!extable_entry_size == 0)
> +               fatal("extable_entry size hasn't been discovered!\n");
> 
> "!extable_entry_size == 0" is true if extable_entry_size is not 0.
> Presumably that was supposed to be "if (extable_entry_size == 0)"
> or "if (!extable_entry_size)".
>
> +       return ((r->r_offset == 0) ||
> +               (r->r_offset % extable_entry_size == 0));
> 
> So this code will execute if extable_entry_size==0, predictably causing
> the observed crash.
> 
> I still don't know why this is triggered when building a score image.
> It appears that some __ex_table entry causes the problem. Which may or
> may not be a problem. Personally I think it is a bit rude to abort
> compilation because of it.
>

It is rude and I'm really sorry about this, I had only tested this on
x86_64 and sparc.

Should I send a tentative fix or will you do it since you've done all the
hard work?  In any case thanks for the detailed analysis.

Quentin
