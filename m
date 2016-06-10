From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: manual merge of the device-mapper tree with the
 block tree
Date: Fri, 10 Jun 2016 13:01:59 -0400
Message-ID: <20160610170159.GA29366@redhat.com>
References: <20160609135932.39c8ddd7@canb.auug.org.au>
 <20160609140253.183a1428@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47852 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750888AbcFJRCC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Jun 2016 13:02:02 -0400
Content-Disposition: inline
In-Reply-To: <20160609140253.183a1428@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 09 2016 at 12:02am -0400,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Thu, 9 Jun 2016 13:59:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> >   50d14ab0130a ("dm: move request-based code out to dm-rq.[hc]")
> 
> By the way, resolving these conflicts would have been easier if this
> commit had been split into "move with no changes" followed by "small
> changes" commits.

Yeap, I understand.  I've folded your fix into the appropriate commit
and rebased DM's for-next (and dm-4.8) ontop of block's for-4.8/core.

Thanks,
Mike
