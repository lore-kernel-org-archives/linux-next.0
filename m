From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Tue, 21 Jun 2011 19:58:23 +0200
Message-ID: <20110621175823.GB22420@sortiz-mobl>
References: <20110621130331.368aaf74.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:44417 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757073Ab1FUR6Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jun 2011 13:58:16 -0400
Content-Disposition: inline
In-Reply-To: <20110621130331.368aaf74.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hi Stephen,

On Tue, Jun 21, 2011 at 01:03:31PM +1000, Stephen Rothwell wrote:
> Hi Samuel,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/mfd/wm831x-core.c: In function 'wm831x_device_init':
> drivers/mfd/wm831x-core.c:1507:12: error: 'WM831X_XTAL_ENA' undeclared (first use in this function)
> 
> Caused by commit e1af6eaa2160 ("mfd: Only register wm831x RTC device if
> the 32.768kHz crystal is enabled").
Thanks for the heads up. That should be all fixed now.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
