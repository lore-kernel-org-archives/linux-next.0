From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Tue, 11 Jul 2017 10:55:32 +1000
Message-ID: <20170711105532.045d0148@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55215 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750939AbdGKAzf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Jul 2017 20:55:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>

Hi Al,

After merging the vfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/platforms/cell/spufs/inode.c: In function 'spufs_show_options':
arch/powerpc/platforms/cell/spufs/inode.c:619:20: error: suggest parentheses around comparison in operand of '&' [-Werror=parentheses]
  if (inode->i_mode & S_IALLUGO != 0775)
                    ^
cc1: all warnings being treated as errors

Caused by commit

  86b1b993671d ("spufs: Implement show_options")

I applied the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 11 Jul 2017 10:44:55 +1000
Subject: [PATCH] spufs: always parenthesise bitwise expressions

arch/powerpc/platforms/cell/spufs/inode.c: In function 'spufs_show_options':
arch/powerpc/platforms/cell/spufs/inode.c:619:20: error: suggest parentheses around comparison in operand of '&' [-Werror=parentheses]
  if (inode->i_mode & S_IALLUGO != 0775)
                    ^

Fixes: 86b1b993671d "spufs: Implement show_options"
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/cell/spufs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index e210d69beeee..9558d725a99b 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -616,7 +616,7 @@ static int spufs_show_options(struct seq_file *m, struct dentry *root)
 	if (!gid_eq(inode->i_gid, GLOBAL_ROOT_GID))
 		seq_printf(m, ",gid=%u",
 			   from_kgid_munged(&init_user_ns, inode->i_gid));
-	if (inode->i_mode & S_IALLUGO != 0775)
+	if ((inode->i_mode & S_IALLUGO) != 0775)
 		seq_printf(m, ",mode=%o", inode->i_mode);
 	if (sbi->debug)
 		seq_puts(m, ",debug");
-- 
2.13.2

-- 
Cheers,
Stephen Rothwell
