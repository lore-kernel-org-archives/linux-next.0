From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: [xfs-masters] linux-next: manual merge of the xfs tree with
 Linus' tree
Date: Mon, 28 Mar 2011 12:58:09 +0200
Message-ID: <4D9069C1.4080602@fusionio.com>
References: <20110328122148.1b48a742.sfr@canb.auug.org.au> <20110328104753.GA27327@lst.de> <20110328105348.GA27458@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.fusionio.com ([64.244.102.31]:47042 "EHLO mx2.fusionio.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753349Ab1C1K6O (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Mar 2011 06:58:14 -0400
In-Reply-To: <20110328105348.GA27458@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Chinner <david@fromorbit.com>, "xfs-masters@oss.sgi.com" <xfs-masters@oss.sgi.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2011-03-28 12:53, Christoph Hellwig wrote:
> On Mon, Mar 28, 2011 at 12:47:53PM +0200, Christoph Hellwig wrote:
>> What XFS does is to replace blk_run_address_space, which was a wrapper
>> around blk_run_backing_dev with a direct call to blk_run_backing_dev,
>> as there change means we don't have the address_space around anymore.
>>
>> Jens' tree removes both these functions, and introduces blk_flush_plug
>> as a sort-of replacement.  Sticking to the variant from Jens' tree / mainline
>> with blk_flush_plug is the correct thing here for this case.
>>
>> Where there more conflicts than just this?
> 
> Actually I think we can remove some calls alltogether:  the on-stack
> plugging already flushes the plug queue when context switching,
> which we'll always do in xfs_buf_wait_unpin, and if we get the lock
> without blocking in xfs_buf_lock we don't need to unplug either.

Yes, in fact all of the blk_flush_plug() calls in XFS can just go away
now. I tried to keep them for clarity, but they are primarily there
since XFS was the first conversion/testing I did back when it was hacked
up.

-- 
Jens Axboe
