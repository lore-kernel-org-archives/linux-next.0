From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: block tree build failure
Date: Fri, 15 May 2009 11:47:47 +0900
Message-ID: <4A0CD7D3.3000302@kernel.org>
References: <20090513140413.b8a3c8d0.sfr@canb.auug.org.au>	 <4A0A9127.90307@kernel.org>	 <1242216433.4728.0.camel@mulgrave.int.hansenpartnership.com>	 <4A0CBB19.8060006@kernel.org> <1242354951.29670.11.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:36496 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753332AbZEOCsF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 May 2009 22:48:05 -0400
In-Reply-To: <1242354951.29670.11.camel@mulgrave>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, James Smart <James.Smart@Emulex.Com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

Hello, James.

James Bottomley wrote:
> No ... postmerge trees are held by maintainers for irreconcilable tree
> conflicts.  You run your standard tree, which can fire at any time in
> the merge window and your postmerge one which pulls in the entangled
> tree and adds your patches on top.   This can only go after the
> conflicting subsystem has also been pulled into linus head.
>
>> Out of curiousity, is there any reason not to use more standard git
>> workflow?
> 
> This is a standard workflow ...

Ah... poor wording from me.  I meant the one based on merging and
monotonic commit accumulation without rebasing.

> it's how we've pretty much always sorted out entanglements ... at
> least it's between me and Jens, which are two git trees ... I've had
> to run post merge trees against gregkh's quilt before now.
>
>> Developers (kernel devs at least) are now pretty comfortable with
>> git and trees merging and splitting off.  I can't really see much
>> value in rebasing these days.
> 
> That depends.  It's not unusual for patches to get dropped or moved
> around in my trees (I try not to do it often) which can't be done
> without rebasing.  That pretty much precludes merging because I need a
> cleanly rebaseable change set.

The only benefit I can see for rebasing these days is cosmetic cleanup
of commit history.  Well, fixing history could help bisection at times
but still I don't think it's anything substantial.  Anyways, it's your
tree and your call.

Jens, how do you wanna proceed here?  And is there anything I can do
to help?

Thanks.

-- 
tejun
