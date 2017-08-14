From: Minchan Kim <minchan@kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Mon, 14 Aug 2017 14:23:14 +0900
Message-ID: <20170814052314.GA26913@bbox>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
 <20170811214556.322b3c4e@canb.auug.org.au>
 <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
 <20170811140450.irhxa2bhdpmmhhpv@hirez.programming.kicks-ass.net>
 <DE232310-8D7E-4074-ACFE-FE6416B13A3F@vmware.com>
 <20170813125019.ihqjud37ytgri7bn@hirez.programming.kicks-ass.net>
 <20170814031613.GD25427@bbox>
 <0F858068-D41D-46E3-B4A8-8A95B4EDB94F@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from LGEAMRELO11.lge.com ([156.147.23.51]:54743 "EHLO
        lgeamrelo11.lge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751160AbdHNFXT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Aug 2017 01:23:19 -0400
Content-Disposition: inline
In-Reply-To: <0F858068-D41D-46E3-B4A8-8A95B4EDB94F@vmware.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>

On Mon, Aug 14, 2017 at 05:07:19AM +0000, Nadav Amit wrote:
< snip >

> Minchan, as for the solution you proposed, it seems to open again a race,
> since the “pending” indication is removed before the actual TLB flush is
> performed.

Oops, you're right!
