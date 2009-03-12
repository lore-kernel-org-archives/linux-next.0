From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 11 (tracing)
Date: Thu, 12 Mar 2009 09:32:28 -0700
Message-ID: <49B9391C.8020101@oracle.com>
References: <20090311225913.51589223.sfr@canb.auug.org.au>	 <49B7F691.5000305@oracle.com>  <49B93584.3020302@oracle.com> <1236875181.11290.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756931AbZCLQb0@vger.kernel.org>
In-Reply-To: <1236875181.11290.1.camel@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <srostedt@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

Steven Rostedt wrote:
> On Thu, 2009-03-12 at 09:17 -0700, Randy Dunlap wrote:
>> [adding cc:s]
>>
>> [same report for March 12]
>>
>> Randy Dunlap wrote:
>>> Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20090310:
>>>
>>> Building on i386 generates a ton of printk format warnings:
>>>
>>> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 5 has type 'unsigned int'
>>> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 6 has type 'unsigned int'
>>> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 9 has type 'unsigned int'
>>> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 10 has type 'unsigned int'
>>> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 13 has type 'unsigned int'
>>> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 14 has type 'unsigned int'
>>> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 17 has type 'unsigned int'
>>> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 18 has type 'unsigned int'
>>> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 21 has type 'unsigned int'
>>> kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 22 has type 'unsigned int'
>>>
> 
> I believe this is corrected in Ingo's tip tree. I changed %lu to %zu to
> handle the "sizeof()" case. The fix was suggested by Andrew Morton.

OK, thanks for the info.

-- 
~Randy
