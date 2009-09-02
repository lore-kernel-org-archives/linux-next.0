From: Ingo Molnar <mingo@elte.hu>
Subject: Re: still FTRACE_SYSCALL_MAX compile error on linux-next?
Date: Wed, 2 Sep 2009 13:02:31 +0200
Message-ID: <20090902110231.GA3910@elte.hu>
References: <20090902091258.GA4754@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:34004 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751425AbZIBLCf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Sep 2009 07:02:35 -0400
Content-Disposition: inline
In-Reply-To: <20090902091258.GA4754@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Jason Baron <jbaron@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>


* Heiko Carstens <heiko.carstens@de.ibm.com> wrote:

> Hi Ingo,
> 
> in linux-next I still see this compile error on s390:
> 
> kernel/trace/trace_syscalls.c:13: error: 'FTRACE_SYSCALL_MAX' undeclared here (not in a function)
> make[2]: *** [kernel/trace/trace_syscalls.o] Error 1
> 
> The fix for this in your tracing/core branch:
> "tracing: Convert event tracing code to use NR_syscalls"
> 
> is that branch not part of linux-next?

it is, but it had open bugs so i couldnt push it for some while. 
Will push later today most likely.

	Ingo
