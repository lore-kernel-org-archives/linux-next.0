From: Ted Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the ext4 tree with Linus' tree
Date: Fri, 25 Mar 2011 15:58:56 -0400
Message-ID: <20110325195856.GF2548@thunk.org>
References: <20110325125643.91510e0e.sfr@canb.auug.org.au>
 <20110325144544.GF1409@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from li9-11.members.linode.com ([67.18.176.11]:47926 "EHLO
	test.thunk.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753142Ab1CYT7L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Mar 2011 15:59:11 -0400
Content-Disposition: inline
In-Reply-To: <20110325144544.GF1409@htj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mingming Cao <cmm@us.ibm.com>

On Fri, Mar 25, 2011 at 03:45:44PM +0100, Tejun Heo wrote:
> Both are about the same conversion but the one using alloc_workqueue()
> is better because 1. create_singlethread_workqueue() is going away and
> 2. it doesn't require strict ordering among queued works.
> 
> Ted, what do you think?

Agreed.  And it looks like Linus agreed as well:

diff --cc fs/ext4/super.c
index 203f9e4,ccfa686..22546ad
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@@ -3511,12 -3514,7 +3516,12 @@@ static int ext4_fill_super(struct super
        percpu_counter_set(&sbi->s_dirtyblocks_counter, 0);
  
  no_journal:
 -      EXT4_SB(sb)->dio_unwritten_wq = create_singlethread_workqueue("ext4-dio-
 +      /*
 +       * The maximum number of concurrent works can be high and
 +       * concurrency isn't really necessary.  Limit it to 1.
 +       */
 +      EXT4_SB(sb)->dio_unwritten_wq =
-               alloc_workqueue("ext4-dio-unwritten", WQ_MEM_RECLAIM, 1);
++              alloc_workqueue("ext4-dio-unwritten", WQ_MEM_RECLAIM | WQ_UNBOUND, 1);
        if (!EXT4_SB(sb)->dio_unwritten_wq) {
                printk(KERN_ERR "EXT4-fs: failed to create DIO workqueue\n");
                goto failed_mount_wq;

						- Ted
