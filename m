From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] pci/intr_remapping.c should include acpi.h
Date: Mon, 6 Apr 2009 19:45:28 +0400
Message-ID: <a4423d670904060845l55064a5boc5d869a9d1ae26a7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:39336 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268AbZDFPpb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2009 11:45:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, David Woodhouse <David.Woodhouse@intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>

Fix this build error:
drivers/pci/intr_remapping.c: In function 'ir_parse_ioapic_scope':
drivers/pci/intr_remapping.c:617: error: invalid use of undefined type
'struct acpi_dmar_hardware_unit'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/pci/intr_remapping.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/pci/intr_remapping.c b/drivers/pci/intr_remapping.c
index 472be1c..f5e0ea7 100644
--- a/drivers/pci/intr_remapping.c
+++ b/drivers/pci/intr_remapping.c
@@ -9,6 +9,7 @@
 #include <asm/cpu.h>
 #include <linux/intel-iommu.h>
 #include "intr_remapping.h"
+#include <acpi/acpi.h>

 static struct ioapic_scope ir_ioapic[MAX_IO_APICS];
 static int ir_ioapic_num;
