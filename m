From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 17 Aug 2015 14:04:46 +1000
Message-ID: <20150817140446.626dd53b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42240 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750704AbbHQEEs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2015 00:04:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>, Kent Overstreet <kent.overstreet@gmail.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/md/dm.c

between commit:

  bd4aaf8f9b85 ("dm: fix dm_merge_bvec regression on 32 bit systems")

from Linus' tree and commit:

  8ae126660fdd ("block: kill merge_bvec_fn() completely")

from the block tree.

I fixed it up (the latter removed the code updated by the former) and
can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
