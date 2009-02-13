From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next 1/2] pohmelfs: fix build breakage
Date: Fri, 13 Feb 2009 15:53:57 +0300
Message-ID: <20090213125357.GA7003@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f20.google.com ([209.85.220.20]:33000 "EHLO
	mail-fx0-f20.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753407AbZBMMyJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Feb 2009 07:54:09 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: zbr@ioremap.net, gregkh@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

drivers/staging/pohmelfs/inode.c:982: error: implicit declaration of
function 'DQUOT_TRANSFER'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/staging/pohmelfs/inode.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/pohmelfs/inode.c b/drivers/staging/pohmelfs/inode.c
index 0980c3c..908fc64 100644
--- a/drivers/staging/pohmelfs/inode.c
+++ b/drivers/staging/pohmelfs/inode.c
@@ -979,7 +979,7 @@ int pohmelfs_setattr_raw(struct inode *inode, struct iattr *attr)
 
 	if ((attr->ia_valid & ATTR_UID && attr->ia_uid != inode->i_uid) ||
 	    (attr->ia_valid & ATTR_GID && attr->ia_gid != inode->i_gid)) {
-		err = DQUOT_TRANSFER(inode, attr) ? -EDQUOT : 0;
+		err = vfs_dq_transfer(inode, attr) ? -EDQUOT : 0;
 		if (err)
 			goto err_out_exit;
 	}
