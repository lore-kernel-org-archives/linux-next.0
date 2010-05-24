From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] nouveau: fix acpi_lid_open undefined
Date: Sun, 23 May 2010 17:00:40 -0700
Message-ID: <20100523170040.3c4aa87c.randy.dunlap@oracle.com>
References: <20100522170459.4c89723d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:36935 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754190Ab0EXABC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 23 May 2010 20:01:02 -0400
In-Reply-To: <20100522170459.4c89723d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>

From: Randy Dunlap <randy.dunlap@oracle.com>

When CONFIG_ACPI_BUTTON=m (and probably when ACPI_BUTTON is not enabled)
and NOUVEAU is built-in (not as a loadable module):

nouveau_connector.c:(.text+0xe17ce): undefined reference to `acpi_lid_open'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_connector.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20100522.orig/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ linux-next-20100522/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -241,7 +241,8 @@ nouveau_connector_detect(struct drm_conn
 	if (nv_encoder && nv_connector->native_mode) {
 		unsigned status = connector_status_connected;
 
-#ifdef CONFIG_ACPI
+#if defined(CONFIG_ACPI_BUTTON) || \
+	(defined(CONFIG_ACPI_BUTTON_MODULE) && defined(MODULE))
 		if (!nouveau_ignorelid && !acpi_lid_open())
 			status = connector_status_unknown;
 #endif
