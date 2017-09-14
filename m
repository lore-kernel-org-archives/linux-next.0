From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the btrfs-kdave tree
Date: Thu, 14 Sep 2017 10:31:10 +1000
Message-ID: <20170914103110.2f30cae3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35243 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751173AbdINAbM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 Sep 2017 20:31:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Christos Gkekas <chris.gekas@gmail.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/btrfs/root-tree.c

between commit:

  8b591d54b74b ("btrfs: Clean up dead code in root-tree")

from the btrfs-kdave tree and commit:

  bc98a42c1f7d ("VFS: Convert sb->s_flags & MS_RDONLY to sb_rdonly(sb)")

from the vfs tree.

I fixed it up (the former removed the code updated by the latter, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

[David Sterba: just wondering if all the commits that appeared in the
btrfs-kdave tree today (so late in the merge window) are really destined
for v4.14?]

-- 
Cheers,
Stephen Rothwell
