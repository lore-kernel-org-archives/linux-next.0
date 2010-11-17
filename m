From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cleancache tree with the bkl-config
 tree
Date: Wed, 17 Nov 2010 13:33:43 +1100
Message-ID: <20101117133343.3d75d053.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Magenheimer <dan.magenheimer@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

Hi Dan,

Today's linux-next merge of the cleancache tree got a conflict in
fs/ocfs2/super.c between commit cdbe83a95ae7c7a8762c10567a2c5d08cfc1cc4d
("BKL: remove extraneous #include <smp_lock.h>") from the bkl-config tree
and commit 91bf812da0c4f2efd0883fe02dc057853de731b1 ("ocfs2: add
cleancache support") from the cleancache tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ocfs2/super.c
index cfeab7c,e3f0a4e..0000000
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@@ -41,6 -41,8 +41,7 @@@
  #include <linux/mount.h>
  #include <linux/seq_file.h>
  #include <linux/quotaops.h>
 -#include <linux/smp_lock.h>
+ #include <linux/cleancache.h>
  
  #define MLOG_MASK_PREFIX ML_SUPER
  #include <cluster/masklog.h>
