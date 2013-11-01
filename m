From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Fri, 01 Nov 2013 09:10:43 -0600
Message-ID: <5273C473.5070803@kernel.dk>
References: <20131101142026.10390b6e3f70de348770c137@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:53521 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751810Ab3KAPK6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 11:10:58 -0400
In-Reply-To: <20131101142026.10390b6e3f70de348770c137@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zach Brown <zab@zabbo.net>, Dave Kleikamp <dave.kleikamp@oracle.com>, Kent Overstreet <kmo@daterainc.com>

On 10/31/2013 09:20 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> drivers/block/loop.c between commit 2486740b52fd ("loop: use aio to
> perform io on the underlying file") from the aio-direct tree and commit
> ed2d2f9a8265 ("block: Abstract out bvec iterator") from the block tree.
> 
> I fixed it up (I think - see below - I have also attached the final
> resulting file) and can carry the fix as necessary (no action is
> required).
> 

What tree is this from? It'd be a lot more convenient to fold that loop
patch into my tree, especially since the block tree in linux-next failed
after this merge.

-- 
Jens Axboe
