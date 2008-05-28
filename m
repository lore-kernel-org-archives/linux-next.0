From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] ocfs2: fix printk format warnings with
 OCFS2_FS_STATS=n
Date: Wed, 28 May 2008 14:41:00 -0700
Message-ID: <20080528144100.13ec8c6a.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org
Cc: mfasheh@suse.com, joel.becker@oracle.com, ocfs2-devel@oss.oracle.com, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warnings when OCFS2_FS_STATS=n:

linux-next-20080528/fs/ocfs2/dlmglue.c: In function 'ocfs2_dlm_seq_show':
linux-next-20080528/fs/ocfs2/dlmglue.c:2623: warning: format '%llu' expects type 'long long unsigned int', but argument 3 has type 'int'
linux-next-20080528/fs/ocfs2/dlmglue.c:2623: warning: format '%llu' expects type 'long long unsigned int', but argument 4 has type 'int'
linux-next-20080528/fs/ocfs2/dlmglue.c:2623: warning: format '%llu' expects type 'long long unsigned int', but argument 7 has type 'int'
linux-next-20080528/fs/ocfs2/dlmglue.c:2623: warning: format '%llu' expects type 'long long unsigned int', but argument 8 has type 'int'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 fs/ocfs2/dlmglue.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20080528.orig/fs/ocfs2/dlmglue.c
+++ linux-next-20080528/fs/ocfs2/dlmglue.c
@@ -2592,12 +2592,12 @@ static int ocfs2_dlm_seq_show(struct seq
 # define lock_max_exmode(_l)		(_l)->l_lock_max_exmode
 # define lock_refresh(_l)		(_l)->l_lock_refresh
 #else
-# define lock_num_prmode(_l)		(0)
-# define lock_num_exmode(_l)		(0)
+# define lock_num_prmode(_l)		(0ULL)
+# define lock_num_exmode(_l)		(0ULL)
 # define lock_num_prmode_failed(_l)	(0)
 # define lock_num_exmode_failed(_l)	(0)
-# define lock_total_prmode(_l)		(0)
-# define lock_total_exmode(_l)		(0)
+# define lock_total_prmode(_l)		(0ULL)
+# define lock_total_exmode(_l)		(0ULL)
 # define lock_max_prmode(_l)		(0)
 # define lock_max_exmode(_l)		(0)
 # define lock_refresh(_l)		(0)
