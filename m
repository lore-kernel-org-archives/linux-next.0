From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 03/17] fsnotify: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:31 +0900
Message-ID: <1269885165-18617-4-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:57109 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755396Ab0C2RxI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 13:53:08 -0400
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Eric Paris <eparis@redhat.com>

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Paris <eparis@redhat.com>
---
 fs/notify/fanotify/fanotify_user.c |    1 +
 fs/notify/mark.c                   |    1 -
 fs/notify/vfsmount_mark.c          |    1 -
 3 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index 7c869fa..c437bd4 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -10,6 +10,7 @@
 #include <linux/poll.h>
 #include <linux/security.h>
 #include <linux/syscalls.h>
+#include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 
diff --git a/fs/notify/mark.c b/fs/notify/mark.c
index 1e824e6..4fd74ba 100644
--- a/fs/notify/mark.c
+++ b/fs/notify/mark.c
@@ -87,7 +87,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/writeback.h> /* for inode_lock */
 
diff --git a/fs/notify/vfsmount_mark.c b/fs/notify/vfsmount_mark.c
index 8f1aa02..ec580a2 100644
--- a/fs/notify/vfsmount_mark.c
+++ b/fs/notify/vfsmount_mark.c
@@ -22,7 +22,6 @@
 #include <linux/module.h>
 #include <linux/mount.h>
 #include <linux/mutex.h>
-#include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/writeback.h> /* for inode_lock */
 
-- 
1.6.4.2
