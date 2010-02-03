From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: manual merge of the percpu tree with the tip tree
Date: Wed, 3 Feb 2010 23:26:21 +0100
Message-ID: <20100203222616.GF5068@nowhere>
References: <20100203163822.2742bcc5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100203163822.2742bcc5.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 03, 2010 at 04:38:22PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the percpu tree got a conflict in
> include/linux/ftrace_event.h, include/trace/ftrace.h,
> kernel/trace/trace_kprobe.c, kernel/trace/trace_syscalls.c and
> kernel/trace/trace_event_profile.c between commit
> 430ad5a600a83956749307b13257c464c3826b55 ("perf: Factorize trace events
> raw sample buffer operations") from the tip tree and commit
> eeb721be6bc03fe37755e69ab5c3ba2fe9897fd9 ("percpu: add __percpu sparse
> annotations to trace") from the percpu tree.
> 
> I attempted to fix them up (see below) but someone should check the
> result carefully.  (The apparently unchanged files below used the tip
> tree versions.)
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



I'm not very used to review patches on patches :)

But yeah that looks good to me.

Thanks!
