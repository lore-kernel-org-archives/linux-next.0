From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Tue, 01 Nov 2011 09:09:45 +0100
Message-ID: <4EAFA949.5060200@kernel.dk>
References: <20111101161500.79aebe8d8f30162ea542a818@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.104.106.3]:60427 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752120Ab1KAIJr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Nov 2011 04:09:47 -0400
In-Reply-To: <20111101161500.79aebe8d8f30162ea542a818@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, NeilBrown <neilb@suse.de>

On 2011-11-01 06:15, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> drivers/md/raid10.c between commit fd01b88c75a7 ("md: remove typedefs:
> mddev_t -> struct mddev") from Linus' tree and commit 5a7bbad27a41
> ("block: remove support for bio remapping from ->make_request") from the
> block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Fixup looks good, however don't you get the same conflict in basically
all the raid personalities? Fixup is indeed just the simple int -> void
transition, conflict is because of the mddev_t -> struct mddev change
that is now in Linus' tree.

I'll push my pending off to Linus today or tomorrow, so this will be
resolved shortly.

-- 
Jens Axboe
