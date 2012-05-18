From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: Tree for May 16 (mfd/mc13xxx)
Date: Fri, 18 May 2012 13:04:20 +0200
Message-ID: <20120518110420.GM12015@sortiz-mobl>
References: <20120516201426.3a162ecd6adeb7132413f1b9@canb.auug.org.au>
 <4FB3CF4E.8000106@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:6968 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762427Ab2ERKyZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 May 2012 06:54:25 -0400
Content-Disposition: inline
In-Reply-To: <4FB3CF4E.8000106@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>

Hi Randy,

On Wed, May 16, 2012 at 09:01:18AM -0700, Randy Dunlap wrote:
> On 05/16/2012 03:14 AM, Stephen Rothwell wrote:
> 
> > 
> > The mfd tree lost its build failure but gained another so I used the
> > version from next-20120511.
> 
> 
> drivers/mfd/mc13xxx-core.c:726:2: error: implicit declaration of function 'regmap_exit'
> 
> 
> Full randconfig file is attached.
> (REGMAP is not enabled.)
I just pushed a patch to fix this one.

Cheers,
Samuel

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
