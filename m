From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: block tree build failure
Date: Wed, 13 May 2009 08:07:12 -0400
Message-ID: <1242216433.4728.0.camel@mulgrave.int.hansenpartnership.com>
References: <20090513140413.b8a3c8d0.sfr@canb.auug.org.au>
	 <4A0A9127.90307@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:34785 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753007AbZENOcW (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 14 May 2009 10:32:22 -0400
In-Reply-To: <4A0A9127.90307@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, James Smart <James.Smart@Emulex.Com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

On Wed, 2009-05-13 at 18:21 +0900, Tejun Heo wrote:
> > I have reverted commit b1f744937f1be3e6d3009382a755679133cf782d
> > ("block: move completion related functions back to blk-core.c") and
> > applied the following patch (which I realise is probably not
> > correct) for today.  Maybe someone can come up with a better
> > solution for the scsi guys and me.
> 
> Hmmm... is there a SCSI tree which won't be rebased?  Then I can pull
> blk tree into it and SCSI tree can go on from that point on.

Not really ... especially now there's a proposal to redo the mvsas
patch.  However, block can run a postmerge tree with the changes in
them.

James
