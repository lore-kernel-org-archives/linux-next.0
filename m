From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Thu, 15 Oct 2015 14:04:07 +0200
Message-ID: <20151015120407.GA31945@lst.de>
References: <20151015132602.7816b658@canb.auug.org.au> <7853704.H00KElTCBt@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7853704.H00KElTCBt@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 15, 2015 at 10:59:32AM +0200, Arnd Bergmann wrote:
> The patch looks good, should we do something to prevent that from
> becoming a problem when Linus pulls our branches?
> 
> This commit is at the bottom of my asm-generic git tree, so Lee could merge
> that one commit into his tree and fix up the merge correctly.
> 
> However, I also now see that drivers/net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c
> has the same problem, so maybe it's better to add a temporary file
> with the old name containing "#include <linux/io-64-nonatomic-lo-hi.h>",
> which I will remove in the following merge window or as a follow-up.

I guess we really need that.  Do you want to do a quick fixup or should I send
a patch?
