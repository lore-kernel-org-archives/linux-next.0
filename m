From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [slave-dma:for-linus 20/20] drivers/spi/spi-pxa2xx-pci.c:70:3:
 error: unknown field 'max_clk_rate' specified in initializer
Date: Tue, 16 Sep 2014 13:49:39 +0530
Message-ID: <20140916081939.GN3131@intel.com>
References: <5411735d.SAoL/AZyi+bJWC6n%fengguang.wu@intel.com>
 <20140911101750.GP13406@lahna.fi.intel.com>
 <20140913170053.GO7960@sirena.org.uk>
 <20140915080640.GM10854@lahna.fi.intel.com>
 <20140916045243.GM3131@intel.com>
 <1410852955.7023.50.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:62771 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753483AbaIPIom (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Sep 2014 04:44:42 -0400
Content-Disposition: inline
In-Reply-To: <1410852955.7023.50.camel@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.jf.intel.com>, Mark Brown <broonie@kernel.org>, kbuild test robot <fengguang.wu@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.jf.intel.com>, kbuild-all@01.org, linux-next@vger.kernel.org

On Tue, Sep 16, 2014 at 10:35:55AM +0300, Andy Shevchenko wrote:
> On Tue, 2014-09-16 at 10:22 +0530, Vinod Koul wrote:
> > On Mon, Sep 15, 2014 at 11:06:40AM +0300, Mika Westerberg wrote:
> > > On Sat, Sep 13, 2014 at 10:00:53AM -0700, Mark Brown wrote:
> > > > On Thu, Sep 11, 2014 at 01:17:50PM +0300, Mika Westerberg wrote:
> > > > 
> > > > > Vinod, this has dependency to the SPI tree. I suppose right way to
> > > > > handle this is to merge Mark's topic/pxa2xx branch into this. Or
> > > > > alternatively Mark can make an immutable branch containing the missing
> > > > > commit that you can merge.
> > > > 
> > > > I've tagged this here, please do remember to coordinate dependencies
> > > > when making this sort of multi-tree change:
> > > 
> > > Thanks Mark!
> > > 
> > > Vinod, can you pull this to your -next branch?
> > Done, can you verify merge was okay as I had few conflicts.
> 
> There is one line missed:
> 
> +               .max_clk_rate = 50000000,
> 
> In the PORT_BYT section of the spi_info_configs[].
Okay fixed this one..

-- 
~Vinod
