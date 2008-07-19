From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: linux-next: Tree for July 18: warning at kernel/lockdep.c:2068
	trace_hardirqs_on_caller
Date: Sat, 19 Jul 2008 15:17:23 -0700
Message-ID: <20080719221723.GB5578@suse.de>
References: <20080718195352.e562a00f.sfr@canb.auug.org.au> <200807190928.33978.m.kozlowski@tuxland.pl> <19f34abd0807190255x304173d4wf2bfabb2d5bce511@mail.gmail.com> <19f34abd0807190559y2fe5ebf9h7095793e82de3122@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <19f34abd0807190559y2fe5ebf9h7095793e82de3122-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mariusz Kozlowski <m.kozlowski-NWF1p15JEu3VItvQsEIGlw@public.gmane.org>, Dave Hansen <haveblue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Sat, Jul 19, 2008 at 02:59:12PM +0200, Vegard Nossum wrote:
> On Sat, Jul 19, 2008 at 11:55 AM, Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > What I don't get here is how SLUB can be used this early in the boot
> > process. Notice that this is still miles away from the
> >
> >    SLUB: Genslabs=12, HWalign=128, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> >
> > line, which comes much later. And that kobject_init() _is_ calling
> > kzalloc() via verify_dynamic_kobject_allocation(). Isn't this an
> > error?
> >
> > (Unfortunately, my "git log" doesn't turn up any recent changes for
> > any of the affected code paths here.)
> 
> Ehe... and this is the reason why: The code was added by this patch:
> 
> commit 0e3638d1e04040121af00195f7e4628078246489
> Author: Dave Hansen <haveblue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> Date:   Thu Mar 16 17:30:16 2006 -0800
> 
>     warn when statically-allocated kobjects are used
> 
> ..which only exists in -next. Is that just a truly ancient patch, or
> did somebody forget to adjust their clock?

It is truely a very old patch, that only lives in my tree, and currently
isn't planned to go to Linus any year soon.

But it has a very long history of living in the -mm tree, and finding
real bugs, it's just not "safe" enough to go to Linus's tree.  Unless
you think it is?

thanks,

greg k-h
