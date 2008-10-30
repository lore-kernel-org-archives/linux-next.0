From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Thu, 30 Oct 2008 10:14:07 +0000
Message-ID: <12531.1225361647@redhat.com>
References: <20081030080343.GA20548@infradead.org> <20081030154741.2651e779.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:48401 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753306AbYJ3KOh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Oct 2008 06:14:37 -0400
In-Reply-To: <20081030080343.GA20548@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, David Chinner <david@fromorbit.com>, Lachlan McIlroy <lachlan@sgi.com>


Hi Christoph,

Could you pull my XFS wrapper patch into the XFS tree?  That might make things
easier for Stephen.  The prerequisite patch is already upstream.  Now if only
Linus would take the rest of it.

David
---
From: David Howells <dhowells@redhat.com>

CRED: Wrap task credential accesses in the XFS filesystem

Wrap access to task credentials so that they can be separated more easily from
the task_struct during the introduction of COW creds.

Change most current->(|e|s|fs)[ug]id to current_(|e|s|fs)[ug]id().

Change some task->e?[ug]id to task_e?[ug]id().  In some places it makes more
sense to use RCU directly rather than a convenient wrapper; these will be
addressed by later patches.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: James Morris <jmorris@namei.org>
Acked-by: Serge Hallyn <serue@us.ibm.com>
Cc: xfs@oss.sgi.com
---

 fs/xfs/linux-2.6/xfs_cred.h  |    2 +-
 fs/xfs/linux-2.6/xfs_ioctl.c |    2 +-
 fs/xfs/xfs_acl.c             |    6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)


diff --git a/fs/xfs/linux-2.6/xfs_cred.h b/fs/xfs/linux-2.6/xfs_cred.h
index 652721c..293043a 100644
--- a/fs/xfs/linux-2.6/xfs_cred.h
+++ b/fs/xfs/linux-2.6/xfs_cred.h
@@ -24,7 +24,7 @@
  * Credentials
  */
 typedef struct cred {
-	/* EMPTY */
+       /* EMPTY */
 } cred_t;
 
 extern struct cred *sys_cred;
diff --git a/fs/xfs/linux-2.6/xfs_ioctl.c b/fs/xfs/linux-2.6/xfs_ioctl.c
index d3438c7..67c72ae 100644
--- a/fs/xfs/linux-2.6/xfs_ioctl.c
+++ b/fs/xfs/linux-2.6/xfs_ioctl.c
@@ -1007,7 +1007,7 @@ xfs_ioctl_setattr(
 	 * to the file owner ID, except in cases where the
 	 * CAP_FSETID capability is applicable.
 	 */
-	if (current->fsuid != ip->i_d.di_uid && !capable(CAP_FOWNER)) {
+	if (current_fsuid() != ip->i_d.di_uid && !capable(CAP_FOWNER)) {
 		code = XFS_ERROR(EPERM);
 		goto error_return;
 	}
diff --git a/fs/xfs/xfs_acl.c b/fs/xfs/xfs_acl.c
index b2f639a..91d6933 100644
--- a/fs/xfs/xfs_acl.c
+++ b/fs/xfs/xfs_acl.c
@@ -366,7 +366,7 @@ xfs_acl_allow_set(
 		return ENOTDIR;
 	if (vp->i_sb->s_flags & MS_RDONLY)
 		return EROFS;
-	if (XFS_I(vp)->i_d.di_uid != current->fsuid && !capable(CAP_FOWNER))
+	if (XFS_I(vp)->i_d.di_uid != current_fsuid() && !capable(CAP_FOWNER))
 		return EPERM;
 	return 0;
 }
@@ -413,13 +413,13 @@ xfs_acl_access(
 		switch (fap->acl_entry[i].ae_tag) {
 		case ACL_USER_OBJ:
 			seen_userobj = 1;
-			if (fuid != current->fsuid)
+			if (fuid != current_fsuid())
 				continue;
 			matched.ae_tag = ACL_USER_OBJ;
 			matched.ae_perm = allows;
 			break;
 		case ACL_USER:
-			if (fap->acl_entry[i].ae_id != current->fsuid)
+			if (fap->acl_entry[i].ae_id != current_fsuid())
 				continue;
 			matched.ae_tag = ACL_USER;
 			matched.ae_perm = allows;
