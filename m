From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Widespread boot failures on ARM due to
 "mm/page_alloc.c: calculate zone_start_pfn at zone_spanned_pages_in_node()"
Date: Mon, 4 Jan 2016 21:49:44 -0800
Message-ID: <20160104214944.8cafbcef.akpm@linux-foundation.org>
References: <20160104224233.GU16023@sirena.org.uk>
	<20160104150946.373ed02b8e8b81221340b7c8@linux-foundation.org>
	<20160104235512.GW16023@sirena.org.uk>
	<20160104163528.be56a4b1.akpm@linux-foundation.org>
	<20160105114918.2641f95d@canb.auug.org.au>
	<20160105164716.44b9db6d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:39043 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751579AbcAEFt6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2016 00:49:58 -0500
In-Reply-To: <20160105164716.44b9db6d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Taku Izumi <izumi.taku@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>, Mel Gorman <mel@csn.ul.ie>, Xishi Qiu <qiuxishi@huawei.com>, Dave Hansen <dave.hansen@intel.com>, Matt Fleming <matt@codeblueprint.co.uk>, Kamezawa Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, Kevin.Hilman@linaro.org, Tyler.Baker@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>

On Tue, 5 Jan 2016 16:47:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> On Tue, 5 Jan 2016 11:49:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 4 Jan 2016 16:35:28 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > Stephen, can we please retain
> > > 
> > > mm-calculate-zone_start_pfn-at-zone_spanned_pages_in_node.patch
> > > mm-introduce-kernelcore=mirror-option.patch
> > > mm-introduce-kernelcore=mirror-option-fix.patch
> > > mm-introduce-kernelcore=mirror-option-fix-2.patch
> > > 
> > > and add the below?  
> > 
> > Sure, that is easier than dropping the above patches, anyway.
> 
> I have done that *except* that
> mm-introduce-kernelcore=mirror-option-fix-2.patch is not in mmotm and I
> cannot find it anywhere.

oops sorry, I took it out so it isn't in today's
http://ozlabs.org/~akpm/mmots/broken-out/.  Here:


From: Arnd Bergmann <arnd@arndb.de>
Subject: mm: avoid unused variables in memmap_init_zone

A quick fix on mm/page_alloc.c introduced a harmless warning:

mm/page_alloc.c: In function 'memmap_init_zone':
mm/page_alloc.c:4617:44: warning: unused variable 'tmp' [-Wunused-variable]
mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]

This uses another #ifdef to avoid declaring the two variables when the
code is not built.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: Taku Izumi <izumi.taku@jp.fujitsu.com>
Cc: Tony Luck <tony.luck@intel.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/page_alloc.c |    2 ++
 1 file changed, 2 insertions(+)

diff -puN mm/page_alloc.c~mm-introduce-kernelcore=mirror-option-fix-2 mm/page_alloc.c
--- a/mm/page_alloc.c~mm-introduce-kernelcore=mirror-option-fix-2
+++ a/mm/page_alloc.c
@@ -4465,7 +4465,9 @@ void __meminit memmap_init_zone(unsigned
 	unsigned long pfn;
 	struct zone *z;
 	unsigned long nr_initialised = 0;
+#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
 	struct memblock_region *r = NULL, *tmp;
+#endif
 
 	if (highest_memmap_pfn < end_pfn - 1)
 		highest_memmap_pfn = end_pfn - 1;
_
