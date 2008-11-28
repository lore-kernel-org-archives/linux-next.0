From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Subject: Re: next-2008-11-27: tracing on alpha (again)
Date: Fri, 28 Nov 2008 10:14:03 +0100
Message-ID: <c62985530811280114s50abe288q255a185b6d64c81b@mail.gmail.com>
References: <20081128090258.GA27346@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f11.google.com ([209.85.221.11]:34073 "EHLO
	mail-qy0-f11.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752797AbYK1JOG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Nov 2008 04:14:06 -0500
Received: by qyk4 with SMTP id 4so1544181qyk.13
        for <linux-next@vger.kernel.org>; Fri, 28 Nov 2008 01:14:03 -0800 (PST)
In-Reply-To: <20081128090258.GA27346@x200.localdomain>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, mingo@elte.hu, edwintorok@gmail.com, linux-kernel@vger.kernel.org

2008/11/28 Alexey Dobriyan <adobriyan@gmail.com>:
> On alpha-smp-n-debug-y:
>
>  CC      kernel/trace/trace.o
> kernel/trace/trace.c: In function 'ftrace_trace_userstack':
> kernel/trace/trace.c:968: error: storage size of 'trace' isn't known
> kernel/trace/trace.c:968: warning: unused variable 'trace'
> make[3]: *** [kernel/trace/trace.o] Error 1


I think it needs a missing #ifdef CONFIG_STACKTRACE inside
ftrace_trace_userstack.

>  CC      kernel/trace/trace_branch.o
> kernel/trace/trace_branch.c: In function 'probe_likely_condition':
> kernel/trace/trace_branch.c:44: error: implicit declaration of function 'raw_local_irq_save'
> kernel/trace/trace_branch.c:76: error: implicit declaration of function 'raw_local_irq_restore'
>

Needs a missing #include <linux/irqflags.h>

I don't have time to submit patches now. Probably this night....
