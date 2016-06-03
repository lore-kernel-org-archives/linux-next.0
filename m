From: Xiong Zhou <xzhou@redhat.com>
Subject: Re: linux-next/linux memleak after IO on dax mountpoint
Date: Fri, 3 Jun 2016 14:35:14 +0800
Message-ID: <20160603063514.GA16231@dhcp12-144.nay.redhat.com>
References: <20160527084617.GD2933@dhcp12-144.nay.redhat.com>
 <20160528040554.GA23685@dhcp12-144.nay.redhat.com>
 <CAHse=S-H_yMhZKNmMZpb41M+o+2tMRyxiUG9wQoemewBXXYTPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35660 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751138AbcFCGfS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Jun 2016 02:35:18 -0400
Content-Disposition: inline
In-Reply-To: <CAHse=S-H_yMhZKNmMZpb41M+o+2tMRyxiUG9wQoemewBXXYTPw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Drysdale <drysdale@google.com>, hch@lst.de
Cc: Xiong Zhou <xzhou@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, axboe@fb.com, linux-next@vger.kernel.org, linux-nvdimm@ml01.01.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 02, 2016 at 04:22:37PM +0100, David Drysdale wrote:
> On Sat, May 28, 2016 at 5:05 AM, Xiong Zhou <xzhou@redhat.com> wrote:
> > On Fri, May 27, 2016 at 04:46:17PM +0800, Xiong Zhou wrote:
> > ...
> >> Still working on to id which commit in this merge causes this issuer,
> >
> > Narrowed down to:
> >
> > 37e5823 block: add offset in blk_add_request_payload()
...
> > 0bf77e9 nvme: switch to RCU freeing the namespace
> > 9082e87 block: remove struct bio_batch
> 
> FWIW, I'm also seeing kmemleak report a leak with v4.7-rc1, in
> a different scenario (just normal desktop use).  Not done much
> digging so far, but this commit (9082e87bf) looks like it might be
> relevant

<snip..>

Thanks for the tip, accelerated my searching in the block merge.

On top of v4.7-rc1 , in order to revert this commit cleanly:

	9082e87 block: remove struct bio_batch

, have to revert these two:

	bbd848e0f block: reinstate early return of -EOPNOTSUPP from blkdev_issue_discard
	38f2525 block: add __blkdev_issue_discard

, then have to revert these two dependances:

202bae5 dm thin: unroll issue_discard() to create longer discard bio chains
3dba53a9 dm thin: use __blkdev_issue_discard for async discard support

With all these five commits reverted, NO memleak happens.

Reverting other four commits while not reverting 9082e87, memleak
happens.

Thanks,
Xiong
