From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Mon, 25 Aug 2008 11:16:43 +0200
Message-ID: <20080825091643.GD9114@elte.hu>
References: <20080815115410.458633f1.sfr@canb.auug.org.au> <20080825120140.af8e1fb5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:37774 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755590AbYHYJRJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 05:17:09 -0400
Content-Disposition: inline
In-Reply-To: <20080825120140.af8e1fb5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Jason Baron <jbaron@redhat.com>, Greg KH <greg@kroah.com>, Steven Rostedt <rostedt@goodmis.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi All,
> 
> On Fri, 15 Aug 2008 11:54:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the ftrace tree got a conflict in
> > kernel/module.c between commit 1b75321c2d0561d9ecfe3794fa939264f3eb7e26
> > ("driver core: basic infrastructure for per-module dynamic debug
> > messages") from the driver-core tree and commit
> > e543dff1468a55cdff9932dd3a806524790cf0b3 ("tracing: Kernel Tracepoints")
> > from the ftrace tree.
> > 
> > Overlapping additions.  I fixed it up. Probably worth a look once I
> > publish the tree.
> 
> Today this has expanded to include commit 
> be1c870c22e9b27170b5dd5028b6eaf2aab7b508 ("ftrace: enable mcount 
> recording for modules") also from the ftrace tree.  I have fixed it up 
> as below.

Thanks Stephen. I suspect there's not much we can do at this point to 
resolve this conflict sooner than at the linux-next level, as Rusty uses 
Quilt queues.

	Ingo
