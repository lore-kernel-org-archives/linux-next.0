From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Wed, 31 Oct 2012 14:57:07 +0100
Message-ID: <50912E33.1030108@kernel.dk>
References: <20121031130439.7242d3f12fa7002624c3b1e6@canb.auug.org.au> <1351691714.13356.31.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:54235 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422754Ab2JaN5g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 31 Oct 2012 09:57:36 -0400
In-Reply-To: <1351691714.13356.31.camel@deadeye.wl.decadent.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>, Herton Ronaldo Krzesinski <herton.krzesinski@canonical.com>

On 2012-10-31 14:55, Ben Hutchings wrote:
> On Wed, 2012-10-31 at 13:04 +1100, Stephen Rothwell wrote:
>> Hi Jens,
>>
>> Today's linux-next merge of the block tree got a conflict in
>> drivers/block/floppy.c between a set of common patches from Linus' tree
>> and commit b33d002f4b6b ("genhd: Make put_disk() safe for disks that have
>> not been registered") from the block tree.
>>
>> I fixed it up (by using the block tree version) and can carry the fix as
>> necessary (no action is required).
> 
> commit b33d002f4b6b ("genhd: Make put_disk() safe for disks that have
> not been registered") was supposed to be dropped or reverted; I don't
> why it's hanging around.

It's my for-next branch that wasn't updated yet. Will do that now.

-- 
Jens Axboe
