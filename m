From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drivers-x86 tree with Linus' tree
Date: Wed, 25 Aug 2010 11:22:36 +1000
Message-ID: <20100825112236.6ec0390e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36126 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751710Ab0HYBWm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Aug 2010 21:22:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Matthew,

Today's linux-next merge of the drivers-x86 tree got a conflict in
drivers/platform/x86/Kconfig between commit
c76a3e1d6c52c5cc1371f1abc7381c5715ebdf7f ("ACPI_TOSHIBA needs LEDS
support") from Lunus' tree and commit
35989e9d7e19deb4b395aee7d120b1536337b4af ("toshiba-acpi - switch to using
sparse keymap") from the drivers-x86 tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/platform/x86/Kconfig
index cff7cc2,8498389..0000000
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@@ -486,12 -490,10 +490,12 @@@ config TOPSTAR_LAPTO
  config ACPI_TOSHIBA
  	tristate "Toshiba Laptop Extras"
  	depends on ACPI
 +	depends on LEDS_CLASS
 +	depends on NEW_LEDS
 +	depends on BACKLIGHT_CLASS_DEVICE
  	depends on INPUT
  	depends on RFKILL || RFKILL = n
- 	select INPUT_POLLDEV
+ 	select INPUT_SPARSEKMAP
 -	select BACKLIGHT_CLASS_DEVICE
  	---help---
  	  This driver adds support for access to certain system settings
  	  on "legacy free" Toshiba laptops.  These laptops can be recognized by
