From: Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH v3]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Tue, 21 Jul 2015 18:20:16 +0200
Message-ID: <20150721162016.GA17592@redhat.com>
References: <20150716231405.GA25147@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46826 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754653AbbGUQWJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jul 2015 12:22:09 -0400
Content-Disposition: inline
In-Reply-To: <20150716231405.GA25147@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Joonsoo Kim <js1304@gmail.com>, Benjamin LaHaise <bcrl@kvack.org>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Andrew,

this replaces

	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix.patch

in -mm tree nacked by Benjamin.

fs/aio.c can't be compiled if CONFIG_MMU=n, filemap_page_mkwrite() is
not defined in this case. Add ifdef(CONFIG_MMU) into aio_ring_vm_ops.

Note that this only fixes the build error, currently aio doesn't work
if !CONFIG_MMU anyway.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 fs/aio.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index c122624..822c199 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -338,9 +338,11 @@ static int aio_ring_mremap(struct vm_area_struct *vma)
 
 static const struct vm_operations_struct aio_ring_vm_ops = {
 	.mremap		= aio_ring_mremap,
+#if IS_ENABLED(CONFIG_MMU)
 	.fault		= filemap_fault,
 	.map_pages	= filemap_map_pages,
 	.page_mkwrite	= filemap_page_mkwrite,
+#endif
 };
 
 static int aio_ring_mmap(struct file *file, struct vm_area_struct *vma)
-- 
1.7.1
