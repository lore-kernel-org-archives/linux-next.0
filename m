From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the drm tree
Date: Mon, 20 Jun 2016 14:33:53 +1000
Message-ID: <20160620143353.03399257@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50038 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751741AbcFTEd4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jun 2016 00:33:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/android/sync.h

between commit:

  76bf0db55439 ("dma-buf/fence: make fence context 64 bit v2")

from the drm tree and commits:

  342952d3a5c4 ("staging/android: remove 'destroyed' member from struct sync_timeline")
  1fe82e2e1486 ("staging/android: rename sync.h to sync_debug.h")

from the staging tree.

I fixed it up (I removed the file and applied the following fix patch)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 20 Jun 2016 14:28:29 +1000
Subject: [PATCH] staging/android: merge fix up for sync.h renaming

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/android/sync_debug.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/android/sync_debug.h b/drivers/staging/android/sync_debug.h
index 425ebc5c32aa..fab66396d421 100644
--- a/drivers/staging/android/sync_debug.h
+++ b/drivers/staging/android/sync_debug.h
@@ -34,7 +34,8 @@ struct sync_timeline {
 	char			name[32];
 
 	/* protected by child_list_lock */
-	int			context, value;
+	u64			context;
+	int			value;
 
 	struct list_head	child_list_head;
 	spinlock_t		child_list_lock;
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
