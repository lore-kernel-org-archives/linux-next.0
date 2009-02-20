From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] oqo: depends on INPUT_POLLDEV
Date: Fri, 20 Feb 2009 08:30:07 -0800
Message-ID: <20090220083007.7bd0a153.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:45643 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752552AbZBTQ33 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Feb 2009 11:29:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Cc: lenb@kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

This patch (from 2009-feb-10) is still needed in today's linux-next.


Begin forwarded message:

Date: Tue, 10 Feb 2009 09:53:19 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
To: lkml <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [PATCH] oqo: depends on INPUT_POLLDEV


From: Randy Dunlap <randy.dunlap@oracle.com>

oqo driver uses polled input functions, so make it depend
on INPUT_POLLDEV.

ERROR: "input_register_polled_device" [drivers/platform/x86/oqo-wmi.ko] undefined!
ERROR: "input_allocate_polled_device" [drivers/platform/x86/oqo-wmi.ko] undefined!
ERROR: "input_free_polled_device" [drivers/platform/x86/oqo-wmi.ko] undefined!
ERROR: "input_unregister_polled_device" [drivers/platform/x86/oqo-wmi.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc:	Matthew Garrett <mjg59@srcf.ucam.org>
---
 drivers/platform/x86/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090210.orig/drivers/platform/x86/Kconfig
+++ linux-next-20090210/drivers/platform/x86/Kconfig
@@ -137,7 +137,7 @@ config MSI_LAPTOP
 config OQO_WMI
        tristate "OQO WMI extras"
        depends on ACPI_WMI
-       depends on INPUT
+       depends on INPUT && INPUT_POLLDEV
        depends on RFKILL
        depends on BACKLIGHT_CLASS_DEVICE
        help
