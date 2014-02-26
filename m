From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (akpm-current tree related)
Date: Wed, 26 Feb 2014 15:19:16 -0800
Message-ID: <20140226231916.GB17589@jtriplet-mobl1>
References: <20140226191627.9adf3c8e1548e2016c16557c@canb.auug.org.au>
 <20140226100234.GA23064@thin>
 <20140227100026.1cc909f2722b16b6d11a7b91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37932 "EHLO
	relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172AbaBZXTZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Feb 2014 18:19:25 -0500
Content-Disposition: inline
In-Reply-To: <20140227100026.1cc909f2722b16b6d11a7b91@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 27, 2014 at 10:00:26AM +1100, Stephen Rothwell wrote:
> Hi Josh,
> 
> On Wed, 26 Feb 2014 02:02:34 -0800 Josh Triplett <josh@joshtriplett.org> wrote:
> >
> > On Wed, Feb 26, 2014 at 07:16:27PM +1100, Stephen Rothwell wrote:
> > > 
> > > After merging the final tree, today's linux-next build (powerpc64
> > > allnoconfig) failed like this:
> > > 
> > > arch/powerpc/kernel/built-in.o: In function `.machine_check_queue_event':
> > > (.text+0x11260): undefined reference to `.irq_work_queue'
> > > 
> > > Caused (or exposed) (along with a lot of warnings) by commit 3dd6115cd60b
> > > ("kconfig: make allnoconfig disable options behind EMBEDDED and EXPERT")
> > > from the apm-current tree.
> > 
> > Pre-existing, just now triggerable with just "make allnoconfig" rather
> > than manually turning off other options (like PRINTK) that select
> > IRQ_WORK.  (One of the goals of that commit: get those options more
> > widely used and build-tested.)
> > 
> > The following (untested) patch *should* fix this:
> > ----- 8< -----
> > From 36a5b6c87292b6c5eeb390ed6dc6acbb8f0a3767 Mon Sep 17 00:00:00 2001
> > From: Josh Triplett <josh@joshtriplett.org>
> > Date: Wed, 26 Feb 2014 01:58:02 -0800
> > Subject: [PATCH] ppc: Make PPC_BOOK3S_64 select IRQ_WORK
> 
> OK, I added this as a merge fix patch for Andrew's tree today.  Please
> check the build results overnight tonight (for next-20140227 at
> http://kisskb.ellerman.id.au/linux-next) and submit any more fixes for
> the allnoconfig build errors.

Please also fold in my patch "ia64: select CONFIG_TTY for use of
tty_write_message in unaligned".  (Just bounced you a copy.)

There's an s390 issue as well which needs the same fix (make the
top-level architecture symbol select TTY).

I'll look at the other issues tonight.

- Josh Triplett
