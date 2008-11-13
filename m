From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/2] ftrace: disable tracing on resize
Date: Wed, 12 Nov 2008 19:03:24 -0500 (EST)
Message-ID: <alpine.DEB.1.10.0811121902490.30248@gandalf.stny.rr.com>
References: <20081111025808.946638585@goodmis.org> <20081111030517.017566077@goodmis.org> <alpine.DEB.1.10.0811102216240.10298@gandalf.stny.rr.com> <20081112215630.242ce97e@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125]:46670 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753805AbYKMAD1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Nov 2008 19:03:27 -0500
In-Reply-To: <20081112215630.242ce97e@daedalus.pq.iki.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Paalanen <pq@iki.fi>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Steven Rostedt <srostedt@redhat.com>, fweisbec@gmail.com


On Wed, 12 Nov 2008, Pekka Paalanen wrote:

> On Mon, 10 Nov 2008 22:18:19 -0500 (EST)
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > 
> > Pekka,
> > 
> > I forgot to add you to the Cc list. Could you test this patch to see if it 
> > fixes the bug you reported. It fixed a bug I was able to reproduce, but I 
> > was never able to reproduce the exact same bug you have seen.
> 
> Thanks, Steve.
> 
> I didn't have time to try it myself yet, but a kind soul tried it for me.
> He used 2.6.28-rc4 and was immediately able to trigger the bug by just:
> cd /debug/tracing
> echo 0 > tracing_enabled
> echo 200 > trace_entries
> 
> Then he applied the patch you referred to, and the bug is still present.
> He has a 32-bit x86 amd system, and I'm on x86_64.
> 
> I don't know why you couldn't reproduce it, maybe you have all the tracers
> enabled in the kernel config, when we only have MMIOTRACE.

After disabling all other tracers, you are right. This sequence crashes.

I'll look into it, and I should have a patch sometime tonight.

-- Steve
