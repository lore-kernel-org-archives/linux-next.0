From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: vfs tree build failure
Date: Wed, 15 Oct 2008 17:49:47 +1100
Message-ID: <20081015174947.64f4b008.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48542 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751431AbYJOGuh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 02:50:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>, Theodore Ts'o <tytso@mit.edu>

Hi Al,

Today's linux-next build (x86_64 allmodconfig) failed like this:

fs/ext4/super.c: In function 'ext4_quota_on':
fs/ext4/super.c:3437: error: 'nd' undeclared (first use in this function)

Caused by the merge of commit 7ffe1ea8949c75ecffb7a4d988bb881a9fa62fbe
("ext4: add checks for errors from jbd2" from Linus' tree and commit
6ac465f99b29f74ca5a62bc32a8772985d9a071b ("[PATCH] switch
quota_on-related stuff to kern_path()") from the vfs tree.

I added the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Oct 2008 17:45:27 +1100
Subject: [PATCH] vfs: fix up merge of ext4

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/ext4/super.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 4042fd4..2844e1d 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -3434,7 +3434,7 @@ static int ext4_quota_on(struct super_block *sb, int type, int format_id,
 		err = jbd2_journal_flush(EXT4_SB(sb)->s_journal);
 		jbd2_journal_unlock_updates(EXT4_SB(sb)->s_journal);
 		if (err) {
-			path_put(&nd.path);
+			path_put(&path);
 			return err;
 		}
 	}
-- 
1.5.6.5
