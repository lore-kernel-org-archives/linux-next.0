From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 03/17] fsnotify: update gfp/slab.h includes
Date: Thu, 20 May 2010 01:36:28 +1000
Message-ID: <20100520013628.74a8c5a2.sfr@canb.auug.org.au>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
	<1269885165-18617-4-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55204 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752469Ab0ESPga (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 May 2010 11:36:30 -0400
In-Reply-To: <1269885165-18617-4-git-send-email-tj@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

Hi Eric,

On Tue, 30 Mar 2010 02:52:31 +0900 Tejun Heo <tj@kernel.org> wrote:
>
> Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
> gfp.h or slab.h is included as necessary.

Please apply to the fsnotify tree (patch reposted below).

From: Tejun Heo <tj@kernel.org>
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Eric Paris <eparis@redhat.com>
Subject: [PATCH 03/17] fsnotify: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:31 +0900

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Paris <eparis@redhat.com>
---
 fs/notify/fanotify/fanotify_user.c |    1 +
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

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
