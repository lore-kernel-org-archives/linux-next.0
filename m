From: Andy Lutomirski <luto@kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 1 Aug 2017 07:17:56 -0700
Message-ID: <CALCETrVjzqZEJXHSGYQt_j-fAOSP2E8H7DWE7NHzrBkzzEUgFQ@mail.gmail.com>
References: <20170731135029.479025ea@canb.auug.org.au> <20170731161341.GG3730@linux.vnet.ibm.com>
 <1145333348.610.1501545845911.JavaMail.zimbra@efficios.com>
 <20170801040323.GP3730@linux.vnet.ibm.com> <CALCETrWO5g5HuNpxa4Phxg--fDPWpuCVDTVr-UfuzrK5wn-8dQ@mail.gmail.com>
 <20170801135849.t5nbcqotkhztr5mr@hirez.programming.kicks-ass.net> <20170801141548.mivo7du4nl26r7z3@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751199AbdHAOSS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 10:18:18 -0400
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com [209.85.213.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3138422C87
        for <linux-next@vger.kernel.org>; Tue,  1 Aug 2017 14:18:18 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id n125so6678263vke.1
        for <linux-next@vger.kernel.org>; Tue, 01 Aug 2017 07:18:18 -0700 (PDT)
In-Reply-To: <20170801141548.mivo7du4nl26r7z3@hirez.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Aug 1, 2017 at 7:15 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Aug 01, 2017 at 03:58:49PM +0200, Peter Zijlstra wrote:
>> On Tue, Aug 01, 2017 at 06:43:14AM -0700, Andy Lutomirski wrote:
>> > Anyway, can you document whatever property you require with a comment
>> > in switch_mm() or wherever you're finding that property so that future
>> > arch changes don't break it?
>>
>> We need _a_ smp_mb after rq->curr store. x86 has plenty.
>
> That is, we need it when we change to a different !0 mm. And we have the
> mm_cpumask() atomics at the very least, even if loading a new CR3 would
> not be serializing.

I'm 99.5% sure that loading a new CR3 is always serializing even if it
doesn't flush the TLB.
