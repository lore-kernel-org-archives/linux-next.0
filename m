From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 7 Mar 2011 07:36:18 +0100
Message-ID: <20110307063618.GA10365@mtj.dyndns.org>
References: <20110307131958.84a5d818.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:57975 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169Ab1CGGgY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Mar 2011 01:36:24 -0500
Content-Disposition: inline
In-Reply-To: <20110307131958.84a5d818.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello, Stephen, Jens.

On Mon, Mar 07, 2011 at 01:19:58PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the block tree got a conflict in
> block/blk-flush.c between commit 255bb490c8c27eed484d538efe6ef6a7473bd3f6
> ("block: blk-flush shouldn't call directly into q->request_fn()
> __blk_run_queue()") from the  tree and commit
> ae1b1539622fb46e51b4d13b3f9e5f4c713f86ae ("block: reimplement FLUSH/FUA
> to support merge") from the block tree.
> 
> The latter rewrote a large part of the file, so I just used that.  If
> this is not correct, please fix it up in the block tree.

I sent Jens a merge commit which should fix this yesterday.

 http://thread.gmane.org/gmane.linux.kernel/1101766/focus=1108915

So, the merge problem should go away soonish.

Thank you.

-- 
tejun
