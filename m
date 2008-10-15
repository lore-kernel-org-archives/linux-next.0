From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: acpi tree build failure
Date: Wed, 15 Oct 2008 16:08:37 +1100
Message-ID: <20081015160837.71912a6d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58053 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750862AbYJOFMM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 01:12:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Shaohua Li <shaohua.li@intel.com>

Hi Len,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "acpi_os_hotplug_execute" [drivers/acpi/dock.ko] undefined!

Caused by commit 19cd847ab24fefe9e50101ec94479e0400a08650 ("ACPI: fix
hotplug race").  I added the patch below.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Oct 2008 16:07:16 +1100
Subject: [PATCH] acpi: acpi_os_hotplug_execute needs to be exported

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/acpi/osl.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index d65862b..a384155 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -772,6 +772,7 @@ acpi_status acpi_os_hotplug_execute(acpi_osd_exec_callback function,
 {
 	return __acpi_os_execute(0, function, context, 1);
 }
+EXPORT_SYMBOL(acpi_os_hotplug_execute);
 
 void acpi_os_wait_events_complete(void *context)
 {
-- 
1.5.6.5
