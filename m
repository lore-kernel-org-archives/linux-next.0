From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Thu, 15 Oct 2015 10:59:32 +0200
Message-ID: <7853704.H00KElTCBt@wuerfel>
References: <20151015132602.7816b658@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151015132602.7816b658@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Thursday 15 October 2015 13:26:02 Stephen Rothwell wrote:
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/mfd/intel-lpss.c:29:47: fatal error: asm-generic/io-64-nonatomic-lo-hi.h: No such file or directory
>  #include <asm-generic/io-64-nonatomic-lo-hi.h>
>                                                ^
> 
> Caused by commit
> 
>   6a1d82fbc8e8 ("mfd: intel-lpss: Use writeq() helper")
> 
> interacting with commit
> 
>   f626fe17485b ("move io-64-nonatomic*.h out of asm-generic")
> 
> from the asm-generic tree.
> 
> I have added the following merge fix patch and can carry it as necessary.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 15 Oct 2015 13:23:20 +1100
> Subject: [PATCH] mfd: fix for "move io-64-nonatomic*.h out of asm-generic"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

The patch looks good, should we do something to prevent that from
becoming a problem when Linus pulls our branches?

This commit is at the bottom of my asm-generic git tree, so Lee could merge
that one commit into his tree and fix up the merge correctly.

However, I also now see that drivers/net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c
has the same problem, so maybe it's better to add a temporary file
with the old name containing "#include <linux/io-64-nonatomic-lo-hi.h>",
which I will remove in the following merge window or as a follow-up.

Yet another way would be for me to wait until Linus has pulled both
mfd and netdev been merged, and I'll let him know of the conflict
in my pull request.

	Arnd
