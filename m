From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: leds tree build failure
Date: Tue, 21 Oct 2008 15:47:22 +1100
Message-ID: <20081021154722.fa74b698.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58865 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751056AbYJUEra (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 00:47:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-next@vger.kernel.org, Pavel Machek <pavel@suse.cz>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Richard,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/leds/leds-hp-disk.c: In function 'hpled_add':
drivers/leds/leds-hp-disk.c:101: error: invalid lvalue in assignment

Caused by commit 9c78ff6e65cad9f9fcf0bbde2bfbbf3a544fb704 ("leds: Add
driver for HP harddisk protection LEDs") from the leds tree inertacting
with commit db89b4f0dbab837d0f3de2c3e9427a8d5393afa3 ("ACPI: catch calls
of acpi_driver_data on pointer of wrong type") from the acpi tree.

I fixed it up (see below).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 21 Oct 2008 15:44:45 +1100
Subject: [PATCH] leds/acpi: fix merge fallout from acpi_driver_data change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/leds/leds-hp-disk.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/leds/leds-hp-disk.c b/drivers/leds/leds-hp-disk.c
index d636280..53a25b1 100644
--- a/drivers/leds/leds-hp-disk.c
+++ b/drivers/leds/leds-hp-disk.c
@@ -98,7 +98,7 @@ static int hpled_add(struct acpi_device *device)
 	adev.device = device;
 	strcpy(acpi_device_name(device), DRIVER_NAME);
 	strcpy(acpi_device_class(device), ACPI_MDPS_CLASS);
-	acpi_driver_data(device) = &adev;
+	device->driver_data = &adev;
 
 	ret = led_classdev_register(NULL, &hpled_led);
 	return ret;
-- 
1.5.6.5
