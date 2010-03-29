From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 16/17] acpi: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:44 +0900
Message-ID: <1269885165-18617-17-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:57102 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755388Ab0C2RxC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 13:53:02 -0400
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Len Brown <lenb@kernel.org>

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>
---
 drivers/acpi/apei/apei-base.c |    1 +
 drivers/acpi/atomicio.c       |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/acpi/apei/apei-base.c b/drivers/acpi/apei/apei-base.c
index c35fec7..2672880 100644
--- a/drivers/acpi/apei/apei-base.c
+++ b/drivers/acpi/apei/apei-base.c
@@ -34,6 +34,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/acpi.h>
+#include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/kref.h>
 #include <linux/rculist.h>
diff --git a/drivers/acpi/atomicio.c b/drivers/acpi/atomicio.c
index 4ed1385..e21b1e4 100644
--- a/drivers/acpi/atomicio.c
+++ b/drivers/acpi/atomicio.c
@@ -31,6 +31,7 @@
 #include <linux/kref.h>
 #include <linux/rculist.h>
 #include <linux/interrupt.h>
+#include <linux/slab.h>
 #include <acpi/atomicio.h>
 
 #define ACPI_PFX "ACPI: "
-- 
1.6.4.2
