From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the overlayfs tree
Date: Tue, 22 Nov 2016 11:19:39 +1100
Message-ID: <20161122111939.0c0ea92a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45029 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753937AbcKVATx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Nov 2016 19:19:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Miklos,

After merging the overlayfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from fs/overlayfs/dir.c:20:0:
fs/overlayfs/dir.c: In function 'ovl_set_redirect':
fs/overlayfs/overlayfs.h:92:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
  int err = vfs_setxattr(dentry, name, value, size, flags);
      ^
fs/overlayfs/dir.c:788:14: note: 'ret' was declared here
  char *buf, *ret;
              ^

Introduced by commit

  496654b0792e ("ovl: redirect on rename-dir")

This is not necessarily a false positive (although is is a confusing
message): if the kmalloc of "buf" fails and samedir was not set in
ovl_get_redirect(), then "return ret" will be executed but "ret" has
not been set.

-- 
Cheers,
Stephen Rothwell
