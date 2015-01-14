From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] ftrace: don't allow IPMODIFY without proper compiler
 support (was Re: Re: livepatching tree for linux-next)
Date: Wed, 14 Jan 2015 09:34:30 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1501140930260.4162@pobox.suse.cz>
References: <alpine.LNX.2.00.1412221412360.1680@pobox.suse.cz> <20141223094607.GA16445@infradead.org> <20141223151056.GA4789@treble.redhat.com> <20141226155613.36dd95b9@canb.auug.org.au> <20150107144317.61ab2080877a4d8227990551@linux-foundation.org>
 <alpine.LNX.2.00.1501072346400.15299@pobox.suse.cz> <20150107153006.60ed354e3458f402e6819b9e@linux-foundation.org> <alpine.LNX.2.00.1501080037030.15299@pobox.suse.cz> <20150107155701.4839545f63701412003edd88@linux-foundation.org>
 <alpine.LNX.2.00.1501080104190.15299@pobox.suse.cz> <54B3C1DD.6090400@hitachi.com> <alpine.LNX.2.00.1501132345080.4162@pobox.suse.cz> <54B5D5B9.4060409@hitachi.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54B5D5B9.4060409@hitachi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Josh Poimboeuf <jpoimboe@redhat.com>, Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

On Wed, 14 Jan 2015, Masami Hiramatsu wrote:

> > diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
> > index f45acad..29fa417 100644
> > --- a/arch/x86/include/asm/ftrace.h
> > +++ b/arch/x86/include/asm/ftrace.h
> > @@ -4,8 +4,10 @@
> >  #ifdef CONFIG_FUNCTION_TRACER
> >  #ifdef CC_USING_FENTRY
> >  # define MCOUNT_ADDR		((long)(__fentry__))
> > +# define arch_ftrace_ipmodify_compiler_support(void) ({ 1; })
> >  #else
> >  # define MCOUNT_ADDR		((long)(mcount))
> > +#define arch_ftrace_ipmodify_compiler_support(void) ({ 0; })
> 
> Hmm, can we just define ARCH_FTRACE_SUPPORT_IPMODIFY here?

Yup, that's more or less what Steven suggested as well. I'll send v2.

> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index 929a733..11370fd 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -1809,6 +1809,11 @@ static int __ftrace_hash_update_ipmodify(struct ftrace_ops *ops,
> >  	if (!(ops->flags & FTRACE_OPS_FL_IPMODIFY))
> >  		return 0;
> >  
> > +	if (!arch_ftrace_ipmodify_compiler_support()) {
> > +		WARN(1, "Your compiler doesn't support features necessary for IPMODIFY");
> > +		return 0;
> > +	}
> 
> Actually, if ftrace doesn't support IPMODIFY, I would like to just drop
> the entire code for CONFIG_KPROBES_ON_FTRACE(this is a hidden config),
> instead of checking at runtime.
> 
> So, there are 2 ifdefs of code in kernel/kprobes.c for 
> CONFIG_KPROBES_ON_FTRACE, those should also check 
> ARCH_FTRACE_SUPPORT_IPMODIFY too.

Makes sense. Will send that as a followup patch once the way how to do 
this in ftrace is settled.

Thanks,

-- 
Jiri Kosina
SUSE Labs
