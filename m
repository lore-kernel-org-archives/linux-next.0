From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Subject: Re: Re: livepatching tree for linux-next
Date: Mon, 12 Jan 2015 21:45:17 +0900
Message-ID: <54B3C1DD.6090400@hitachi.com>
References: <alpine.LNX.2.00.1412221412360.1680@pobox.suse.cz> <20141223094607.GA16445@infradead.org> <20141223151056.GA4789@treble.redhat.com> <20141226155613.36dd95b9@canb.auug.org.au> <20150107144317.61ab2080877a4d8227990551@linux-foundation.org> <alpine.LNX.2.00.1501072346400.15299@pobox.suse.cz> <20150107153006.60ed354e3458f402e6819b9e@linux-foundation.org> <alpine.LNX.2.00.1501080037030.15299@pobox.suse.cz> <20150107155701.4839545f63701412003edd88@linux-foundation.org> <alpine.LNX.2.00.1501080104190.15299@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1501080104190.15299@pobox.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Josh Poimboeuf <jpoimboe@redhat.com>, Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

(2015/01/08 9:11), Jiri Kosina wrote:
> On Wed, 7 Jan 2015, Andrew Morton wrote:
> 
>>> --- a/kernel/livepatch/core.c
>>> +++ b/kernel/livepatch/core.c
>>> @@ -911,6 +911,12 @@ static int klp_init(void)
>>>  {
>>>  	int ret;
>>>  
>>> +	ret = klp_check_compiler_support();
>>> +	if (ret) {
>>> +		pr_info("Your compiler is too old; turning off.\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>
>> Looks reasonable.  
> 
> Thanks. Can I treat this as your Reported-and-tested-by .. ?
> 
>> It's a shame we've never figured out a way to do this at Kconfig-time.
> 
> That's something that has been on my TODO list for very long time (this is 
> not the first time I've been biten by that), but unfortunately rather low. 
> I will talk to Michal Marek to see whether he doesn't have any idea how to 
> implement this in an elegant way ... but let's keep that separate from 
> this thread.
> 
> In any case, Masami, I really think you would like to do something like 
> that for IPMODIFY as well ... or are you deliberately defering the 
> responsibility to handle the possible mcount fallout to the ftrace_ops 
> owner?

Ah, good point. I just tried to use ftrace and WARN if not possible
to use it. I'll see it tomorrow. Anyway, I'd prefer to have this
kind of checking functionality in ftrace.

Thank you,

>> That second #error doing in livepatch.h is a bit odd.  It errors out if 
>> anyone includes livepatch.h when CONFIG_LIVE_PATCHING=n.  Methinks it 
>> would be saner to change it to
>>
>> #error include linux/livepatch.h, not asm/livepatch.h
> 
> I guess that's a nice cleanup. Noted, thanks.
> 


-- 
Masami HIRAMATSU
Software Platform Research Dept. Linux Technology Research Center
Hitachi, Ltd., Yokohama Research Laboratory
E-mail: masami.hiramatsu.pt@hitachi.com
