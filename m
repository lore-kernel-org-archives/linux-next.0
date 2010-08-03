From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build failure after merge of the final tree (tip
 tree related)
Date: Mon, 02 Aug 2010 20:13:32 -0700
Message-ID: <4C57895C.1070402@zytor.com>
References: <20100803022310.bec3ba79.sfr@canb.auug.org.au>	 <20100802162810.GB4755@flint.arm.linux.org.uk> <1280799724.1902.84.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:60378 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751852Ab0HCDPB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Aug 2010 23:15:01 -0400
In-Reply-To: <1280799724.1902.84.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Russell King <rmk@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, Yinghai Lu <yinghai@kernel.org>

On 08/02/2010 06:42 PM, Benjamin Herrenschmidt wrote:
> 
> I'm happy to wait and sit on the memblock churn until after ARM's in.
> 
> I can then fixup my patches.
> 

As far as x86 is concerned, I would like to try to get the whole thing
into -tip fairly early in a kernel cycle, so that it can get -tip/-next
testing for a while before merging.

I would much rather smoke out bugs like the qla2xxx failing to implement
.shutdown and therefore doing DMA on random memory than just paper it
over by functionally re-implementing a bunch of the memblock guts in x86.

I still think that the memblock approach of having a separate data
structure for all of memory and one for various used blocks is flawed,
and that it would be a lot better to have a single data structure with
attributes.  It would definitely make allocation saner.  Given that,
there is a strong reason to keep as little of the guts exposed as possible.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
