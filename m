From: Minchan Kim <minchan@kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Mon, 14 Aug 2017 17:38:39 +0900
Message-ID: <20170814083839.GD26913@bbox>
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
Received: from LGEAMRELO12.lge.com ([156.147.23.52]:57472 "EHLO
        lgeamrelo12.lge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752148AbdHNIin (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Aug 2017 04:38:43 -0400
Content-Disposition: inline
In-Reply-To: <0F858068-D41D-46E3-B4A8-8A95B4EDB94F@vmware.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>

Hi Nadav,

On Mon, Aug 14, 2017 at 05:07:19AM +0000, Nadav Amit wrote:
< snip >

> For some reason (I would assume intentional), all the examples here first
> “do not modify” the PTE, and then modify it - which is not an “interesting”
> case. However, based on what I understand on the memory barriers, I think
> there is indeed a missing barrier before reading it in
> mm_tlb_flush_nested(). IIUC using smp_mb__after_unlock_lock() in this case,

memory-barrier.txt always scares me. I have read it for a while
and IIUC, it seems semantic of spin_unlock(&same_pte) would be
enough without some memory-barrier inside mm_tlb_flush_nested.

I would be missing something totally.

Could you explain what kinds of sequence you have in mind to
have such problem?

Thanks.
