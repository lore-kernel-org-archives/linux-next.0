From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 11 (tracing)
Date: Thu, 12 Mar 2009 09:17:08 -0700
Message-ID: <49B93584.3020302@oracle.com>
References: <20090311225913.51589223.sfr@canb.auug.org.au> <49B7F691.5000305@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:57137 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753629AbZCLQPu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2009 12:15:50 -0400
In-Reply-To: <49B7F691.5000305@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Steven Rostedt <srostedt@redhat.com>, Ingo Molnar <mingo@elte.hu>

[adding cc:s]

[same report for March 12]

Randy Dunlap wrote:
> Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20090310:
> 
> 
> Building on i386 generates a ton of printk format warnings:
> 
> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 5 has type 'unsigned int'
> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 6 has type 'unsigned int'
> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 9 has type 'unsigned int'
> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 10 has type 'unsigned int'
> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 13 has type 'unsigned int'
> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 14 has type 'unsigned int'
> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 17 has type 'unsigned int'
> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 18 has type 'unsigned int'
> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 21 has type 'unsigned int'
> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 22 has type 'unsigned int'
> 
> include/trace/sched_event_types.h:11: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:11: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:21: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:21: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:31: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:31: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:41: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:41: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:53: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:53: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:65: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:65: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:85: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:85: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:98: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:98: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:108: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:108: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:118: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:118: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:128: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:128: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/sched_event_types.h:140: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/sched_event_types.h:140: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> 
> include/trace/irq_event_types.h:11: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/irq_event_types.h:11: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> include/trace/irq_event_types.h:21: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> include/trace/irq_event_types.h:21: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> 
> kernel/trace/trace_event_types.h:8: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:8: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:16: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:16: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:25: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:25: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:34: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:34: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:47: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:47: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:60: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:60: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:75: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:75: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:90: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:90: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:105: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:105: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:114: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:114: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:124: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:124: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:132: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:132: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:142: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:142: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'
> kernel/trace/trace_event_types.h:156: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'unsigned int'
> kernel/trace/trace_event_types.h:156: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'


-- 
~Randy
