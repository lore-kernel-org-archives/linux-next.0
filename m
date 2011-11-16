From: Michal Simek <monstr@monstr.eu>
Subject: [PATCH] mm: Fix alloc_vm_area for noMMU system
Date: Wed, 16 Nov 2011 08:51:02 +0100
Message-ID: <1321429862-17703-1-git-send-email-monstr@monstr.eu>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:65392 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754627Ab1KPHvG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Nov 2011 02:51:06 -0500
Received: by bke11 with SMTP id 11so218145bke.19
        for <linux-next@vger.kernel.org>; Tue, 15 Nov 2011 23:51:05 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: sfr@canb.auug.org.au, Michal Simek <monstr@monstr.eu>, David Vrabel <david.vrabel@citrix.com>, Andrew Morton <akpm@linux-foundation.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Patch:
"xen: map foreign pages for shared rings by updating the PTEs directly"
(sha1: 5149c0d53f6959d6ab87b4702d544b17ebdc783e) changed number
of argument for alloc_vm_area but forget to change it for noMMU systems.
This patch fix it.

CC: David Vrabel <david.vrabel@citrix.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Signed-off-by: Michal Simek <monstr@monstr.eu>

---
It is for linux-next tree.

Michal
---
 mm/nommu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mm/nommu.c b/mm/nommu.c
index 73419c5..b982290 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -454,7 +454,7 @@ void  __attribute__((weak)) vmalloc_sync_all(void)
  *	between processes, it syncs the pagetable across all
  *	processes.
  */
-struct vm_struct *alloc_vm_area(size_t size)
+struct vm_struct *alloc_vm_area(size_t size, pte_t **ptes)
 {
 	BUG();
 	return NULL;
-- 
1.7.5.4
