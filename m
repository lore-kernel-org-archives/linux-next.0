From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: please clean up the lightnvm tree
Date: Fri, 8 Jul 2016 14:22:51 +1000
Message-ID: <20160708142251.650e3756@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57369 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751412AbcGHEXJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Jul 2016 00:23:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matias =?UTF-8?B?QmrDuHJsaW5n?= <m@bjorling.me>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>

Hi Matias,

I noticed that the commits in the lightnvm tree have been applied
to the block tree as a series of patches (i.e. effectively rebased).
Could you please remove all the duplicate patches from the lightnvm tree
(which I think is the whole tree, curretly) before they start causing
merge conflicts for me.

One way to do this would be to rebase your tree on top of the block tree.

-- 
Cheers,
Stephen Rothwell
