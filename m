From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 1 Jun 2015 10:31:03 -0400
Message-ID: <20150601143102.GA2839@redhat.com>
References: <20150601145619.5d176c8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:32974 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751176AbbFAObE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 10:31:04 -0400
Content-Disposition: inline
In-Reply-To: <20150601145619.5d176c8b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Junichi Nomura <j-nomura@ce.jp.nec.com>

On Mon, Jun 01 2015 at 12:56am -0400,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> drivers/md/dm.c between commits 3a1407559a59 ("dm: fix NULL pointer
> when clone_and_map_rq returns !DM_MAPIO_REMAPPED") and e5d8de32cc02
> ("dm: fix false warning in free_rq_clone() for unmapped requests") from
> Linus' tree and commit 5f1b670d0bef ("block, dm: don't copy bios for
> request clones") from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

That matches the merge that I'm carrying in linux-dm.git's for-next too.

Thanks,
Mike
