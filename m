From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 10 (iio)
Date: Tue, 10 Jul 2012 22:51:20 -0700
Message-ID: <4FFD1458.6000404@xenotime.net>
References: <20120710174320.3b7dd806e20ee74ca1b1685f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:41585 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753315Ab2GKFwF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jul 2012 01:52:05 -0400
In-Reply-To: <20120710174320.3b7dd806e20ee74ca1b1685f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-iio@vger.kernel.org, Jonathan Cameron <jic23@cam.ac.uk>, Lars-Peter Clausen <lars@metafoo.de>

On 07/10/2012 12:43 AM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120709:
> 



on x86_64:

drivers/iio/dac/ad5064.c: In function 'ad5064_i2c_write':
drivers/iio/dac/ad5064.c:132:2: error: implicit declaration of function 'i2c_master_send'




-- 

~Randy
