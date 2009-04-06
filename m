From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] dmar: fix build
Date: Mon, 6 Apr 2009 19:40:01 +0400
Message-ID: <a4423d670904060840u5a144502t2b5dcf2773c00d11@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:39635 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758888AbZDFPkE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2009 11:40:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@linux.intel.com>

Fix this build error:
drivers/pci/dmar.c:47: error: expected '=', ',', ';', 'asm' or
'__attribute__' before 'dmar_tbl_size'

Should include acpi.h

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/pci/dmar.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/pci/dmar.c b/drivers/pci/dmar.c
index 25a00ce..b725a5f 100644
--- a/drivers/pci/dmar.c
+++ b/drivers/pci/dmar.c
@@ -33,6 +33,7 @@
 #include <linux/timer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <acpi/acpi.h>

 #undef PREFIX
 #define PREFIX "DMAR:"
