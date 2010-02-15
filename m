From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for February 15 (staging/dt3155)
Date: Mon, 15 Feb 2010 08:46:20 -0800
Message-ID: <4B797A5C.8020306@oracle.com>
References: <20100215194926.667a3de8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:63420 "EHLO
	rcsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755119Ab0BOQrS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2010 11:47:18 -0500
In-Reply-To: <20100215194926.667a3de8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org, Greg KH <gregkh@suse.de>

On 02/15/10 00:49, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100212:


1/  dt3155 tries to use arbitrary divide & modulus.  This fails on i386:

ERROR: "__udivdi3" [drivers/staging/dt3155/dt3155.ko] undefined!
ERROR: "__umoddi3" [drivers/staging/dt3155/dt3155.ko] undefined!

2/  since DT3155 depends on PCI, these lines can be dropped from dt3155_drv.c:

-#ifndef CONFIG_PCI
-#error  "DT3155 :  Kernel PCI support not enabled (DT3155 drive requires PCI)"
-#endif

3/  header files need to be included even when built-in instead of defined(MODULE)
to eliminate build errors:

drivers/staging/dt3155/dt3155_drv.c:1047: error: implicit declaration of function 'request_irq'
drivers/staging/dt3155/dt3155_drv.c:1048: error: 'IRQF_SHARED' undeclared (first use in this function)
drivers/staging/dt3155/dt3155_drv.c:1048: error: 'IRQF_DISABLED' undeclared (first use in this function)
drivers/staging/dt3155/dt3155_drv.c:1091: error: implicit declaration of function 'free_irq'


-#ifdef MODULE
 #include <linux/module.h>
 #include <linux/interrupt.h>
 
 
 MODULE_LICENSE("GPL");
 
-#endif


-- 
~Randy
