From: Steffen Sledz <sledz@dresearch.de>
Subject: [PATCH] ubifs: avoid kernel error if ubifs superblock read fails
Date: Fri, 24 Sep 2010 11:54:41 +0200
Message-ID: <1285322081-17144-1-git-send-email-sledz__22180.862472351$1285329265$gmane$org@dresearch.de>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from proxy.DResearch.DE ([87.193.137.100]:49425 "EHLO
	mail.dresearch.de" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754793Ab0IXLyV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Sep 2010 07:54:21 -0400
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 45D2F491282
	for <linux-next@vger.kernel.org>; Fri, 24 Sep 2010 13:21:53 +0200 (CEST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Steffen Sledz <sledz@dresearch.de>

* .get_sb is called on mounts with automatic fs detection too, so this
  function should not print an error if it cannot read the superblock
  (new behaviour conforms the other fs types)

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 fs/ubifs/super.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index cd5900b..e62bb75 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2049,8 +2049,6 @@ static int ubifs_get_sb(struct file_system_type *fs_type, int flags,
 	 */
 	ubi = open_ubi(name, UBI_READONLY);
 	if (IS_ERR(ubi)) {
-		ubifs_err("cannot open \"%s\", error %d",
-			  name, (int)PTR_ERR(ubi));
 		return PTR_ERR(ubi);
 	}
 	ubi_get_volume_info(ubi, &vi);
-- 
1.7.1
