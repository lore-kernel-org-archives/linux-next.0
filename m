From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: proc tree build failure
Date: Mon, 30 Mar 2009 17:43:53 +1100
Message-ID: <20090330174353.14a3f3d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59072 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753202AbZC3Gn6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2009 02:43:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>

Hi Alexey,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/proc/proc_net.c: In function 'proc_net_get_sb':
fs/proc/proc_net.c:296: error: void value not ignored as it ought to be

Caused by commit 39bc389a04412aa199d8abec6582be33d57d1344 ("proc 3/6:
make /proc/net it's own filesystem") interacting with commit
a3ec947c85ec339884b30ef6a08133e9311fdae1 ("vfs: simple_set_mnt() should
return void") from Linus' tree.

I applied the following patch and can carry it for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Mar 2009 17:41:54 +1100
Subject: [PATCH] proc: update proc_net.c for simple_set_mnt API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/proc/proc_net.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/proc/proc_net.c b/fs/proc/proc_net.c
index 32dd84f..1e31e5d 100644
--- a/fs/proc/proc_net.c
+++ b/fs/proc/proc_net.c
@@ -293,7 +293,8 @@ static int proc_net_get_sb(struct file_system_type *fs_type,
 		sb->s_flags |= MS_ACTIVE;
 	}
 
-	return simple_set_mnt(mnt, sb);
+	simple_set_mnt(mnt, sb);
+	return 0;
 }
 
 static struct file_system_type proc_net_fs_type = {
-- 
1.6.2.1
