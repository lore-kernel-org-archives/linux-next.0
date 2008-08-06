From: David Brownell <david-b@pacbell.net>
Subject: Re: linux-next: Tree for August 5 (MTD build error)
Date: Wed, 6 Aug 2008 04:13:08 -0700
Message-ID: <200808060413.08723.david-b@pacbell.net>
References: <20080805175914.7649537f.sfr@canb.auug.org.au> <20080805175518.9fc09b92.randy.dunlap@oracle.com> <200808060320.20064.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp119.sbc.mail.sp1.yahoo.com ([69.147.64.92]:48471 "HELO
	smtp119.sbc.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1756739AbYHFLNL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Aug 2008 07:13:11 -0400
In-Reply-To: <200808060320.20064.david-b@pacbell.net>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: dwmw2@infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wednesday 06 August 2008, David Brownell wrote:
> On Tuesday 05 August 2008, Randy Dunlap wrote:
> > 
> > linux-next-20080805/drivers/mtd/devices/mtd_dataflash.c: In function 'add_dataflash_otp':
> > linux-next-20080805/drivers/mtd/devices/mtd_dataflash.c:670: error: too many arguments to function 'otp_setup'
> 
> Bad merge somewhere? 

Whoops, sorry ... I see what was going on.  My bad.

--- g26.orig/drivers/mtd/devices/mtd_dataflash.c	2008-08-06 04:12:45.000000000 -0700
+++ g26/drivers/mtd/devices/mtd_dataflash.c	2008-08-06 04:11:55.000000000 -0700
@@ -616,7 +616,7 @@ static char *otp_setup(struct mtd_info *
 
 #else
 
-static char *otp_setup(struct mtd_info *device)
+static char *otp_setup(struct mtd_info *device, char revision)
 {
 	return " (OTP)";
 }
