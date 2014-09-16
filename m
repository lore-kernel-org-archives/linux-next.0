From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [slave-dma:for-linus 20/20] drivers/spi/spi-pxa2xx-pci.c:70:3:
 error: unknown field 'max_clk_rate' specified in initializer
Date: Tue, 16 Sep 2014 10:22:43 +0530
Message-ID: <20140916045243.GM3131@intel.com>
References: <5411735d.SAoL/AZyi+bJWC6n%fengguang.wu@intel.com>
 <20140911101750.GP13406@lahna.fi.intel.com>
 <20140913170053.GO7960@sirena.org.uk>
 <20140915080640.GM10854@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:57960 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752423AbaIPFRn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Sep 2014 01:17:43 -0400
Content-Disposition: inline
In-Reply-To: <20140915080640.GM10854@lahna.fi.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mika Westerberg <mika.westerberg@linux.jf.intel.com>
Cc: Mark Brown <broonie@kernel.org>, kbuild test robot <fengguang.wu@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.jf.intel.com>, kbuild-all@01.org, linux-next@vger.kernel.org

On Mon, Sep 15, 2014 at 11:06:40AM +0300, Mika Westerberg wrote:
> On Sat, Sep 13, 2014 at 10:00:53AM -0700, Mark Brown wrote:
> > On Thu, Sep 11, 2014 at 01:17:50PM +0300, Mika Westerberg wrote:
> > 
> > > Vinod, this has dependency to the SPI tree. I suppose right way to
> > > handle this is to merge Mark's topic/pxa2xx branch into this. Or
> > > alternatively Mark can make an immutable branch containing the missing
> > > commit that you can merge.
> > 
> > I've tagged this here, please do remember to coordinate dependencies
> > when making this sort of multi-tree change:
> 
> Thanks Mark!
> 
> Vinod, can you pull this to your -next branch?
Done, can you verify merge was okay as I had few conflicts.

-- 
~Vinod
> 
> And sorry about this, we will make sure that next time we state all
> the dependencies beforehand.
> 
> > 
> > The following changes since commit 7d1311b93e58ed55f3a31cc8f94c4b8fe988a2b9:
> > 
> >   Linux 3.17-rc1 (2014-08-16 10:40:26 -0600)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-pxa2xx-clk
> > 
> > for you to fetch changes up to afa93c9017fd48d4d5265854c75f5fcde0871548:
> > 
> >   spi/pxa2xx-pci: Add common clock framework support in PCI glue layer (2014-08-16 17:19:50 -0500)
> > 
> > ----------------------------------------------------------------
> > spi/pxa2xx: Add clock support
> > 
> > ----------------------------------------------------------------
> > Chew, Chiau Ee (1):
> >       spi/pxa2xx-pci: Add common clock framework support in PCI glue layer
> > 
> >  drivers/spi/Kconfig          |  2 +-
> >  drivers/spi/spi-pxa2xx-pci.c | 21 ++++++++++++++++++++-
> >  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> 

-- 
