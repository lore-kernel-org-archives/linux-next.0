From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: manual merge of the ptrace tree with the s390 tree
Date: Fri, 22 Jul 2011 16:49:07 +0200
Message-ID: <20110722144907.GA7408@redhat.com>
References: <20110720153320.a7f33784158ccb04fafcb5d6@canb.auug.org.au> <20110721080240.GZ3455@htj.dyndns.org> <20110721144447.GA7580@redhat.com> <20110722080600.GE2622@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110722080600.GE2622@htj.dyndns.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
List-Id: linux-next.vger.kernel.org

On 07/22, Tejun Heo wrote:
>
> Yeah, it looks like a proper mess.

Yes.

> It seems ptrace left too much for
> archs to decide.  Events to be reported should be defined by generic
> ptrace code

I agree very much. Right now I am not sure if it really makes sense
to avoid the SIGTRAP signals, but in any case I think that at least
we need the generic ptrace_sigtrap(si_code, ...) helper which hides
all details.

And note that force_sig*() we use currently is wrong in this case,
it removes SIGNAL_UNKILLABLE.

And we should also cleanup the force_* mess. Also, it would be
nice to remove the "task_struct *t" argument, force_sig_info()
should be only used for synchronous signals. Afaics, only oom
killer really needs force_sig_info() with t != current. And this
reminds me, we need send_sigkill().

Oleg.
