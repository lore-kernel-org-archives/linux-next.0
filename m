From: Nitin Gupta <ngupta@vflare.org>
Subject: Re: [PATCH -next] zram: fix build errors, depends on BLOCK
Date: Thu, 24 Jun 2010 10:06:03 +0530
Message-ID: <4C22E0B3.60203@vflare.org>
References: <20100623154531.0a4b02e1.sfr@canb.auug.org.au> <20100623202709.4ecb798c.randy.dunlap@oracle.com>
Reply-To: ngupta@vflare.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:56932 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751211Ab0FXEfp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jun 2010 00:35:45 -0400
In-Reply-To: <20100623202709.4ecb798c.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de

On 06/24/2010 08:57 AM, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix 49 zram build errors in one swoop.  Examples:
> 
> drivers/staging/zram/zram_drv.c:225: error: dereferencing pointer to incomplete type
> drivers/staging/zram/zram_drv.c:226: error: implicit declaration of function 'bio_for_each_segment'
> drivers/staging/zram/zram_drv.c:226: error: expected ';' before '{' token
> drivers/staging/zram/zram_drv.c:281: error: implicit declaration of function 'bio_endio'
> drivers/staging/zram/zram_drv.c:285: error: implicit declaration of function 'bio_io_error'
> drivers/staging/zram/zram_drv.c:545: error: implicit declaration of function 'set_capacity'
> drivers/staging/zram/zram_drv.c:548: error: implicit declaration of function 'queue_flag_set_unlocked'
> drivers/staging/zram/zram_drv.c:548: error: 'QUEUE_FLAG_NONROT' undeclared (first use in this function)
> drivers/staging/zram/zram_drv.c:548: error: dereferencing pointer to incomplete type
> 


Thanks for the fix. Strangely, I didn't get any of these
errors when I compiled against mainline.

Nitin
