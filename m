From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 04/17] ocfs2: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:32 +0900
Message-ID: <1269885165-18617-5-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:57084 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755350Ab0C2RxA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 13:53:00 -0400
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Joel Becker <joel.becker@oracle.com>

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joel Becker <joel.becker@oracle.com>
---
 fs/ocfs2/reservations.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/ocfs2/reservations.c b/fs/ocfs2/reservations.c
index 7fc6cfe..ed59559 100644
--- a/fs/ocfs2/reservations.c
+++ b/fs/ocfs2/reservations.c
@@ -26,7 +26,6 @@
 
 #include <linux/fs.h>
 #include <linux/types.h>
-#include <linux/slab.h>
 #include <linux/highmem.h>
 #include <linux/bitops.h>
 #include <linux/list.h>
-- 
1.6.4.2
