From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 1 Aug 2017 15:40:32 +0000 (UTC)
Message-ID: <1205506069.1647.1501602032052.JavaMail.zimbra@efficios.com>
References: <20170731135029.479025ea@canb.auug.org.au> <20170731161341.GG3730@linux.vnet.ibm.com> <1145333348.610.1501545845911.JavaMail.zimbra@efficios.com> <20170801040323.GP3730@linux.vnet.ibm.com> <CALCETrWO5g5HuNpxa4Phxg--fDPWpuCVDTVr-UfuzrK5wn-8dQ@mail.gmail.com> <1639218309.1091.1501596152868.JavaMail.zimbra@efficios.com> <CALCETrWWx8h=74td8bxbR6KZJN2GLAZ_jz9G-x9Q+Vn2AHSijQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.efficios.com ([167.114.142.141]:57571 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750832AbdHAPka (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Aug 2017 11:40:30 -0400
In-Reply-To: <CALCETrWWx8h=74td8bxbR6KZJN2GLAZ_jz9G-x9Q+Vn2AHSijQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

----- On Aug 1, 2017, at 10:15 AM, Andy Lutomirski luto@kernel.org wrote:

> On Tue, Aug 1, 2017 at 7:02 AM, Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
>> /*
>>  * The full memory barrier implied by mm_cpumask update operations
>>  * is required by the membarrier system call.
>>  */
>>
>> What we want to order here is:
>>
>> prev userspace memory accesses
>> schedule
>>   <full mb> (it's already there) [A]
>>   update to rq->curr changing the rq->curr->mm value
>>   <full mb> (provided by mm_cpumask updates in switch_mm on x86) [B]
> 
> If I understand this right, the issue with relying on CR3 writes is
> that the target CPU could switch to a kernel thread and back to the
> same user mm white the membarrier caller is reading its mm, right?

The current implementation of context_switch() does:

        mm = next->mm;
        oldmm = prev->active_mm;

        if (!mm)
                next->active_mm = oldmm;

        if (!prev->mm) {
                prev->active_mm = NULL;
                rq->prev_mm = oldmm;
        }

so basically the only way to have a non-null rq->prev_mm when we
reach finish_task_switch() is to have a non-null prev->active_mm
in context_switch (kernel thread).

finish_task_switch() has:

struct mm_struct *mm = rq->prev_mm;
[...]
if (mm)
        mmdrop(mm);

which issues a full memory barrier through atomic_dec_and_test(). This
happens to take care of this kthread->uthread scenario. I think it would
be important to document though.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
