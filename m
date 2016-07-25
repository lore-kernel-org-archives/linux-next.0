From: Rich Felker <dalias@libc.org>
Subject: Re: linux-next: build warning after merge of the sh tree
Date: Sun, 24 Jul 2016 23:50:10 -0400
Message-ID: <20160725035010.GP15995@brightrain.aerifal.cx>
References: <20160724110012.188b6a27@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:59168 "EHLO
	brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752585AbcGYDuU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 24 Jul 2016 23:50:20 -0400
Content-Disposition: inline
In-Reply-To: <20160724110012.188b6a27@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jul 24, 2016 at 11:00:12AM +1000, Stephen Rothwell wrote:
> Hi Rich,
> 
> After merging the sh tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/spi/spi-jcore.o
> 
> Introduced by commit
> 
>   8c7f438f0661 ("spi: add driver for J-Core SPI controller")

Thanks. I'll make that change for sending to the subsystem maintainer
and include it in my next rebase of for-next.

Rich
