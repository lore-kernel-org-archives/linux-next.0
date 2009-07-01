From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 1 Jul 2009 14:57:11 +1000
Message-ID: <20090701145711.1c9c8935.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754571AbZGAE5Y@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davide Libenzi <davidel@xmailserver.org>, Andrew Morton <akpm@linux-foundation.org>, Gregory Haskins <ghaskins@novell.com>
List-Id: linux-next.vger.kernel.org

Hi Avi,

Today's linux-next merge of the kvm tree got a conflict in fs/eventfd.c
between commit 133890103b9de08904f909995973e4b5c08a780e ("eventfd:
revised interface and cleanups") from Linus' tree and commit
28ddf0aebbf546e56efd1951725d5457ce1ebf98 ("eventfd: Allow waiters to be
notified about the eventfd file* going away") from the kvm tree.

Overlapping changes.  I fixed it up (see below), but don't know if this
is the correct fix.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/eventfd.c
index 31d12de,72f5f8d..0000000
--- a/fs/eventfd.c
+++ b/fs/eventfd.c
@@@ -105,8 -63,13 +105,13 @@@ static int eventfd_release(struct inod
  {
  	struct eventfd_ctx *ctx = file->private_data;
  
- 	wake_up_poll(&ctx->wqh, POLLHUP);
+ 	/*
+ 	 * No need to hold the lock here, since we are on the file cleanup
+ 	 * path and the ones still attached to the wait queue will be
+ 	 * serialized by wake_up_locked_poll().
+ 	 */
+ 	wake_up_locked_poll(&ctx->wqh, POLLHUP);
 -	kfree(ctx);
 +	eventfd_ctx_put(ctx);
  	return 0;
  }
  
