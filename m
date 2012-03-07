From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the cgroup tree with the block tree
Date: Wed, 7 Mar 2012 11:17:42 -0800
Message-ID: <20120307191742.GB30676@google.com>
References: <20120307160516.53086e588a8246edd87c41fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:44964 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759799Ab2CGTRr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Mar 2012 14:17:47 -0500
Content-Disposition: inline
In-Reply-To: <20120307160516.53086e588a8246edd87c41fc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Li Zefan <lizf@cn.fujitsu.com>, Jens Axboe <axboe@kernel.dk>

On Wed, Mar 07, 2012 at 04:05:16PM +1100, Stephen Rothwell wrote:
> Hi Tejun,
> 
> Today's linux-next merge of the cgroup tree got a conflict in
> block/blk-cgroup.c between commit 7ee9c5620504 ("blkcg: let blkio_group
> point to blkio_cgroup directly") from the block tree and commit
> 761b3ef50e1c ("cgroup: remove cgroup_subsys argument from callbacks")
> from the cgroup tree.
> 
> I fixed it up (I hope - see below) and can carry the fix as necessary.

Yeap, looks correct to me.

Thank you very much.

-- 
tejun
