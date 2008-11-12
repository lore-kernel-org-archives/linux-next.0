From: Pekka Paalanen <pq@iki.fi>
Subject: Re: [PATCH 1/2] ftrace: disable tracing on resize
Date: Wed, 12 Nov 2008 21:56:30 +0200
Message-ID: <20081112215630.242ce97e@daedalus.pq.iki.fi>
References: <20081111025808.946638585@goodmis.org>
	<20081111030517.017566077@goodmis.org>
	<alpine.DEB.1.10.0811102216240.10298@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gv-out-0910.google.com ([216.239.58.187]:21350 "EHLO
	gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752583AbYKLT4k (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Nov 2008 14:56:40 -0500
Received: by gv-out-0910.google.com with SMTP id e6so162032gvc.37
        for <linux-next@vger.kernel.org>; Wed, 12 Nov 2008 11:56:37 -0800 (PST)
In-Reply-To: <alpine.DEB.1.10.0811102216240.10298@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Steven Rostedt <srostedt@redhat.com>, fweisbec@gmail.com

On Mon, 10 Nov 2008 22:18:19 -0500 (EST)
Steven Rostedt <rostedt@goodmis.org> wrote:

> 
> Pekka,
> 
> I forgot to add you to the Cc list. Could you test this patch to see if it 
> fixes the bug you reported. It fixed a bug I was able to reproduce, but I 
> was never able to reproduce the exact same bug you have seen.

Thanks, Steve.

I didn't have time to try it myself yet, but a kind soul tried it for me.
He used 2.6.28-rc4 and was immediately able to trigger the bug by just:
cd /debug/tracing
echo 0 > tracing_enabled
echo 200 > trace_entries

Then he applied the patch you referred to, and the bug is still present.
He has a 32-bit x86 amd system, and I'm on x86_64.

I don't know why you couldn't reproduce it, maybe you have all the tracers
enabled in the kernel config, when we only have MMIOTRACE.

I can't promise to look into this deeper in the near future :-/


> On Mon, 10 Nov 2008, Steven Rostedt wrote:
> 
> > Impact: fix for bug on resize
> > 
> > This patch addresses the bug found here:
> > 
> >  http://bugzilla.kernel.org/show_bug.cgi?id=11996
> > 
> > When ftrace converted to the new unified trace buffer, the resizing of
> > the buffer was not protected as much as it was originally. If tracing
> > is performed while the resize occurs, then the buffer can be corrupted.
> > 
> > This patch disables all ftrace buffer modifications before a resize
> > takes place.
> > 
> > Signed-off-by: Steven Rostedt <srostedt@redhat.com>
> > ---
> >  kernel/trace/trace.c |   17 ++++++++++++++++-
> >  1 files changed, 16 insertions(+), 1 deletions(-)
> > 
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index 9f3b478..abfa810 100644
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> > @@ -2676,7 +2676,7 @@ tracing_entries_write(struct file *filp, const char __user *ubuf,
> >  {
> >  	unsigned long val;
> >  	char buf[64];
> > -	int ret;
> > +	int ret, cpu;
> >  	struct trace_array *tr = filp->private_data;
> >  
> >  	if (cnt >= sizeof(buf))
> > @@ -2704,6 +2704,14 @@ tracing_entries_write(struct file *filp, const char __user *ubuf,
> >  		goto out;
> >  	}
> >  
> > +	/* disable all cpu buffers */
> > +	for_each_tracing_cpu(cpu) {
> > +		if (global_trace.data[cpu])
> > +			atomic_inc(&global_trace.data[cpu]->disabled);
> > +		if (max_tr.data[cpu])
> > +			atomic_inc(&max_tr.data[cpu]->disabled);
> > +	}
> > +
> >  	if (val != global_trace.entries) {
> >  		ret = ring_buffer_resize(global_trace.buffer, val);
> >  		if (ret < 0) {
> > @@ -2735,6 +2743,13 @@ tracing_entries_write(struct file *filp, const char __user *ubuf,
> >  	if (tracing_disabled)
> >  		cnt = -ENOMEM;
> >   out:
> > +	for_each_tracing_cpu(cpu) {
> > +		if (global_trace.data[cpu])
> > +			atomic_dec(&global_trace.data[cpu]->disabled);
> > +		if (max_tr.data[cpu])
> > +			atomic_dec(&max_tr.data[cpu]->disabled);
> > +	}
> > +
> >  	max_tr.entries = global_trace.entries;
> >  	mutex_unlock(&trace_types_lock);
> >  
> > -- 
> > 1.5.6.5

-- 
Pekka Paalanen
http://www.iki.fi/pq/
