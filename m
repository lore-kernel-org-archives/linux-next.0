From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Mon, 1 Dec 2008 08:40:49 +0100
Message-ID: <20081201074049.GA27768@elte.hu>
References: <20081201113742.da2d3923.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:47340 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750718AbYLAHlI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2008 02:41:08 -0500
Content-Disposition: inline
In-Reply-To: <20081201113742.da2d3923.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Lai Jiangshan <laijs@cn.fujitsu.com>, Steven Rostedt <rostedt@goodmis.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the ftrace tree got a conflict in 
> kernel/trace/ring_buffer.c between commit 
> 4f5a7f40ddbae98569acbb99118a98570315579c ("ftrace: prevent recursion") 
> from Linus' tree and commit 182e9f5f704ed6b9175142fe8da33c9ce0c52b52 
> ("ftrace: insert in the ftrace_preempt_disable()/enable() functions") 
> from the ftrace tree.

Correct.

As usual, you can save yourself some work and take a look into or 
double-check tip/master for such resolutions - i pushed this conflict 
resolution out 4 days ago:

| commit 9e418deb22f9b19607823b1830a79138ebb3bd3c
| Merge: d477d0d... 4f5a7f4...
| Author: Ingo Molnar <mingo@elte.hu>
| Date:   Thu Nov 27 10:13:12 2008 +0100
|
|     Merge branch 'tracing/urgent'
|    
|    Conflicts:
|        kernel/trace/ring_buffer.c

(I shield you from most conflicts but it's not always possible and in 99% 
of the cases there's a resolution in tip/master already.)

> I am pretty sure that the latter supercedes the former, so I used that 
> version.  Please fix this conflict up in the ftrace tree soon.

Now that it has hit Linus's tree a couple of hours ago, i pushed it out 
into the ftrace-next tree as well.

Thanks Stephen,

	Ingo
