From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: linux-next: add utrace tree
Date: Sat, 23 Jan 2010 10:05:07 +0200
Message-ID: <b6fcc0a1001230005n5eaf1738lb8413f7c6501ee72@mail.gmail.com>
References: <20100121013822.28781960.sfr@canb.auug.org.au>
	 <20100122005147.GD22003@redhat.com>
	 <20100121170541.7425ff10.akpm@linux-foundation.org>
	 <alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
	 <20100122182827.GA13185@redhat.com>
	 <20100122200129.GG22003@redhat.com>
	 <alpine.LFD.2.00.1001221355250.13231@localhost.localdomain>
	 <20100122221348.GA4263@redhat.com>
	 <alpine.LFD.2.00.1001221604190.13231@localhost.localdomain>
	 <alpine.LFD.2.00.1001221614520.13231@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f186.google.com ([209.85.223.186]:56472 "EHLO
	mail-iw0-f186.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751460Ab0AWIFJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 23 Jan 2010 03:05:09 -0500
In-Reply-To: <alpine.LFD.2.00.1001221614520.13231@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Frank Ch. Eigler" <fche@redhat.com>, Oleg Nesterov <oleg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>

On Sat, Jan 23, 2010 at 2:22 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> This is why when somebody brought up "you could do a seccomp-like thing on
> top of utrace" that my reaction was and is just totally negative. It shows
> all the wrong kinds of tying things together.

seccomp-via-utrace should be just removed to be honest before its users.
It entered the tree because it was very small and simple.
If rewritten, it no longer is small and simple because of whole kernel/utrace.c.
