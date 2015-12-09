From: Scott Wood <scottwood@freescale.com>
Subject: Re: Crash caused by "EDAC: Rip out the edac_subsys reference
 counting" (was Re: linux-next: Tree for Dec 8)
Date: Wed, 9 Dec 2015 11:57:05 -0600
Message-ID: <1449683825.15946.207.camel@freescale.com>
References: <20151208154910.78d27c03@canb.auug.org.au>
	 <1449657167.17265.4.camel@ellerman.id.au> <20151209111747.GA10518@pd.tnic>
	 <20151209160301.GB10518@pd.tnic> <1449679809.15946.167.camel@freescale.com>
	 <20151209173829.GD10518@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151209173829.GD10518@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@suse.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>, linux-edac@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 2015-12-09 at 18:38 +0100, Borislav Petkov wrote:
> On Wed, Dec 09, 2015 at 10:50:09AM -0600, Scott Wood wrote:
> > It's not "a driver's probe function".  There is no driver whose .probe()
> > is
> > mpc85xx_pci_err_probe() -- the name is historical.
> 
> From looking at it, it behaves a lot like a probe function. Irrespective
> of what it is or it isn't, calling it from outside a driver which can be
> built as a module is a no-no. So I'd appreciate it if someone could test
> Johannes' patch on the relevant hardware.

Thanks for pointing the patch out -- it wasn't posted to linuxppc-dev so I
would have missed it otherwise.  I don't need to test it to see that it's
broken -- we can't have two drivers binding to the same device, which is the
reason why the current situation exists.

I recall at the time suggesting that the PCIe controller driver instantiate a
platform device for the EDAC driver to bind to -- it looks like that's what
we'll need to do.

-Scott
