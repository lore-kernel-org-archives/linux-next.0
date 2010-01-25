From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: add utrace tree
Date: Mon, 25 Jan 2010 11:13:46 +0100
Message-ID: <1264414426.4283.1644.camel@laptop>
References: <20100121170541.7425ff10.akpm@linux-foundation.org>
	 <alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
	 <20100122182827.GA13185@redhat.com> <20100122200129.GG22003@redhat.com>
	 <alpine.LFD.2.00.1001221355250.13231@localhost.localdomain>
	 <20100122221348.GA4263@redhat.com>
	 <alpine.LFD.2.00.1001221604190.13231@localhost.localdomain>
	 <alpine.LFD.2.00.1001221614520.13231@localhost.localdomain>
	 <f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com>
	 <20100123112333.GA15455@elte.hu>  <20100125045908.GB4895@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:33219 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752769Ab0AYKOQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2010 05:14:16 -0500
In-Reply-To: <20100125045908.GB4895@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ananth@in.ibm.com
Cc: Ingo Molnar <mingo@elte.hu>, Kyle Moffett <kyle@moffetthome.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>

On Mon, 2010-01-25 at 10:29 +0530, Ananth N Mavinakayanahalli wrote:
> - Extend perf; would perf then use utrace underneath? Or would one have
>   to redo some of what utrace already does for thread level control?

No, perf is about monitoring/tracing not modifying. Its about minimal
interference, the very opposite of what ptrace/utrace is about.

>From a perf POV if you need to stop a task (changing it scheduling
state) you've lost.

Furthermore, despite the name utrace isn't about tracing at all, its a
full blown debugging infrastructure which completely multiplexes the
task state, not something perf is interested in at all.
