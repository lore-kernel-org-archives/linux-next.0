From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] tracing/syscalls: fix printk formats
Date: Fri, 21 Aug 2009 23:04:30 +0200
Message-ID: <20090821210430.GA1039@elte.hu>
References: <20090821164140.71968b47.sfr@canb.auug.org.au> <20090821140020.c4140ca9.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:43718 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932640AbZHUVEl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 21 Aug 2009 17:04:41 -0400
Content-Disposition: inline
In-Reply-To: <20090821140020.c4140ca9.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt <rostedt@goodmis.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix printk format warnings:
> 
> kernel/trace/trace_syscalls.c:113: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_syscalls.c:123: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'

thanks, this (and other) bugs were already fixed by Li Zefan via:

  4539f07: tracing/syscalls: Fix the output of syscalls with no arguments

	Ingo
