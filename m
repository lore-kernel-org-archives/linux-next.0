From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the vfs tree
Date: Mon, 12 Dec 2016 16:52:07 +1100
Message-ID: <20161212165207.48c149de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50925 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750720AbcLLFwJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Dec 2016 00:52:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ian Kent <ikent@redhat.com>

Hi all,

Al let me know that he had put a newer version of the autofs patches
into his vfs tree, so I have dropped the following patches from the akpm
tree today:

  vfs: change d_manage() to take a struct path
  vfs: add path_is_mountpoint() helper
  vfs: fix boolreturn.cocci warnings
  vfs: add path_has_submounts()
  autofs: change autofs4_expire_wait() to take struct path
  autofs: change autofs4_wait() to take struct path
  autofs: use path_is_mountpoint() to fix unreliable d_mountpoint() checks
  autofs: use path_has_submounts() to fix unreliable have_submount() checks
  vfs: remove unused have_submounts() function
  vfs: merge path_is_mountpoint() and path_is_mountpoint_rcu()
  autofs: make struct path const in autofs4_dir_open()
  autofs: change struct path to const in autofs4_expire_wait() and autofs4_wait()
  vfs: change struct path to const in d_manage()
  vfs: constify path parameter of path_has_submounts()
  autofs: don't hold spinlock over direct mount expire
  vfs: make may_umount_tree() mount propagation aware
  vfs-make-may_umount_tree-mount-propogation-aware-checkpatch-fixes

I hope that was the correct ones.
-- 
Cheers,
Stephen Rothwell
