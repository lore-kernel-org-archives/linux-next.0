From: Scott Wood <scottwood@freescale.com>
Subject: Re: Crash caused by "EDAC: Rip out the edac_subsys reference
 counting" (was Re: linux-next: Tree for Dec 8)
Date: Wed, 9 Dec 2015 10:50:09 -0600
Message-ID: <1449679809.15946.167.camel@freescale.com>
References: <20151208154910.78d27c03@canb.auug.org.au>
	 <1449657167.17265.4.camel@ellerman.id.au> <20151209111747.GA10518@pd.tnic>
	 <20151209160301.GB10518@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bl2on0119.outbound.protection.outlook.com ([65.55.169.119]:48035
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751706AbbLIQuW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2015 11:50:22 -0500
In-Reply-To: <20151209160301.GB10518@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@suse.de>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>

On Wed, 2015-12-09 at 17:03 +0100, Borislav Petkov wrote:
> On Wed, Dec 09, 2015 at 12:17:47PM +0100, Borislav Petkov wrote:
> > On Wed, Dec 09, 2015 at 09:32:47PM +1100, Michael Ellerman wrote:
> > > Presumably caused by the fact that edac_init() is subsys_initcall(),
> > > whereas
> > > corenet_gen_publish_devices() is arch_initcall().
> > 
> > Thanks for the report!
> > 
> > Hmm, interesting, can you send .config please?
> > 
> > I need to fix this dependency properly - edac_core needs to have
> > finished loaded *before* any other EDAC driver loads. Every other order
> > is wrong.
> 
> Yeah, see Johannes' patch.
> 
> Btw, calling a driver's probe function from outside the driver is a new
> low in driver design. Tztztz...

It's not "a driver's probe function".  There is no driver whose .probe() is
mpc85xx_pci_err_probe() -- the name is historical.

-Scott
