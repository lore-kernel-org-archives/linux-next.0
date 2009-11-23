From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: mfd tree build failure
Date: Mon, 23 Nov 2009 13:29:04 +0100
Message-ID: <20091123122903.GB3616@sortiz.org>
References: <20091123144103.73b4d64c.sfr@canb.auug.org.au>
 <20091123150346.e3948feb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:56252 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757238AbZKWM1R (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Nov 2009 07:27:17 -0500
Content-Disposition: inline
In-Reply-To: <20091123150346.e3948feb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On Mon, Nov 23, 2009 at 03:03:46PM +1100, Stephen Rothwell wrote:
> Hi Samuel,
> 
> On Mon, 23 Nov 2009 14:41:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > ERROR: "irq_to_desc" [drivers/mfd/wm831x.ko] undefined!
> > ERROR: "handle_edge_irq" [drivers/mfd/wm831x.ko] undefined!
> > ERROR: "set_irq_chip_and_handler" [drivers/mfd/wm831x.ko] undefined!
> > ERROR: "set_irq_noprobe" [drivers/mfd/wm831x.ko] undefined!
> > 
> > Probably caused by commit 8fc686c7369173519817f0cfbb2df9a3671d5b8d ("mfd:
> > Move WM831x to generic IRQ").  Maybe a Kconfig dependency is missing?
> 
> It actually looks as though set_irq_chip_and_handler (at least) is not
> exported to modules.
True. Mark, I think we should get those symbols exported, unless you have a
better idea ? Having wm831x as a boolean choice from Kconfig doesnt sound too
god to me.

Cheers,
Samuel.


> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/



-- 
Intel Open Source Technology Centre
http://oss.intel.com/
