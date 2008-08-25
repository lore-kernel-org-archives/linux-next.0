From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next:  tree build failure
Date: Mon, 25 Aug 2008 12:36:10 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0808251234550.23923@gandalf.stny.rr.com>
References: <20080825203333.e63a024a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:43672 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753925AbYHYQgN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Aug 2008 12:36:13 -0400
In-Reply-To: <20080825203333.e63a024a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


On Mon, 25 Aug 2008, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> kernel/trace/ftrace.c:317: error: redefinition of 'ftrace_release'
> include/linux/ftrace.h:207: error: previous definition of 'ftrace_release' was here
> 
> Introduced by commit 61e679bf257baf9a089641999cf618e92f07b5dd ("ftrace:
> remove old pointers to mcount").
> 
> I applied the following patch.

I'm also working on PPC right now, and saw this. I wrote a patch up, since 
it actually can be used with either version of the Dynamic Tracing.
We can keep this one for now, util I solve some of the issues I'm working 
on.

Thanks,

-- Steve
