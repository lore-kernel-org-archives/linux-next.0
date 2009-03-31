From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] sony-laptop should depend on RFKILL
Date: Wed, 1 Apr 2009 02:34:07 +0400
Message-ID: <20090331223407.GA10676@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f169.google.com ([209.85.218.169]:53948 "EHLO
	mail-bw0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755420AbZCaWeQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2009 18:34:16 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>, Len Brown <len.brown@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Fixes this build error when RFKILL is not set:

drivers/platform/x86/sony-laptop.c:1050: undefined reference to `rfkill_unregister'
and so on..

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/platform/x86/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3608081..36b1628 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -165,6 +165,7 @@ config SONY_LAPTOP
 	depends on ACPI
 	select BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
+	depends on RFKILL
 	  ---help---
 	  This mini-driver drives the SNC and SPIC devices present in the ACPI
 	  BIOS of the Sony Vaio laptops.
