From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the aio tree with the vfs tree
Date: Tue, 15 Mar 2016 15:06:40 +1100
Message-ID: <20160315150640.02a4db30@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [103.22.144.67] ([103.22.144.67]:45640 "EHLO ozlabs.org"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1750715AbcCOEHY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Mar 2016 00:07:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Ben,

Today's linux-next merge of the aio tree got a conflict in:

  fs/namei.c

between commit:

  5955102c9984 ("wrappers for ->i_mutex access")

from the vfs tree and commit:

  5d3d80fcf992 ("aio: add support for in-submit openat")

from the aio tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc fs/namei.c
index 794f81dce766,260782f5a868..000000000000
--- a/fs/namei.c
+++ b/fs/namei.c
@@@ -3125,9 -3079,15 +3125,15 @@@ retry_lookup
  		 * dropping this one anyway.
  		 */
  	}
+ 
+ 	if (nd->flags & LOOKUP_NONBLOCK) {
+ 		error = -EAGAIN;
+ 		goto out;
+ 	}
+ 		
 -	mutex_lock(&dir->d_inode->i_mutex);
 +	inode_lock(dir->d_inode);
  	error = lookup_open(nd, &path, file, op, got_write, opened);
 -	mutex_unlock(&dir->d_inode->i_mutex);
 +	inode_unlock(dir->d_inode);
  
  	if (error <= 0) {
  		if (error)
