From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 1 Aug 2017 14:36:52 -0700
Message-ID: <20170801213652.GJ3730@linux.vnet.ibm.com>
References: <20170731135029.479025ea@canb.auug.org.au>
 <20170731161341.GG3730@linux.vnet.ibm.com>
 <1145333348.610.1501545845911.JavaMail.zimbra@efficios.com>
 <20170801040323.GP3730@linux.vnet.ibm.com>
 <CALCETrWO5g5HuNpxa4Phxg--fDPWpuCVDTVr-UfuzrK5wn-8dQ@mail.gmail.com>
 <1639218309.1091.1501596152868.JavaMail.zimbra@efficios.com>
 <CALCETrWWx8h=74td8bxbR6KZJN2GLAZ_jz9G-x9Q+Vn2AHSijQ@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50260 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751981AbdHAVg5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Aug 2017 17:36:57 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v71LXs0H124521
        for <linux-next@vger.kernel.org>; Tue, 1 Aug 2017 17:36:57 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2c2y7n6w07-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 01 Aug 2017 17:36:57 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 1 Aug 2017 17:36:56 -0400
Content-Disposition: inline
In-Reply-To: <CALCETrWWx8h=74td8bxbR6KZJN2GLAZ_jz9G-x9Q+Vn2AHSijQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Aug 01, 2017 at 07:15:40AM -0700, Andy Lutomirski wrote:
> On Tue, Aug 1, 2017 at 7:02 AM, Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
> > /*
> >  * The full memory barrier implied by mm_cpumask update operations
> >  * is required by the membarrier system call.
> >  */
> >
> > What we want to order here is:
> >
> > prev userspace memory accesses
> > schedule
> >   <full mb> (it's already there) [A]
> >   update to rq->curr changing the rq->curr->mm value
> >   <full mb> (provided by mm_cpumask updates in switch_mm on x86) [B]
> 
> If I understand this right, the issue with relying on CR3 writes is
> that the target CPU could switch to a kernel thread and back to the
> same user mm white the membarrier caller is reading its mm, right?

The thing that got my attention was your patch removing the load_cr3().
Ah, looking closer, it appears that you have not eliminated the CR3
load, but just renamed it to write_cr3().  So if there is always still
a CR3 load, you are right, I should be able to simply move the comment.
Or let you insert the comment into your patch?

So there is still always a CR3 load, correct?  (Hey, I thought that
maybe x86 was moving to ASIDs or some such.)

							Thanx, Paul
