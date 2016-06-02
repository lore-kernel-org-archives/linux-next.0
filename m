From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pstore tree
Date: Thu, 2 Jun 2016 10:25:56 +1000
Message-ID: <20160602102556.722ad0cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38053 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750822AbcFBAZ7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Jun 2016 20:25:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geliang Tang <geliangtang@163.com>

Hi Kees,

After merging the pstore tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/acpi/apei/erst.c:943:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .read  = erst_reader,
           ^

Caused by commit

  d8aaf3511a13 ("pstore: add lzo/lz4 compression support")

I added this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 2 Jun 2016 10:20:27 +1000
Subject: [PATCH] pstore: update acpi/apei/erst.c for struct pstore_info change

Fixes: d8aaf3511a13 ("pstore: add lzo/lz4 compression support")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/acpi/apei/erst.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/apei/erst.c b/drivers/acpi/apei/erst.c
index 006c3894c6ea..3024edf43a92 100644
--- a/drivers/acpi/apei/erst.c
+++ b/drivers/acpi/apei/erst.c
@@ -927,7 +927,8 @@ static int erst_open_pstore(struct pstore_info *psi);
 static int erst_close_pstore(struct pstore_info *psi);
 static ssize_t erst_reader(u64 *id, enum pstore_type_id *type, int *count,
 			   struct timespec *time, char **buf,
-			   bool *compressed, struct pstore_info *psi);
+			   bool *compressed, ssize_t *ecc_notice_size,
+			   struct pstore_info *psi);
 static int erst_writer(enum pstore_type_id type, enum kmsg_dump_reason reason,
 		       u64 *id, unsigned int part, int count, bool compressed,
 		       size_t size, struct pstore_info *psi);
@@ -987,7 +988,8 @@ static int erst_close_pstore(struct pstore_info *psi)
 
 static ssize_t erst_reader(u64 *id, enum pstore_type_id *type, int *count,
 			   struct timespec *time, char **buf,
-			   bool *compressed, struct pstore_info *psi)
+			   bool *compressed, ssize_t *ecc_notice_size,
+			   struct pstore_info *psi)
 {
 	int rc;
 	ssize_t len = 0;
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
