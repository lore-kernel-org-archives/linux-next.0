From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: manual merge of the slave-dma tree with the pm, mfd
 and rtc trees
Date: Thu, 3 Sep 2015 13:50:46 +0530
Message-ID: <20150903082046.GX13546@localhost>
References: <20150827112645.6c30e106@canb.auug.org.au>
 <20150827032405.GS13546@localhost>
 <CAMuHMdWoJFrG+bKJrY+Hm5+5fS9aiRiAdEegoT0wYvk2m4fjHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:29810 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751332AbbICISc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Sep 2015 04:18:32 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdWoJFrG+bKJrY+Hm5+5fS9aiRiAdEegoT0wYvk2m4fjHg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lee Jones <lee.jones@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Sep 01, 2015 at 09:17:25AM +0200, Geert Uytterhoeven wrote:
> On Thu, Aug 27, 2015 at 5:24 AM, Vinod Koul <vinod.koul@intel.com> wrote:
> > On Thu, Aug 27, 2015 at 11:26:45AM +1000, Stephen Rothwell wrote:
> >> Hi Vinod,
> >>
> >> Today's linux-next merge of the slave-dma tree got conflicts in:
> >>
> >>   drivers/dma/Kconfig
> >>   drivers/dma/Makefile
> >>
> >> between commit:
> >>
> >>   667dfed98615 ("dmaengine: add a driver for Intel integrated DMA 64-bit")
> >>
> >> from the pm, mfd and rtc trees and commits:
> >>
> >>   3c21619077be ("dmaengine: sort the Kconfig")
> >>   7e97229b3920 ("dmaengine: sort the makefile")
> >>
> >> from the slave-dma tree.
> >>
> >> I fixed it up (see below) and can carry the fix as necessary (no action
> >> is required).
> >
> > Thanks Stephen,
> >
> > I looked at this and merge is sorted, so looks good to me
> 
> Sorted by Kconfig symbol or by name?

I did by symbols. That also reminds me that we are not consistent in our
symbols, right now seems free for all. Ideally we should all be DMA_xxxx


-- 
~Vinod
