From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: build failure after merge of the final tree (tip
 tree related)
Date: Tue, 03 Aug 2010 14:32:35 +1000
Message-ID: <1280809955.1902.85.camel@pasglop>
References: <20100803022310.bec3ba79.sfr@canb.auug.org.au>
	 <20100802162810.GB4755@flint.arm.linux.org.uk>
	 <1280799724.1902.84.camel@pasglop>  <4C57895C.1070402@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:32990 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750873Ab0HCEdN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Aug 2010 00:33:13 -0400
In-Reply-To: <4C57895C.1070402@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Russell King <rmk@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, Yinghai Lu <yinghai@kernel.org>

On Mon, 2010-08-02 at 20:13 -0700, H. Peter Anvin wrote:
> I still think that the memblock approach of having a separate data
> structure for all of memory and one for various used blocks is flawed,
> and that it would be a lot better to have a single data structure with
> attributes.  It would definitely make allocation saner.  Given that,
> there is a strong reason to keep as little of the guts exposed as
> possible.

I agree, and in fact, turning the current implementation into a single
list with attributes wouldn't necessarily be that hard as a first step. 

Ben.
