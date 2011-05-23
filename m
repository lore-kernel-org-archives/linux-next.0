From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [bloat] Measuring header file bloat effects on kernel build
 performance: a more than 2x slowdown ...
Date: Mon, 23 May 2011 09:01:44 -0700
Message-ID: <BANLkTim_pWfU0=ck8=F1kt_bwjtdGRDgdQ@mail.gmail.com>
References: <20110520161210.81bbef3a.sfr@canb.auug.org.au> <BANLkTi=Dn_jvJ8mLY0Bc6C1Ptoqa-kJrCg@mail.gmail.com>
 <20110523090918.GA5474@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110523090918.GA5474@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Mon, May 23, 2011 at 2:09 AM, Ingo Molnar <mingo@elte.hu> wrote:
>
> I've attached a totally hacky patch that removes all the big #include's from
> kernel/pid.c and includes all structure and API definitions explicitly.

Hmm.

A less hacky patch might be to split up "sched.h" into multiple
smaller things and at least get *part* of the way.

A lot of things want "struct task_struct" (and in some cases
thread_info, but that's already split).

Much fewer care about the signal stuff.

And many things probably don't even need the task_struct definition,
and might be perfectly happy with just function calls rather than
having intimate knowledge of the structure layout and an inline
function.

                       Linus
