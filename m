From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH] asus-laptop: fix warning in asus_handle_init
Date: Tue,  2 Mar 2010 22:24:12 +0100
Message-ID: <1267565052-12206-1-git-send-email-corentincj@iksaif.net>
References: <20100302140606.340170f7.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iksaif.net ([88.191.73.63]:52834 "EHLO iksaif.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751580Ab0CBVbg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Mar 2010 16:31:36 -0500
In-Reply-To: <20100302140606.340170f7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Len Brown <lenb@kernel.org>, platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

In function 'asus_laptop_get_info':
warning: passing argument 3 of 'asus_handle_init' from incompatible pointer type
note: expected 'char **' but argument is of type 'const char **'

Introduced by commit c21085108a02e1b838c34f3650c8cc9fbd178615
("asus-laptop: fix style problems reported by checkpath.pl").

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/asus-laptop.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 791fcf3..37fad4e 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -139,7 +139,7 @@ MODULE_PARM_DESC(bluetooth_status, "Set the wireless status on boot "
 
 /* Backlight */
 static acpi_handle lcd_switch_handle;
-static const char *lcd_switch_paths[] = {
+static char *lcd_switch_paths[] = {
   "\\_SB.PCI0.SBRG.EC0._Q10",	/* All new models */
   "\\_SB.PCI0.ISA.EC0._Q10",	/* A1x */
   "\\_SB.PCI0.PX40.ECD0._Q10",	/* L3C */
@@ -153,7 +153,7 @@ static const char *lcd_switch_paths[] = {
 #define METHOD_SWITCH_DISPLAY	"SDSP"
 
 static acpi_handle display_get_handle;
-static const char *display_get_paths[] = {
+static char *display_get_paths[] = {
   /* A6B, A6K A6R A7D F3JM L4R M6R A3G M6A M6V VX-1 V6J V6V W3Z */
   "\\_SB.PCI0.P0P1.VGA.GETD",
   /* A3E A4K, A4D A4L A6J A7J A8J Z71V M9V S5A M5A z33A W1Jc W2V G1 */
-- 
1.7.0
