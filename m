From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: origin tree build warnings
Date: Thu, 31 Dec 2009 17:32:11 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0912311731130.3630@localhost.localdomain>
References: <20100101114238.83108321.sfr@canb.auug.org.au> <alpine.LFD.2.00.0912311649070.3630@localhost.localdomain> <20100101122259.394d5b19.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:48848 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751648Ab0AABc4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2009 20:32:56 -0500
In-Reply-To: <20100101122259.394d5b19.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@linux.intel.com>, Tony Lindgren <tony@atomide.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Balaji T K <balajitk@ti.com>, Rajendra Nayak <rnayak@ti.com>



On Fri, 1 Jan 2010, Stephen Rothwell wrote:
> 
> I have built drivers/mfd/twl4030-irq.o the same way as before but after
> applying your patch and the warnings are fixed.  I do not have the
> hardware and so cannot do a runtime test.

Ok, committed as "Reported-and-compile-tested-by:" you.

Somebody should probably test it on real hardware, but I doubt the patch 
makes anything worse, and it _probably_ makes things better.

			Linus
