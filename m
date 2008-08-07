From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 5 (MTD build error)
Date: Wed, 6 Aug 2008 17:13:48 -0700
Message-ID: <20080806171348.a129245b.randy.dunlap@oracle.com>
References: <20080805175914.7649537f.sfr@canb.auug.org.au>
	<20080805175518.9fc09b92.randy.dunlap@oracle.com>
	<200808060320.20064.david-b@pacbell.net>
	<200808060413.08723.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:52111 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751387AbYHGAOg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Aug 2008 20:14:36 -0400
In-Reply-To: <200808060413.08723.david-b@pacbell.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Brownell <david-b@pacbell.net>
Cc: dwmw2@infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 6 Aug 2008 04:13:08 -0700 David Brownell wrote:

> On Wednesday 06 August 2008, David Brownell wrote:
> > On Tuesday 05 August 2008, Randy Dunlap wrote:
> > > 
> > > linux-next-20080805/drivers/mtd/devices/mtd_dataflash.c: In function 'add_dataflash_otp':
> > > linux-next-20080805/drivers/mtd/devices/mtd_dataflash.c:670: error: too many arguments to function 'otp_setup'
> > 
> > Bad merge somewhere? 
> 
> Whoops, sorry ... I see what was going on.  My bad.
> 
> --- g26.orig/drivers/mtd/devices/mtd_dataflash.c	2008-08-06 04:12:45.000000000 -0700
> +++ g26/drivers/mtd/devices/mtd_dataflash.c	2008-08-06 04:11:55.000000000 -0700
> @@ -616,7 +616,7 @@ static char *otp_setup(struct mtd_info *
>  
>  #else
>  
> -static char *otp_setup(struct mtd_info *device)
> +static char *otp_setup(struct mtd_info *device, char revision)
>  {
>  	return " (OTP)";
>  }
> --

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks, David.

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
