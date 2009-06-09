From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next] nommu: Provide mmap_min_addr definition.
Date: Tue, 9 Jun 2009 17:48:56 +0900
Message-ID: <20090609084856.GA18528@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:34667 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751809AbZFIItc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 04:49:32 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org

With the "security: use mmap_min_addr indepedently of security models"
change, mmap_min_addr is used in common areas, which susbsequently blows
up the nommu build. This stubs in the definition in the nommu case as
well.

Signed-off-by: Paul Mundt <lethal@linux-sh.org>
Cc: Christoph Lameter <cl@linux-foundation.org>
Cc: James Morris <jmorris@namei.org>

--

 mm/nommu.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/nommu.c b/mm/nommu.c
index b571ef7..2fd2ad5 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -69,6 +69,9 @@ int sysctl_max_map_count = DEFAULT_MAX_MAP_COUNT;
 int sysctl_nr_trim_pages = CONFIG_NOMMU_INITIAL_TRIM_EXCESS;
 int heap_stack_gap = 0;
 
+/* amount of vm to protect from userspace access */
+unsigned long mmap_min_addr = CONFIG_DEFAULT_MMAP_MIN_ADDR;
+
 atomic_long_t mmap_pages_allocated;
 
 EXPORT_SYMBOL(mem_map);
