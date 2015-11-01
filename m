From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 file-locks tree
Date: Mon, 2 Nov 2015 02:43:13 +1100
Message-ID: <20151102024313.6198dc83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42045 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751123AbbKAPnR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 10:43:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@poochiereds.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Coddington <bcodding@redhat.com>, Dominique Martinet <dominique.martinet@cea.fr>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/9p/vfs_file.c

between commit:

  4f6563677ae8 ("Move locks API users to locks_lock_inode_wait()")

from the file-locks tree and commit:

  4c3932157148 ("9p: do not overwrite return code when locking fails")

from the akpm-current tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/9p/vfs_file.c
index f23fd86697ea,6b747394f6f5..000000000000
--- a/fs/9p/vfs_file.c
+++ b/fs/9p/vfs_file.c
@@@ -231,7 -231,8 +231,8 @@@ out_unlock
  	if (res < 0 && fl->fl_type != F_UNLCK) {
  		fl_type = fl->fl_type;
  		fl->fl_type = F_UNLCK;
- 		res = locks_lock_file_wait(filp, fl);
+ 		/* Even if this fails we want to return the remote error */
 -		posix_lock_file_wait(filp, fl);
++		locks_lock_file_wait(filp, fl);
  		fl->fl_type = fl_type;
  	}
  out:
