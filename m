From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Fri, 17 Nov 2017 11:42:00 +1100
Message-ID: <20171117114200.6656b06e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55081 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751173AbdKQAmC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Nov 2017 19:42:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/afs/super.c

between commits:

  f044c8847bb6 ("afs: Lay the groundwork for supporting network namespaces")
  49566f6f06b3 ("afs: Note the cell in the superblock info also")

from Linus' tree and commit:

  c2c6773f9942 ("VFS: Roll out mount flag differentiation (MS_* -> SB_*) generally")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

P.S. Dave, do you feel like having an afs tree in linux-next for next time?
-- 
Cheers,
Stephen Rothwell

diff --cc fs/afs/super.c
index 875b5eb02242,a8c1e00c4dd0..000000000000
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@@ -493,19 -465,20 +493,19 @@@ static struct dentry *afs_mount(struct 
  		/* initial superblock/root creation */
  		_debug("create");
  		ret = afs_fill_super(sb, &params);
 -		if (ret < 0) {
 -			deactivate_locked_super(sb);
 -			goto error;
 -		}
 +		if (ret < 0)
 +			goto error_sb;
 +		as = NULL;
- 		sb->s_flags |= MS_ACTIVE;
+ 		sb->s_flags |= SB_ACTIVE;
  	} else {
  		_debug("reuse");
- 		ASSERTCMP(sb->s_flags, &, MS_ACTIVE);
+ 		ASSERTCMP(sb->s_flags, &, SB_ACTIVE);
 -		afs_put_volume(vol);
 -		kfree(as);
 +		afs_destroy_sbi(as);
 +		as = NULL;
  	}
  
 -	afs_put_cell(params.cell);
 -	kfree(new_opts);
 +	afs_put_cell(params.net, params.cell);
 +	key_put(params.key);
  	_leave(" = 0 [%p]", sb);
  	return dget(sb->s_root);
  
