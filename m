From: Samuel Ortiz <sameo@openedhand.com>
Subject: Re: linux-next: mfd tree build failure
Date: Tue, 5 Aug 2008 15:09:00 +0200
Message-ID: <20080805130900.GB6335@caravaggio>
References: <20080805150947.ee63424a.sfr@canb.auug.org.au> <1217941394.18866.19.camel@wirenth>
Reply-To: Samuel Ortiz <sameo@openedhand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]:45719 "EHLO
	pug.o-hand.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754377AbYHENJG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 09:09:06 -0400
Content-Disposition: inline
In-Reply-To: <1217941394.18866.19.camel@wirenth>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ian <spyro@f2s.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Hi Ian,

On Tue, Aug 05, 2008 at 02:03:14PM +0100, ian wrote:
> On Tue, 2008-08-05 at 15:09 +1000, Stephen Rothwell wrote:
> > 
> > I reverted commit 4d6da2de1b09228989efb67a1f9e6d2ced075540 ("mfd:
> > driver for the TMIO NAND controller") until it has tighter controls in
> > its Kconfig patch. i.e. I have no idea what arches this should be
> > built on.
> 
> Since there is no way to know wether an arch has readsw() and friends at
> config time, I'd propose that bot the TMIO NAND and MMC drivers be built
> only on ARM for now. If anyone every uses them on another platform, they
> can add the support.
> 
> Should I redo the two drivers patchsets, or would you prefer a patch
> fixing this after the fact?
No worries, I'll fix the Kconfigs later today.

Cheers,
Samuel.
