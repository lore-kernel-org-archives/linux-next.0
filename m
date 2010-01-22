From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: add utrace tree
Date: Thu, 21 Jan 2010 16:30:04 -0800
Message-ID: <20100121163004.8779bd69.akpm@linux-foundation.org>
References: <20100119211646.GF16096@redhat.com>
	<20100120111220.e7fb4e2c.sfr@canb.auug.org.au>
	<20100120054950.GB27108@elte.hu>
	<20100120061551.GB6588@in.ibm.com>
	<20100120062834.GB12165@elte.hu>
	<20100120072925.GA11395@elte.hu>
	<20100121013822.28781960.sfr@canb.auug.org.au>
	<20100122111747.3c224dfd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:49649 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752262Ab0AVAbD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jan 2010 19:31:03 -0500
In-Reply-To: <20100122111747.3c224dfd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Linus <torvalds@linux-foundation.org>

On Fri, 22 Jan 2010 11:17:47 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Any thoughts?

I'm nearly a week behind again and am trying to avoid thinking.

I've had a (n old) version of utrace in -mm for ages and it didn't
break anything.

I still don't think I've seen a really compelling reason for merging
it.  At least, I wouldn't be able to explain why we did it.  But
presumably there _are_ such reasons, because it was a lot of development work.

Someone please sell this to us.
