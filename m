From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: block tree build failure
Date: Fri, 15 May 2009 02:35:50 +0000
Message-ID: <1242354951.29670.11.camel@mulgrave>
References: <20090513140413.b8a3c8d0.sfr@canb.auug.org.au>
	 <4A0A9127.90307@kernel.org>
	 <1242216433.4728.0.camel@mulgrave.int.hansenpartnership.com>
	 <4A0CBB19.8060006@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:35727 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754667AbZEOCfw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 14 May 2009 22:35:52 -0400
In-Reply-To: <4A0CBB19.8060006@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, James Smart <James.Smart@Emulex.Com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

On Fri, 2009-05-15 at 09:45 +0900, Tejun Heo wrote:
> Hello, James.
> 
> James Bottomley wrote:
> > On Wed, 2009-05-13 at 18:21 +0900, Tejun Heo wrote:
> >>> I have reverted commit b1f744937f1be3e6d3009382a755679133cf782d
> >>> ("block: move completion related functions back to blk-core.c") and
> >>> applied the following patch (which I realise is probably not
> >>> correct) for today.  Maybe someone can come up with a better
> >>> solution for the scsi guys and me.
> >> Hmmm... is there a SCSI tree which won't be rebased?  Then I can pull
> >> blk tree into it and SCSI tree can go on from that point on.
> > 
> > Not really ... especially now there's a proposal to redo the mvsas
> > patch.  However, block can run a postmerge tree with the changes in
> > them.
> 
> Aieee... Yeah, I guess I can maintain temporary merge tip for blk and
> scsi (that's what you're talking about, right?).

No ... postmerge trees are held by maintainers for irreconcilable tree
conflicts.  You run your standard tree, which can fire at any time in
the merge window and your postmerge one which pulls in the entangled
tree and adds your patches on top.   This can only go after the
conflicting subsystem has also been pulled into linus head.

>   Out of curiousity,
> is there any reason not to use more standard git workflow?

This is a standard workflow ... it's how we've pretty much always sorted
out entanglements ... at least it's between me and Jens, which are two
git trees ... I've had to run post merge trees against gregkh's quilt
before now.

>   Developers
> (kernel devs at least) are now pretty comfortable with git and trees
> merging and splitting off.  I can't really see much value in rebasing
> these days.

That depends.  It's not unusual for patches to get dropped or moved
around in my trees (I try not to do it often) which can't be done
without rebasing.  That pretty much precludes merging because I need a
cleanly rebaseable change set.

James
