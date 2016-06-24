From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with Linus' tree
Date: Fri, 24 Jun 2016 14:41:25 +1000
Message-ID: <20160624144125.78cc4e25@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in:

  fs/proc/root.c

between commit:

  e54ad7f1ee26 ("proc: prevent stacking filesystems on top")

from Linus' tree and commit:

  e94591d0d90c ("proc: Convert proc_mount to use mount_ns")

from the userns tree.

I fixed it up (I used the userns version of this file and added the
following patch) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 24 Jun 2016 14:27:47 +1000
Subject: [PATCH] proc: fixup for "prevent stacking filesystems on top"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/proc/inode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/proc/inode.c b/fs/proc/inode.c
index a5b2c33745b7..6b1843e78bd7 100644
--- a/fs/proc/inode.c
+++ b/fs/proc/inode.c
@@ -463,6 +463,13 @@ int proc_fill_super(struct super_block *s, void *data, int silent)
 	struct inode *root_inode;
 	int ret;
 
+	/*
+	 * procfs isn't actually a stacking filesystem; however, there is
+	 * too much magic going on inside it to permit stacking things on
+	 * top of it
+	 */
+	s->s_stack_depth = FILESYSTEM_MAX_STACK_DEPTH;
+
 	if (!proc_parse_options(data, ns))
 		return -EINVAL;
 
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
