From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build warnings after merge of the final tree
Date: Wed, 14 Dec 2011 08:47:01 -0800
Message-ID: <4EE8D305.8020407@zytor.com>
References: <20111214181545.6e13bc954cb7ddce9086e861@canb.auug.org.au> <1323880322.23971.33.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:59840 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756194Ab1LNQrn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Dec 2011 11:47:43 -0500
In-Reply-To: <1323880322.23971.33.camel@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On 12/14/2011 08:32 AM, Steven Rostedt wrote:
> On Wed, 2011-12-14 at 18:15 +1100, Stephen Rothwell wrote:
> 
>> Maybe caused by commit d5e553d6e0a4 ("trace: Include <asm/asm-offsets.h>
>> in trace_syscalls.c") from the tip tree.  These warnings may have been
>> here for a while as it is hard to catch the new ones among the flood.
>>
> 
> hpa,
> 
> Was this change only needed for x86? If so, could you put that into
> asm/ftrace.h instead?
> 

Yes (on both accounts).  It was part of the syscall changes; I'll move
the include.

	-hpa


-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
