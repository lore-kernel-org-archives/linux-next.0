From: michael@ozlabs.org (mpe@ellerman.id.au)
Subject: linux-next: manual merge of the vfs tree with the  tree
Date: Fri,  5 Jun 2015 15:46:07 +1000 (AEST)
Message-ID: <20150605054607.C628E1401DE@ozlabs.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33147 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751463AbbFEFqJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Jun 2015 01:46:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kinglong Mee <kinglongmee@gmail.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in fs/namei.c between
commit 890458a43dbd ("path: New helpers path_get_pin/path_put_unpin for path
pin") from the nfsd tree and commit 894bc8c4662b ("namei: remove restrictions
on nesting depth") from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

cheers

diff --cc fs/namei.c
index d41a29efca67,2dad0eaf91d3..000000000000
--- a/fs/namei.c
+++ b/fs/namei.c
@@@ -492,32 -492,7 +492,33 @@@ void path_put(const struct path *path
  }
  EXPORT_SYMBOL(path_put);
  
 +/**
 + * path_get_pin - get a reference to a path's dentry
 + *                and pin to path's vfsmnt
 + * @path: path to get the reference to
 + * @p: the fs_pin pin to vfsmnt
 + */
 +void path_get_pin(struct path *path, struct fs_pin *p)
 +{
 +	dget(path->dentry);
 +	pin_insert_group(p, path->mnt, NULL);
 +}
 +EXPORT_SYMBOL(path_get_pin);
 +
 +/**
 + * path_put_unpin - put a reference to a path's dentry
 + *                  and remove pin to path's vfsmnt
 + * @path: path to put the reference to
 + * @p: the fs_pin removed from vfsmnt
 + */
 +void path_put_unpin(struct path *path, struct fs_pin *p)
 +{
 +	dput(path->dentry);
 +	pin_remove(p);
 +}
 +EXPORT_SYMBOL(path_put_unpin);
 +
+ #define EMBEDDED_LEVELS 2
  struct nameidata {
  	struct path	path;
  	struct qstr	last;
