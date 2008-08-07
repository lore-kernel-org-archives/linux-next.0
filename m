From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] Panasonic ACPI depends on INPUT
Date: Wed, 6 Aug 2008 17:29:38 -0700
Message-ID: <20080806172938.74b8033b.randy.dunlap@oracle.com>
References: <20080806182828.6bfe0a16.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:55960 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752931AbYHGAed (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Aug 2008 20:34:33 -0400
In-Reply-To: <20080806182828.6bfe0a16.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>, ak@linux.intel.com

From: Randy Dunlap <randy.dunlap@oracle.com>

Panasonic ACPI driver needs to depend on INPUT.
Otherwise it has build errors when CONFIG_INPUT=n:

drivers/built-in.o: In function `acpi_pcc_hotkey_remove':
pcc_acpi.c:(.text+0x25ded): undefined reference to `input_unregister_device'
pcc_acpi.c:(.text+0x25e03): undefined reference to `input_free_device'
drivers/built-in.o: In function `acpi_pcc_hotkey_notify':
pcc_acpi.c:(.text+0x260d5): undefined reference to `input_event'
pcc_acpi.c:(.text+0x260e2): undefined reference to `input_event'
drivers/built-in.o: In function `acpi_pcc_hotkey_add':
pcc_acpi.c:(.text+0x26267): undefined reference to `input_allocate_device'
pcc_acpi.c:(.text+0x26348): undefined reference to `input_register_device'
pcc_acpi.c:(.text+0x26405): undefined reference to `input_unregister_device'
pcc_acpi.c:(.text+0x26423): undefined reference to `input_free_device'
make[1]: *** [.tmp_vmlinux1] Error 1

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/acpi/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20080806.orig/drivers/acpi/Kconfig
+++ linux-next-20080806/drivers/acpi/Kconfig
@@ -259,7 +259,7 @@ config ACPI_ASUS
 
 config ACPI_PANASONIC
 	tristate "Panasonic Laptop Extras"
-	depends on X86
+	depends on X86 && INPUT
 	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This driver adds support for access to certain system settings
