From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: still FTRACE_SYSCALL_MAX compile error on linux-next?
Date: Wed, 2 Sep 2009 13:12:34 +0200
Message-ID: <20090902111234.GB4754@osiris.boeblingen.de.ibm.com>
References: <20090902091258.GA4754@osiris.boeblingen.de.ibm.com>
 <20090902110231.GA3910@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate4.uk.ibm.com ([195.212.29.137]:42491 "EHLO
	mtagate4.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750921AbZIBLMi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2009 07:12:38 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate4.uk.ibm.com (8.14.3/8.13.8) with ESMTP id n82BCawE074912
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 11:12:36 GMT
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com [9.149.37.228])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id n82BCZfm1708230
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 12:12:35 +0100
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n82BCZ7S020850
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 12:12:35 +0100
Content-Disposition: inline
In-Reply-To: <20090902110231.GA3910@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Jason Baron <jbaron@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Wed, Sep 02, 2009 at 01:02:31PM +0200, Ingo Molnar wrote:
> 
> * Heiko Carstens <heiko.carstens@de.ibm.com> wrote:
> 
> > Hi Ingo,
> > 
> > in linux-next I still see this compile error on s390:
> > 
> > kernel/trace/trace_syscalls.c:13: error: 'FTRACE_SYSCALL_MAX' undeclared here (not in a function)
> > make[2]: *** [kernel/trace/trace_syscalls.o] Error 1
> > 
> > The fix for this in your tracing/core branch:
> > "tracing: Convert event tracing code to use NR_syscalls"
> > 
> > is that branch not part of linux-next?
> 
> it is, but it had open bugs so i couldnt push it for some while. 
> Will push later today most likely.

Ok, thanks!
