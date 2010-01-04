From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: origin tree build warnings
Date: Mon, 4 Jan 2010 14:51:30 +0100
Message-ID: <20100104135128.GB5394@sortiz.org>
References: <20100101114238.83108321.sfr@canb.auug.org.au>
 <alpine.LFD.2.00.0912311649070.3630@localhost.localdomain>
 <20100101122259.394d5b19.sfr@canb.auug.org.au>
 <alpine.LFD.2.00.0912311731130.3630@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga10.intel.com ([192.55.52.92]:30590 "EHLO
	fmsmga102.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753266Ab0ADNtu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2010 08:49:50 -0500
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0912311731130.3630@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Tony Lindgren <tony@atomide.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Balaji T K <balajitk@ti.com>, Rajendra Nayak <rnayak@ti.com>

Hi Linus,

On Thu, Dec 31, 2009 at 05:32:11PM -0800, Linus Torvalds wrote:
> 
> 
> On Fri, 1 Jan 2010, Stephen Rothwell wrote:
> > 
> > I have built drivers/mfd/twl4030-irq.o the same way as before but after
> > applying your patch and the warnings are fixed.  I do not have the
> > hardware and so cannot do a runtime test.
> 
> Ok, committed as "Reported-and-compile-tested-by:" you.
> 
> Somebody should probably test it on real hardware, but I doubt the patch 
> makes anything worse, and it _probably_ makes things better.
Thanks for the fix.
I got the same fix from Felipe and Tony during the holidays, so I assume they
tested it on real hardware.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
