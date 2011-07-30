From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] s390: add missing module.h/export.h includes
Date: Sat, 30 Jul 2011 09:25:15 +0200
Message-ID: <20110730072515.GA2641@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate7.uk.ibm.com ([194.196.100.167]:43204 "EHLO
	mtagate7.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753348Ab1G3HZb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Jul 2011 03:25:31 -0400
Received: from d06nrmr1307.portsmouth.uk.ibm.com (d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate7.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p6U7PGbp005718
	for <linux-next@vger.kernel.org>; Sat, 30 Jul 2011 07:25:16 GMT
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com [9.149.37.249])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p6U7PGmV2449554
	for <linux-next@vger.kernel.org>; Sat, 30 Jul 2011 08:25:16 +0100
Received: from d06av08.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p6U7PFwj016711
	for <linux-next@vger.kernel.org>; Sat, 30 Jul 2011 08:25:15 +0100
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Subject: [PATCH] s390: add missing module.h/export.h includes

From: Heiko Carstens <heiko.carstens@de.ibm.com>

Fix several compile errors on s390 caused by splitting module.h.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 arch/s390/crypto/sha_common.c    |    1 +
 arch/s390/mm/init.c              |    1 +
 drivers/s390/char/fs3270.c       |    1 +
 drivers/s390/char/sclp_cpi_sys.c |    1 +
 drivers/s390/char/vmur.c         |    1 +
 drivers/s390/cio/chp.c           |    2 ++
 drivers/s390/cio/qdio_debug.c    |    2 ++
 drivers/s390/kvm/kvm_virtio.c    |    1 +
 drivers/s390/scsi/zfcp_ccw.c     |    1 +
 drivers/s390/scsi/zfcp_dbf.c     |    1 +
 drivers/s390/scsi/zfcp_scsi.c    |    1 +
 11 files changed, 13 insertions(+)

--- a/arch/s390/crypto/sha_common.c
+++ b/arch/s390/crypto/sha_common.c
@@ -14,6 +14,7 @@
  */
 
 #include <crypto/internal/hash.h>
+#include <linux/module.h>
 #include "sha.h"
 #include "crypt_s390.h"
 
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -26,6 +26,7 @@
 #include <linux/pfn.h>
 #include <linux/poison.h>
 #include <linux/initrd.h>
+#include <linux/export.h>
 #include <linux/gfp.h>
 #include <asm/processor.h>
 #include <asm/system.h>
--- a/drivers/s390/char/fs3270.c
+++ b/drivers/s390/char/fs3270.c
@@ -11,6 +11,7 @@
 #include <linux/console.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/types.h>
--- a/drivers/s390/char/sclp_cpi_sys.c
+++ b/drivers/s390/char/sclp_cpi_sys.c
@@ -21,6 +21,7 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
+#include <linux/export.h>
 #include <asm/ebcdic.h>
 #include <asm/sclp.h>
 
--- a/drivers/s390/char/vmur.c
+++ b/drivers/s390/char/vmur.c
@@ -12,6 +12,7 @@
 #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
 
 #include <linux/kernel_stat.h>
+#include <linux/module.h>
 #include <linux/cdev.h>
 #include <linux/slab.h>
 
--- a/drivers/s390/cio/chp.c
+++ b/drivers/s390/cio/chp.c
@@ -10,6 +10,8 @@
 #include <linux/bug.h>
 #include <linux/workqueue.h>
 #include <linux/spinlock.h>
+#include <linux/export.h>
+#include <linux/sched.h>
 #include <linux/init.h>
 #include <linux/jiffies.h>
 #include <linux/wait.h>
--- a/drivers/s390/cio/qdio_debug.c
+++ b/drivers/s390/cio/qdio_debug.c
@@ -7,6 +7,8 @@
  */
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
+#include <linux/uaccess.h>
+#include <linux/export.h>
 #include <asm/debug.h>
 #include "qdio_debug.h"
 #include "qdio.h"
--- a/drivers/s390/kvm/kvm_virtio.c
+++ b/drivers/s390/kvm/kvm_virtio.c
@@ -20,6 +20,7 @@
 #include <linux/virtio_console.h>
 #include <linux/interrupt.h>
 #include <linux/virtio_ring.h>
+#include <linux/export.h>
 #include <linux/pfn.h>
 #include <asm/io.h>
 #include <asm/kvm_para.h>
--- a/drivers/s390/scsi/zfcp_ccw.c
+++ b/drivers/s390/scsi/zfcp_ccw.c
@@ -9,6 +9,7 @@
 #define KMSG_COMPONENT "zfcp"
 #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
 
+#include <linux/module.h>
 #include "zfcp_ext.h"
 #include "zfcp_reqlist.h"
 
--- a/drivers/s390/scsi/zfcp_dbf.c
+++ b/drivers/s390/scsi/zfcp_dbf.c
@@ -9,6 +9,7 @@
 #define KMSG_COMPONENT "zfcp"
 #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
 
+#include <linux/module.h>
 #include <linux/ctype.h>
 #include <linux/slab.h>
 #include <asm/debug.h>
--- a/drivers/s390/scsi/zfcp_scsi.c
+++ b/drivers/s390/scsi/zfcp_scsi.c
@@ -9,6 +9,7 @@
 #define KMSG_COMPONENT "zfcp"
 #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
 
+#include <linux/module.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <scsi/fc/fc_fcp.h>
