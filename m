From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: mfd tree build failure
Date: Mon, 23 Nov 2009 15:20:57 +0000
Message-ID: <20091123152057.GH24326@rakim.wolfsonmicro.main>
References: <20091123144103.73b4d64c.sfr@canb.auug.org.au>
 <20091123150346.e3948feb.sfr@canb.auug.org.au>
 <20091123122903.GB3616@sortiz.org>
 <20091123131113.GE24326@rakim.wolfsonmicro.main>
 <20091123144413.GD3616@sortiz.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755438AbZKWPU7@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091123144413.GD3616@sortiz.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Nov 23, 2009 at 03:44:14PM +0100, Samuel Ortiz wrote:
> On Mon, Nov 23, 2009 at 01:11:13PM +0000, Mark Brown wrote:

> > I don't see getting them exported flying, especially not in the
> > timeframe we've got for the merge window.  Keeping them non-exported has
> > been a deliberate decision on the part of the genirq maintainers. 

> Out of curiosity, what's the reasoning behind thatdecision ?

Unless you're actually implementing an interrupt controller those APIs
should never be called and people should be using flags on request_irq()
or similar.  Driver authors have been awfully fond of bypassing those
APIs, but this prevents them doing so.

None of this is really a practical issue unless you implement an IRQ
controller in a driver and that's very rare (or has been up until now).
