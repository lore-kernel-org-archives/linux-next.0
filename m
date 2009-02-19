From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] eeepc: needs to depend on INPUT
Date: Thu, 19 Feb 2009 09:16:32 -0800
Message-ID: <499D93F0.2090803@oracle.com>
References: <20090220002832.cad00fcd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757017AbZBSRQW@vger.kernel.org>
In-Reply-To: <20090220002832.cad00fcd.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Corentin Chary <corentincj@iksaif.net>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

EEEPC_LAPTOP needs to depend on INPUT to fix build errors that
can happen when EEEPC_LAPTOP=y and INPUT=m:

drivers/built-in.o: In function `eeepc_hotk_add':
eeepc-laptop.c:(.text+0x14f403): undefined reference to `input_allocate_device'
eeepc-laptop.c:(.text+0x14f7a4): undefined reference to `input_register_device'
eeepc-laptop.c:(.text+0x14f7c8): undefined reference to `input_free_device'
drivers/built-in.o: In function `eeepc_input_exit':
eeepc-laptop.c:(.text+0x14f9d7): undefined reference to `input_unregister_device'
drivers/built-in.o: In function `eeepc_hotk_notify':
eeepc-laptop.c:(.text+0x14faf6): undefined reference to `input_event'
eeepc-laptop.c:(.text+0x14fb0c): undefined reference to `input_event'
eeepc-laptop.c:(.text+0x14fb32): undefined reference to `input_event'
eeepc-laptop.c:(.text+0x14fb48): undefined reference to `input_event'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090219.orig/drivers/platform/x86/Kconfig
+++ linux-next-20090219/drivers/platform/x86/Kconfig
@@ -313,7 +313,7 @@ config INTEL_MENLOW
 
 config EEEPC_LAPTOP
 	tristate "Eee PC Hotkey Driver (EXPERIMENTAL)"
-	depends on ACPI
+	depends on ACPI && INPUT
 	depends on EXPERIMENTAL
 	select BACKLIGHT_CLASS_DEVICE
 	select HWMON
