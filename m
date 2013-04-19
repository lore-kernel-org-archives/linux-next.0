From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] nilfs2: fix printk format warning in page.c
Date: Fri, 19 Apr 2013 14:19:07 -0700
Message-ID: <5171B4CB.7040302@infradead.org>
References: <20130419181924.a035efe6d5e73fe0db9ddb84@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:52633 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754413Ab3DSVT3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Apr 2013 17:19:29 -0400
In-Reply-To: <20130419181924.a035efe6d5e73fe0db9ddb84@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KONISHI Ryusuke <konishi.ryusuke@lab.ntt.co.jp>, linux-nilfs@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix printk format warning by using %zu for 'size_t':

fs/nilfs2/page.c:430:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' [-Wformat]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc:	KONISHI Ryusuke <konishi.ryusuke@lab.ntt.co.jp>
Cc:	linux-nilfs@vger.kernel.org
---
 fs/nilfs2/page.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20130419.orig/fs/nilfs2/page.c
+++ linux-next-20130419/fs/nilfs2/page.c
@@ -426,7 +426,7 @@ void nilfs_clear_dirty_page(struct page
 			lock_buffer(bh);
 			if (!silent) {
 				nilfs_warning(sb, __func__,
-					"discard block %llu, size %lu",
+					"discard block %llu, size %zu",
 					(u64)bh->b_blocknr, bh->b_size);
 			}
 			clear_buffer_dirty(bh);
