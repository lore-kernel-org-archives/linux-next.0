From: Andy Lutomirski <luto@kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 1 Aug 2017 07:15:40 -0700
Message-ID: <CALCETrWWx8h=74td8bxbR6KZJN2GLAZ_jz9G-x9Q+Vn2AHSijQ@mail.gmail.com>
References: <20170731135029.479025ea@canb.auug.org.au> <20170731161341.GG3730@linux.vnet.ibm.com>
 <1145333348.610.1501545845911.JavaMail.zimbra@efficios.com>
 <20170801040323.GP3730@linux.vnet.ibm.com> <CALCETrWO5g5HuNpxa4Phxg--fDPWpuCVDTVr-UfuzrK5wn-8dQ@mail.gmail.com>
 <1639218309.1091.1501596152868.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1639218309.1091.1501596152868.JavaMail.zimbra@efficios.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 1, 2017 at 7:02 AM, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
> /*
>  * The full memory barrier implied by mm_cpumask update operations
>  * is required by the membarrier system call.
>  */
>
> What we want to order here is:
>
> prev userspace memory accesses
> schedule
>   <full mb> (it's already there) [A]
>   update to rq->curr changing the rq->curr->mm value
>   <full mb> (provided by mm_cpumask updates in switch_mm on x86) [B]

If I understand this right, the issue with relying on CR3 writes is
that the target CPU could switch to a kernel thread and back to the
same user mm white the membarrier caller is reading its mm, right?
