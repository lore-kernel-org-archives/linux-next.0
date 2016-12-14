From: Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Initialize fstr_real_len
Date: Wed, 14 Dec 2016 11:09:25 +0100
Message-ID: <20161214100925.10797-1-richard@nod.at>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.sigma-star.at ([95.130.255.111]:45996 "EHLO
        mail.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753184AbcLNKJf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Dec 2016 05:09:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com, richard@nod.at, david@sigma-star.at, sfr@canb.auug.org.au, linux-next@vger.kernel.org

While fstr_real_len is only being used under if (encrypted),
gcc-6 still warns.

Fixes this false positive:
fs/ubifs/dir.c: In function 'ubifs_readdir':
fs/ubifs/dir.c:629:13: warning: 'fstr_real_len' may be used
uninitialized in this function [-Wmaybe-uninitialized]
    fstr.len = fstr_real_len

Initialize fstr_real_len to make gcc happy.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 7f01f3d2ac3b..1c5331ac9614 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -528,7 +528,7 @@ static unsigned int vfs_dent_type(uint8_t type)
  */
 static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 {
-	int fstr_real_len, err = 0;
+	int fstr_real_len = 0, err = 0;
 	struct fscrypt_name nm;
 	struct fscrypt_str fstr = {0};
 	union ubifs_key key;
-- 
2.10.2
