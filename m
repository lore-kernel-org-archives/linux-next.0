From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Widespread boot failures on ARM due to "mm/page_alloc.c:
 calculate zone_start_pfn at zone_spanned_pages_in_node()"
Date: Tue, 5 Jan 2016 16:22:01 -0800
Message-ID: <20160106002201.GA16273@roeck-us.net>
References: <20160104224233.GU16023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59900 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752369AbcAFAWI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2016 19:22:08 -0500
Content-Disposition: inline
In-Reply-To: <20160104224233.GU16023@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Taku Izumi <izumi.taku@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>, Mel Gorman <mel@csn.ul.ie>, Xishi Qiu <qiuxishi@huawei.com>, Dave Hansen <dave.hansen@intel.com>, Matt Fleming <matt@codeblueprint.co.uk>, Kamezawa Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Andrew Morton <akpm@linux-foundation.org>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, Kevin.Hilman@linaro.org, Tyler.Baker@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>

On Mon, Jan 04, 2016 at 10:42:33PM +0000, Mark Brown wrote:
> Since 20151231 -next has been failing to boot on a wide range of ARM
> platforms in the kernelci.org boot tests[1].  Doing bisections with
> Arndale and BeagleBone Black identifies 904769ac82ebf (mm/page_alloc.c:
> calculate zone_start_pfn at zone_spanned_pages_in_node()) from the akpm
> tree as the first broken commit[2,3].  An example bootlog from the
> failure is:
> 
>    http://storage.kernelci.org/next/next-20151231/arm-multi_v7_defconfig/lab-cambridge/boot-exynos5250-arndale.html
> 
> which shows no output on the console once we start the kernel, a brief
> sampling of failing boards suggests this is the normal failure mode.
> x86 and arm64 targets seem fine (juno shows up as failing but the boot
> log seems fine so it's probably a false positive, Mustang was failing
> already) and there are a small number of ARM platforms that boot.  I've
> not yet had any time to investigate further than that (including trying
> a revert of that commit), sorry.
> 
I see the same problem with my qemu tests for arm.

Reverting the offending commit together with cd31fe16b585 ("mm/page_alloc.c:
set a zone_start_pfn value in zone_spanned_pages_in_node") fixes the problem.

Guenter
