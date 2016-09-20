From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the vfs tree
Date: Tue, 20 Sep 2016 15:03:27 +1000
Message-ID: <20160920150327.7f646dee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55192 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751040AbcITFDa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 01:03:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Eremin <dmitry.eremin@intel.com>, James Simmons <jsimmons@infradead.org>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/lustre/lustre/llite/file.c

between commit:

  47b34458fc93 ("lustre: use %pD")

from the vfs tree and commit:

  bb5c7f2630de ("staging: lustre: changelog: fix comparison between signed and unsigned")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/staging/lustre/lustre/llite/file.c
index 23249b3e6cad,5d4d17f2de61..000000000000
--- a/drivers/staging/lustre/lustre/llite/file.c
+++ b/drivers/staging/lustre/lustre/llite/file.c
@@@ -1141,8 -1123,8 +1123,8 @@@ ll_file_io_generic(const struct lu_env 
  	struct cl_io	 *io;
  	ssize_t	       result;
  
- 	CDEBUG(D_VFSTRACE, "file: %pD, type: %d ppos: %llu, count: %zd\n",
 -	CDEBUG(D_VFSTRACE, "file: %s, type: %d ppos: %llu, count: %zu\n",
 -	       file->f_path.dentry->d_name.name, iot, *ppos, count);
++	CDEBUG(D_VFSTRACE, "file: %pD, type: %d ppos: %llu, count: %zu\n",
 +	       file, iot, *ppos, count);
  
  restart:
  	io = vvp_env_thread_io(env);
