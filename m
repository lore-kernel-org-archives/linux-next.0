From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: block tree build failure
Date: Fri, 15 May 2009 09:45:13 +0900
Message-ID: <4A0CBB19.8060006@kernel.org>
References: <20090513140413.b8a3c8d0.sfr@canb.auug.org.au>	 <4A0A9127.90307@kernel.org> <1242216433.4728.0.camel@mulgrave.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:58675 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751470AbZEOAoO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 May 2009 20:44:14 -0400
In-Reply-To: <1242216433.4728.0.camel@mulgrave.int.hansenpartnership.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, James Smart <James.Smart@Emulex.Com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

Hello, James.

James Bottomley wrote:
> On Wed, 2009-05-13 at 18:21 +0900, Tejun Heo wrote:
>>> I have reverted commit b1f744937f1be3e6d3009382a755679133cf782d
>>> ("block: move completion related functions back to blk-core.c") and
>>> applied the following patch (which I realise is probably not
>>> correct) for today.  Maybe someone can come up with a better
>>> solution for the scsi guys and me.
>> Hmmm... is there a SCSI tree which won't be rebased?  Then I can pull
>> blk tree into it and SCSI tree can go on from that point on.
> 
> Not really ... especially now there's a proposal to redo the mvsas
> patch.  However, block can run a postmerge tree with the changes in
> them.

Aieee... Yeah, I guess I can maintain temporary merge tip for blk and
scsi (that's what you're talking about, right?).  Out of curiousity,
is there any reason not to use more standard git workflow?  Developers
(kernel devs at least) are now pretty comfortable with git and trees
merging and splitting off.  I can't really see much value in rebasing
these days.

Thanks.

-- 
tejun
