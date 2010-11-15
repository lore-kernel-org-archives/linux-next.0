From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the xen tree with Linus' tree
Date: Mon, 15 Nov 2010 22:07:48 +0100
Message-ID: <4CE1A124.3010108@kernel.dk>
References: <20101115112352.6cbf5604.sfr@canb.auug.org.au> <4CE1A07B.5010202@goop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:53463 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754205Ab0KOVHu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Nov 2010 16:07:50 -0500
In-Reply-To: <4CE1A07B.5010202@goop.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On 2010-11-15 22:04, Jeremy Fitzhardinge wrote:
> On 11/14/2010 04:23 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the xen tree got a conflict in
>> drivers/block/xen-blkfront.c between commit
>> 02e031cbc843b010e72fcc05c76113c688b2860f ("block: remove
>> REQ_HARDBARRIER") from Linus' tree and commits
>> c64e38ea17a81721da0393584fd807f8434050fa ("xen/blkfront: map REQ_FLUSH
>> into a full barrier") and be2f8373c188ed1f5d36003c9928e4d695213080
>> ("xen/blkfront: Implement FUA with BLKIF_OP_WRITE_BARRIER") from the xen
>> tree.
>>
>> I used the xen tree version.
> 
> I'll drop that because you should be seeing those changes come via Jens.

Yep, since Linus pulled the last batch, for-linus now has the next bits
(which include the xen barrier set).

-- 
Jens Axboe
