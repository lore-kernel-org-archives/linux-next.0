From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: block tree build failure
Date: Thu, 14 May 2009 23:24:06 -0400
Message-ID: <1242357846.4060.2.camel@mulgrave>
References: <20090513140413.b8a3c8d0.sfr@canb.auug.org.au>
	 <4A0A9127.90307@kernel.org>
	 <1242216433.4728.0.camel@mulgrave.int.hansenpartnership.com>
	 <4A0CBB19.8060006@kernel.org> <1242354951.29670.11.camel@mulgrave>
	 <4A0CD7D3.3000302@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:34652 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754020AbZEODYH (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 14 May 2009 23:24:07 -0400
In-Reply-To: <4A0CD7D3.3000302@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, James Smart <James.Smart@Emulex.Com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

On Fri, 2009-05-15 at 11:47 +0900, Tejun Heo wrote:
> Hello, James.
> 
> James Bottomley wrote:
> > No ... postmerge trees are held by maintainers for irreconcilable tree
> > conflicts.  You run your standard tree, which can fire at any time in
> > the merge window and your postmerge one which pulls in the entangled
> > tree and adds your patches on top.   This can only go after the
> > conflicting subsystem has also been pulled into linus head.
> >
> >> Out of curiousity, is there any reason not to use more standard git
> >> workflow?
> > 
> > This is a standard workflow ...
> 
> Ah... poor wording from me.  I meant the one based on merging and
> monotonic commit accumulation without rebasing.

But that's not really possible here ... the only way to combine the two
incompatible trees now while maintaining bisectability is to hide a non
trivial patch in the merge point ... that's the worst practice of all.

James
