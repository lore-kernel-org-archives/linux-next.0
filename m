From: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Initialize local
 in_tablet_mode and type
Date: Wed, 14 Dec 2016 20:14:24 -0800
Message-ID: <20161215041424.GA19534@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude <lyude@redhat.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, platform-drivers-x86@vger.kernel.org
List-Id: linux-next.vger.kernel.org

linux-next reported in_tablet_mode and type may be used uninitialized
after:

b31800283868 ("platform/x86: thinkpad_acpi: Move tablet detection into separate function")

This turns out to be a false positive as the pr_info call cannot be
reached if tp_features.hotkey_tablet (global scope) is 0, and
in_tablet_mode and type are assigned in both places
tp_features.hotkey_tablet is assigned.

Regardless, to make it explicit and avoid further reports, initialize
in_tablet_mode to 0 and type to "".

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Lyude <lyude@redhat.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Since v1: Initialize type also.

 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 69cb0da..c408390 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3143,8 +3143,8 @@ typedef tpacpi_keymap_entry_t tpacpi_keymap_t[TPACPI_HOTKEY_MAP_LEN];
 
 static int hotkey_init_tablet_mode(void)
 {
-	int in_tablet_mode, res;
-	char *type;
+	int in_tablet_mode = 0, res;
+	char *type = "";
 
 	if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
 		/* For X41t, X60t, X61t Tablets... */
-- 
2.9.3


-- 
Darren Hart
Intel Open Source Technology Center
