From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [slave-dma:for-linus 20/20] drivers/spi/spi-pxa2xx-pci.c:70:3:
 error: unknown field 'max_clk_rate' specified in initializer
Date: Tue, 16 Sep 2014 10:35:55 +0300
Message-ID: <1410852955.7023.50.camel@linux.intel.com>
References: <5411735d.SAoL/AZyi+bJWC6n%fengguang.wu@intel.com>
	 <20140911101750.GP13406@lahna.fi.intel.com>
	 <20140913170053.GO7960@sirena.org.uk>
	 <20140915080640.GM10854@lahna.fi.intel.com>
	 <20140916045243.GM3131@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:63118 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752347AbaIPHgH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Sep 2014 03:36:07 -0400
In-Reply-To: <20140916045243.GM3131@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.jf.intel.com>, Mark Brown <broonie@kernel.org>, kbuild test robot <fengguang.wu@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.jf.intel.com>, kbuild-all@01.org, linux-next@vger.kernel.org

On Tue, 2014-09-16 at 10:22 +0530, Vinod Koul wrote:
> On Mon, Sep 15, 2014 at 11:06:40AM +0300, Mika Westerberg wrote:
> > On Sat, Sep 13, 2014 at 10:00:53AM -0700, Mark Brown wrote:
> > > On Thu, Sep 11, 2014 at 01:17:50PM +0300, Mika Westerberg wrote:
> > > 
> > > > Vinod, this has dependency to the SPI tree. I suppose right way to
> > > > handle this is to merge Mark's topic/pxa2xx branch into this. Or
> > > > alternatively Mark can make an immutable branch containing the missing
> > > > commit that you can merge.
> > > 
> > > I've tagged this here, please do remember to coordinate dependencies
> > > when making this sort of multi-tree change:
> > 
> > Thanks Mark!
> > 
> > Vinod, can you pull this to your -next branch?
> Done, can you verify merge was okay as I had few conflicts.

There is one line missed:

+               .max_clk_rate = 50000000,

In the PORT_BYT section of the spi_info_configs[].

> 
> -- 
> ~Vinod
> > 
> > And sorry about this, we will make sure that next time we state all
> > the dependencies beforehand.
> > 
> > > 
> > > The following changes since commit 7d1311b93e58ed55f3a31cc8f94c4b8fe988a2b9:
> > > 
> > >   Linux 3.17-rc1 (2014-08-16 10:40:26 -0600)
> > > 
> > > are available in the git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-pxa2xx-clk
> > > 
> > > for you to fetch changes up to afa93c9017fd48d4d5265854c75f5fcde0871548:
> > > 
> > >   spi/pxa2xx-pci: Add common clock framework support in PCI glue layer (2014-08-16 17:19:50 -0500)
> > > 
> > > ----------------------------------------------------------------
> > > spi/pxa2xx: Add clock support
> > > 
> > > ----------------------------------------------------------------
> > > Chew, Chiau Ee (1):
> > >       spi/pxa2xx-pci: Add common clock framework support in PCI glue layer
> > > 
> > >  drivers/spi/Kconfig          |  2 +-
> > >  drivers/spi/spi-pxa2xx-pci.c | 21 ++++++++++++++++++++-
> > >  2 files changed, 21 insertions(+), 2 deletions(-)
> > 
> > 
> 


-- 
Andy Shevchenko <andriy.shevchenko@intel.com>
Intel Finland Oy
