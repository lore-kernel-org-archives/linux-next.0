From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Thu, 15 Oct 2015 12:45:23 +0300
Message-ID: <1444902323.8361.632.camel@linux.intel.com>
References: <20151015132602.7816b658@canb.auug.org.au>
	 <7853704.H00KElTCBt@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:13491 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751011AbbJOJp2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Oct 2015 05:45:28 -0400
In-Reply-To: <7853704.H00KElTCBt@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Thu, 2015-10-15 at 10:59 +0200, Arnd Bergmann wrote:
> > 

> On Thursday 15 October 2015 13:26:02 Stephen Rothwell wrote:
> However, I also now see that 
> drivers/net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c
> has the same problem, so maybe it's better to add a temporary file
> with the old name containing "#include <linux/io-64-nonatomic-lo
> -hi.h>",
> which I will remove in the following merge window or as a follow-up.
> 
> Yet another way would be for me to wait until Linus has pulled both
> mfd and netdev been merged, and I'll let him know of the conflict
> in my pull request.

There are at least couple of drivers where I introduced a use of
lo_hi_* helpers (idma64.c and xhci header if the latter made Greg's
tree). Though didn't check if it's should be fixed.

For me looks like temporary (for one cycle) file might be a better work
around.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
