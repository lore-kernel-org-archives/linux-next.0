From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] thinkpad_acpi: fix build, HOTKEY_POLL is optional
Date: Fri, 9 Oct 2009 16:17:23 -0700
Message-ID: <20091009161723.b68b91a7.randy.dunlap@oracle.com>
References: <20091009190654.741eeffd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1761845AbZJIXT3@vger.kernel.org>
In-Reply-To: <20091009190654.741eeffd.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, lenb@kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Deianov <borislav@users.sf.net>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix optional part of driver to be built optionally:

drivers/platform/x86/thinkpad_acpi.c:6251: error: implicit declaration of function 'tpacpi_hotkey_driver_mask_set'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/platform/x86/thinkpad_acpi.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20091009.orig/drivers/platform/x86/thinkpad_acpi.c
+++ linux-next-20091009/drivers/platform/x86/thinkpad_acpi.c
@@ -6245,12 +6245,14 @@ static int __init brightness_init(struct
 	ibm_backlight_device->props.brightness = b & TP_EC_BACKLIGHT_LVLMSK;
 	backlight_update_status(ibm_backlight_device);
 
+#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_BRGHT,
 			"brightness: registering brightness hotkeys "
 			"as change notification\n");
 	tpacpi_hotkey_driver_mask_set(hotkey_driver_mask
 				| TP_ACPI_HKEY_BRGHTUP_MASK
 				| TP_ACPI_HKEY_BRGHTDWN_MASK);;
+#endif
 	return 0;
 }
 
