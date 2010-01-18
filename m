From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the fsnotify tree with the vfs tree
Date: Mon, 18 Jan 2010 17:29:44 +1100
Message-ID: <20100118172944.c80b15d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45962 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752428Ab0ARG3t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2010 01:29:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

Hi Eric,

Today's linux-next merge of the fsnotify tree got a conflict in
include/linux/fs.h between commit
6d125529c6cbfe570ce3bf9a0728548f087499da ("Fix ACC_MODE() for real") from
the vfs tree and commit 8b006ddbcdc223f1053ab98dfa5460cd4ecd27b9 ("vfs:
introduce FMODE_NONOTIFY") from the fsnotify tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/fs.h
index 416b8bd,d6190a8..0000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -2461,8 -2460,9 +2459,9 @@@ int proc_nr_files(struct ctl_table *tab
  
  int __init get_filesystem_list(char *buf);
  
 -#define ACC_MODE(x) ("\000\004\002\006"[(x)&O_ACCMODE])
 +#define ACC_MODE(x) ("\004\002\006\006"[(x)&O_ACCMODE])
- #define OPEN_FMODE(flag) ((__force fmode_t)((flag + 1) & O_ACCMODE))
+ #define OPEN_FMODE(flag) ((__force fmode_t)(((flag + 1) & O_ACCMODE) | \
+ 					    (flag & FMODE_NONOTIFY)))
  
  #endif /* __KERNEL__ */
  #endif /* _LINUX_FS_H */
