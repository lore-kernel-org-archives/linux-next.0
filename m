From: Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Fri, 17 Jul 2015 01:14:05 +0200
Message-ID: <20150716231405.GA25147@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39937 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751953AbbGPXPu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 19:15:50 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Joonsoo Kim <js1304@gmail.com>, Benjamin LaHaise <bcrl@kvack.org>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

fs/aio.c can't be compiled if CONFIG_MMU=n, filemap_page_mkwrite()
is not defined in this case. Add yet another "must not be called"
helper into nommu.c to make the linker happy.

I still think this is pointless, afaics sys_io_setup() simply can't
succeed if CONFIG_MMU=n. Instead we should make CONFIG_AIO depend
on CONFIG_MMU.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 mm/nommu.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/mm/nommu.c b/mm/nommu.c
index e3026fd..979afad 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -2008,6 +2008,12 @@ void filemap_map_pages(struct vm_area_struct *vma, struct vm_fault *vmf)
 }
 EXPORT_SYMBOL(filemap_map_pages);
 
+int filemap_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf)
+{
+	BUG();
+	return 0;
+}
+
 static int __access_remote_vm(struct task_struct *tsk, struct mm_struct *mm,
 		unsigned long addr, void *buf, int len, int write)
 {
-- 
1.5.5.1
