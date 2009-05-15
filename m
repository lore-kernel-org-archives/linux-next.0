From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: block tree build failure
Date: Fri, 15 May 2009 12:38:29 +0900
Message-ID: <4A0CE3B5.8070308@kernel.org>
References: <20090513140413.b8a3c8d0.sfr@canb.auug.org.au>	 <4A0A9127.90307@kernel.org>	 <1242216433.4728.0.camel@mulgrave.int.hansenpartnership.com>	 <4A0CBB19.8060006@kernel.org> <1242354951.29670.11.camel@mulgrave>	 <4A0CD7D3.3000302@kernel.org> <1242357846.4060.2.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:52356 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753985AbZEODin (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 May 2009 23:38:43 -0400
In-Reply-To: <1242357846.4060.2.camel@mulgrave>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, James Smart <James.Smart@Emulex.Com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

Hello, James.

James Bottomley wrote:
>> Ah... poor wording from me.  I meant the one based on merging and
>> monotonic commit accumulation without rebasing.
> 
> But that's not really possible here ... the only way to combine the two
> incompatible trees now while maintaining bisectability is to hide a non
> trivial patch in the merge point ... that's the worst practice of all.

With proper commit message, I don't think straight merge would be that
bad.  The amount of conflicting code isn't that large.  But we're
talking about two extremes here.  Straight merging at one end and
keeping temporary tree till the merge into Linus's tree happens.

The problem with floating the block tree till the final merge is that
it might make SCSI happy but SCSI isn't the only consumer.  It just
doesn't scale.

I don't really care about the specific merge order as long as there
can be a mid synchronization point from which everyone can go on again
and there are three trees involved and if there's any way to get a
stable merge point from SCSI, things will work nicely.

Thanks.

-- 
tejun
