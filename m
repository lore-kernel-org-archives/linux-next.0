From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Widespread boot failures on ARM due to "mm/page_alloc.c:
 calculate zone_start_pfn at zone_spanned_pages_in_node()"
Date: Tue, 5 Jan 2016 16:47:16 +1100
Message-ID: <20160105164716.44b9db6d@canb.auug.org.au>
References: <20160104224233.GU16023@sirena.org.uk>
	<20160104150946.373ed02b8e8b81221340b7c8@linux-foundation.org>
	<20160104235512.GW16023@sirena.org.uk>
	<20160104163528.be56a4b1.akpm@linux-foundation.org>
	<20160105114918.2641f95d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50480 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751592AbcAEFrS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Jan 2016 00:47:18 -0500
In-Reply-To: <20160105114918.2641f95d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Taku Izumi <izumi.taku@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>, Mel Gorman <mel@csn.ul.ie>, Xishi Qiu <qiuxishi@huawei.com>, Dave Hansen <dave.hansen@intel.com>, Matt Fleming <matt@codeblueprint.co.uk>, Kamezawa Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, Kevin.Hilman@linaro.org, Tyler.Baker@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>

Hi Andrew,

On Tue, 5 Jan 2016 11:49:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Mon, 4 Jan 2016 16:35:28 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > Stephen, can we please retain
> > 
> > mm-calculate-zone_start_pfn-at-zone_spanned_pages_in_node.patch
> > mm-introduce-kernelcore=mirror-option.patch
> > mm-introduce-kernelcore=mirror-option-fix.patch
> > mm-introduce-kernelcore=mirror-option-fix-2.patch
> > 
> > and add the below?  
> 
> Sure, that is easier than dropping the above patches, anyway.

I have done that *except* that
mm-introduce-kernelcore=mirror-option-fix-2.patch is not in mmotm and I
cannot find it anywhere.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
