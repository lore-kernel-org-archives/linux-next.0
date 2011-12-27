From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the cgroup tree with the block tree
Date: Tue, 27 Dec 2011 09:41:46 -0800
Message-ID: <CAOS58YOT9TncY_AyJneg2YtM2Jmm=pTMStuY1fEsvHhOMcwdrA@mail.gmail.com>
References: <20111220171000.e38cee0ea6b9bafc2851ad4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:36614 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754863Ab1L0Rls (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Dec 2011 12:41:48 -0500
In-Reply-To: <20111220171000.e38cee0ea6b9bafc2851ad4b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>

Hello, Stephen.

On Mon, Dec 19, 2011 at 10:10 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the cgroup tree got a conflict in
> block/blk-cgroup.c between commit 6e736be7f282 ("block: make ioc get/put
> interface more conventional and fix race on alloction") from the block
> tree and commit bb9d97b6dffa ("cgroup: don't use subsys->can_attach_task
> () or ->attach_task()") from the cgroup tree.
>
> I guessed about fixing it up (see below) and can carry the fix as
> necessary.

Yes, this looks correct to me.  Thank you very much. :)

-- 
tejun
