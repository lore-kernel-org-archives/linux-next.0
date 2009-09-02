From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: still FTRACE_SYSCALL_MAX compile error on linux-next?
Date: Wed, 2 Sep 2009 11:12:58 +0200
Message-ID: <20090902091258.GA4754@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate4.de.ibm.com ([195.212.17.164]:50296 "EHLO
	mtagate4.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752539AbZIBJM5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2009 05:12:57 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate4.de.ibm.com (8.13.1/8.13.1) with ESMTP id n829Cxo0017543
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 09:12:59 GMT
Received: from d12av01.megacenter.de.ibm.com (d12av01.megacenter.de.ibm.com [9.149.165.212])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id n829Cx4t2703412
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 11:12:59 +0200
Received: from d12av01.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n829Cw3j031802
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 11:12:59 +0200
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Jason Baron <jbaron@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

Hi Ingo,

in linux-next I still see this compile error on s390:

kernel/trace/trace_syscalls.c:13: error: 'FTRACE_SYSCALL_MAX' undeclared here (not in a function)
make[2]: *** [kernel/trace/trace_syscalls.o] Error 1

The fix for this in your tracing/core branch:
"tracing: Convert event tracing code to use NR_syscalls"

is that branch not part of linux-next?
