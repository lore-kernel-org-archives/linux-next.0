From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: manual merge of the device-mapper tree with the
 block tree
Date: Tue, 6 Jul 2010 10:30:06 -0400
Message-ID: <20100706143006.GA16626@redhat.com>
References: <20100706143313.1d4e2909.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:48457 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752052Ab0GFOaS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jul 2010 10:30:18 -0400
Content-Disposition: inline
In-Reply-To: <20100706143313.1d4e2909.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Jens Axboe <axboe@kernel.dk>

On Tue, Jul 06 2010 at 12:33am -0400,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alasdair,
> 
> Today's linux-next merge of the device-mapper tree got a conflict in
> drivers/md/dm.c between commits 9add80db6089272d6bf13ef6b5dc7b3ddda1a887
> ("dm: stop using q->prepare_flush_fn") and
> 5e27e27e73b5bff903b3c30ffd5a0e17eb95c087 ("block: remove
> q->prepare_flush_fn completely") from the block tree and commit
> 90c50ea6a71bcb1bdf1482007932cc7fb0902455
> ("dm-do-not-initialise-full-request-queue-when-bio-based") from the
> device-mapper tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Hi Stephen,

Your fix is correct, thanks for carrying this until Alasdair gets a
chance to pick it up.

Mike
