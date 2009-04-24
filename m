From: Sachin Sant <sachinp@in.ibm.com>
Subject: Next April 24: [S390] allmodconfig build failure (trace/events)
Date: Fri, 24 Apr 2009 12:42:20 +0530
Message-ID: <49F16654.8040208@in.ibm.com>
References: <20090424150456.ff35e4ea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp05.in.ibm.com ([59.145.155.5]:49750 "EHLO
	e28smtp05.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751230AbZDXHMU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Apr 2009 03:12:20 -0400
In-Reply-To: <20090424150456.ff35e4ea.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-s390@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Ingo Molnar <mingo@redhat.com>

Today's next tree build(s390 allmodconfig) failed with

kernel/built-in.o: In function `trace_softirq_entry'
include/trace/events/irq.h:42: undefined reference to 
`__tracepoint_softirq_entry'
include/trace/events/irq.h:42: undefined reference to 
`__tracepoint_softirq_entry'
kernel/built-in.o: In function `trace_softirq_exit':
include/trace/events/irq.h:48: undefined reference to 
`__tracepoint_softirq_exit'
include/trace/events/irq.h:48: undefined reference to 
`__tracepoint_softirq_exit'

Thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
