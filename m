From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the workqueues tree with the gfs2 tree
Date: Tue, 12 Oct 2010 13:53:28 +1100
Message-ID: <20101012135328.bd1e6caa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Whitehouse <swhiteho@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Tejun,

Today's linux-next merge of the workqueues tree got a conflict in
fs/gfs2/main.c between commit 9fa0ea9f26f64fbfc3dfd51d1dc2c230b65ffb19
("GFS2: Use new workqueue scheme") from the gfs2 tree and commit
6370a6ad3b53df90b4700977f7718118a2cd524a ("workqueue: add and use
WQ_MEM_RECLAIM flag") from the workqueues tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/gfs2/main.c
index d7eb1e2,1c5f460..0000000
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@@ -144,7 -140,7 +144,7 @@@ static int __init init_gfs2_fs(void
  
  	error = -ENOMEM;
  	gfs_recovery_wq = alloc_workqueue("gfs_recovery",
- 					  WQ_RESCUER | WQ_FREEZEABLE, 0);
 -					  WQ_NON_REENTRANT | WQ_MEM_RECLAIM, 0);
++					  WQ_MEM_RECLAIM | WQ_FREEZEABLE, 0);
  	if (!gfs_recovery_wq)
  		goto fail_wq;
  
