From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Sun, 25 Jan 2009 17:10:07 -0800
Message-ID: <20090126011007.GA24070@kroah.com>
References: <20090126115044.0b2e3936.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:35077 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750911AbZAZBL1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 25 Jan 2009 20:11:27 -0500
Content-Disposition: inline
In-Reply-To: <20090126115044.0b2e3936.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Mon, Jan 26, 2009 at 11:50:44AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> arch/powerpc/platforms/ps3/system-bus.c: In function 'ps3_system_bus_probe':
> arch/powerpc/platforms/ps3/system-bus.c:379: error: 'struct device' has no member named 'bus_id'
> arch/powerpc/platforms/ps3/system-bus.c: In function 'ps3_system_bus_remove':
> arch/powerpc/platforms/ps3/system-bus.c:401: error: 'struct device' has no member named 'bus_id'
> 
> Caused by commit aab0d375e01d8c16e7e5b9bd915dfaa0a815418f ("powerpc:
> struct device - replace bus_id with dev_name(), dev_set_name()") not
> being thorough enough before commit
> 73babb2d89a71d2110b65aab658e6309748827c2 ("driver core: get rid of struct
> device's bus_id string array") was applied.
> 
> I have reverted the latter commit.

Gotta love the ps3 platform code, there is about 3 different fields
called "bus_id" in that file :(

Anyway, here's a patch that should fix this, Kay, look sane?

thanks,

greg k-h

---
 arch/powerpc/platforms/ps3/system-bus.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -376,7 +376,7 @@ static int ps3_system_bus_probe(struct d
 	struct ps3_system_bus_driver *drv;
 
 	BUG_ON(!dev);
-	pr_debug(" -> %s:%d: %s\n", __func__, __LINE__, _dev->bus_id);
+	dev_dbg(_dev, "%s:%d\n", __func__, __LINE__);
 
 	drv = ps3_system_bus_dev_to_system_bus_drv(dev);
 	BUG_ON(!drv);
@@ -398,7 +398,7 @@ static int ps3_system_bus_remove(struct 
 	struct ps3_system_bus_driver *drv;
 
 	BUG_ON(!dev);
-	pr_debug(" -> %s:%d: %s\n", __func__, __LINE__, _dev->bus_id);
+	dev_dbg(_dev, "%s:%d\n", __func__, __LINE__);
 
 	drv = ps3_system_bus_dev_to_system_bus_drv(dev);
 	BUG_ON(!drv);
