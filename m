From: Guenter Roeck <linux@roeck-us.net>
Subject: Build errors in -next due to 'drivers:usb:fsl:Make fsl ehci drv an
 independent driver module'
Date: Wed, 27 May 2015 12:59:03 -0700
Message-ID: <20150527195903.GA5716@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55571 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726AbbE0T7H (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2015 15:59:07 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ramneek Mehresh <ramneek.mehresh@freescale.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

Hi,

your patch 'drivers:usb:fsl:Make fsl ehci drv an independent driver module'
converts the driver into a separate module. Unfortunately, it uses
non-exported functions from the ehci core code. This results in compile
errors for several powerpc configurations.

drivers/usb/host/ehci-fsl.c: In function 'ehci_fsl_drv_suspend':
drivers/usb/host/ehci-fsl.c:531:2: error: implicit declaration of function 'ehci_adjust_port_wakeup_flags'
drivers/usb/host/ehci-fsl.c: In function 'ehci_fsl_drv_resume':
drivers/usb/host/ehci-fsl.c:561:2: error: implicit declaration of function 'ehci_reset'

Guenter
