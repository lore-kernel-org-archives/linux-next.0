From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: fsnotify tree build failure
Date: Thu, 17 Dec 2009 14:45:06 +1100
Message-ID: <20091217144506.d73902de.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38072 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756990AbZLQDpL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Dec 2009 22:45:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

Hi Eric,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/notify/fanotify/fanotify_user.c: In function 'create_fd':
fs/notify/fanotify/fanotify_user.c:76: error: 'IMA_COUNT_UPDATE' undeclared (first use in this function)
fs/notify/fanotify/fanotify_user.c:76: error: too many arguments to function 'ima_path_check'

Caused by commit df8f58f5e75be6fa3fb7e5bd55f3ab5b8970b16b ("fanotify:
send events using read") from the fsnotify tree interacting with commit
1429b3eca23818f87f9fa569a15d9816de81f698 ("Untangling ima mess, part 3:
kill dead code in ima") from Linus' tree.

I applied the following merge fix (I *think* it is correct but may easily
require something more - Al?) for today (and can carry it for a while):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 17 Dec 2009 14:40:11 +1100
Subject: [PATCH] fsnotify: fixup for ima_path_check API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/notify/fanotify/fanotify_user.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index 98c5c44..da79856 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -73,7 +73,7 @@ static int create_fd(struct fsnotify_group *group, struct fsnotify_event *event)
 	/* it's possible this event was an overflow event.  in that case dentry and mnt
 	 * are NULL;  That's fine, just don't call dentry open */
 	if (dentry && mnt) {
-		err = ima_path_check(&event->path, MAY_READ, IMA_COUNT_UPDATE);
+		err = ima_path_check(&event->path, MAY_READ);
 		if (err)
 			new_file = ERR_PTR(err);
 		else
-- 
1.6.5.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
