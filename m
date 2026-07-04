Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3EF1A0B0E
	for <linux-next@vger.kernel.org>; Sat,  4 Jul 2026 10:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783160082; cv=none; b=QRJXmEFnPjbTAvThMVrZFT9PU0I2B/6Y2FzZxk0jr75VQN8Fwf/vLc0y8ONLfCu9cfE1IzqNkWC2EEieO5/4csv/2Gbv0yJqHpdVsPmhrJGWdaID+Wg+D3OCzwgHEfKU2vfOag+HJI4eZ4kpUwkZ96XAJBBhFdwMiUb53NRIiFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783160082; c=relaxed/simple;
	bh=wayv2zVPyGKzFq5Se71wyJieA1vVAuw5JTJiztM9Nr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pm7M1DcdeVjj3O6ZV/rsgDkqmYDdtBbVDdt1v4yLwbGwbM4yNR3wWM57shc6I45cQSWX0AiQbq5xNySRVMZS5ukmsO1sKXcMRSEFFZEnkSu1ul//+Npr10uoXjDxD7YThDuUCpxSqpXd5WYtb8ESFgpQ+vQqP8hTf4R5MAFalmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 664AEWZf050502;
	Sat, 4 Jul 2026 19:14:32 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 664AEWbi050498
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 4 Jul 2026 19:14:32 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
Date: Sat, 4 Jul 2026 19:14:32 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Policy regarding linux-next only changes
To: Boqun Feng <boqun@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, peterz@infradead.org,
        will@kernel.org, longman@redhat.com, mingo@kernel.org,
        gregkh@linuxfoundation.org
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <akZxfzEtam8yPXEh@MacBook-0RXW5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav104.rs.sakura.ne.jp

On 2026/07/02 23:11, Boqun Feng wrote:
>>> While testing lockdep changes on linux-next, I found there is a commit
>>> ca65ccfdc5b3 ("locking/lockdep: make lockdep_print_held_locks() always print if
>>> CONFIG_DEBUG_AID_FOR_SYZBOT=y") applied to lockdep. Checking the history it
>>> looks like this commit has been in linux-next for quite a while (at least 2
>>> months); there were no emails on LKML about this commit at all.
>>
>> Yes, these patches are for debugging difficult problems.
>>
>> For example, ca65ccfdc5b3 has been a concern for almost 8 years without progress
>> because developers show little interest for this change:
>>
>>   https://lkml.kernel.org/r/1535975097-19080-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp
>>   https://lkml.kernel.org/r/7e0d2bbf-71c2-395c-9a42-d3d6d3ee4fa4@i-love.sakura.ne.jp
>>
> 
> This email was from 6 years ago, if that's the latest version, I'm not
> so sure you could say "developers show little interest for this change".
> Maybe you could provide more context about this that I missed?

I don't remember whether some discussions are done somewhere else. But judging from
the fact that code remains unchanged, nobody else has attempted or succeeded to
make this change.

Peter Zijlstra has commented at
https://lkml.kernel.org/r/20200313083107.GV12561@hirez.programming.kicks-ass.net
that disabling

	if (p->state == TASK_RUNNING && p != current)
		return;

check increases UAF potential, and suggested a kernel command line parameter for
whether to disable this check.

At the same time, Peter has thought that the risk of UAF is quite low.
As far as I know, syzbot did not hit UAF caused by disabling this check
(commit ca65ccfdc5b3 ("locking/lockdep: make lockdep_print_held_locks()
always print if CONFIG_DEBUG_AID_FOR_SYZBOT=y"). So, I guess that we can add
a switch (I prefer a kernel config option over a kernel command line parameter)
for this change.

>                                                                Also Greg
> left a comment there, you neither replied nor send a version to resolve
> it. Again I'm not sure if that could count as "developers show little
> interest for this change".

Linus does not like use of kernel config options, but I don't like use of kernel
command line parameters
( https://lkml.kernel.org/r/3ee9c586-002b-f504-9e3b-5afa8929209b@i-love.sakura.ne.jp ).

(1) Adding one switch for one behavior (either a kernel config option or a kernel command
    line parameter) is an endless game of maintaining list of switches. Unless someone finds
    that a dedicated switch is useful for specific case, number of switches should remain
    minimized.

(2) Boot-time switches (i.e. kernel command line parameters) which are visible to
    userspace (e.g. /proc/cmdline, /proc/1/cmdline, sysfs and maybe more) are more
    difficult to maintain (i.e. follow the "never break the userspace" rule) than
    compile-time switches (i.e. kernel config options) because the kernel implementation
    might change in a way that makes boot-time switches unnecessary (e.g. switches that
    are intended for debugging will become unnecessary after some problem is fixed).

(3) Run-time switch increases size of executable files and cost for runtime evaluation.
    Also, assembly dump will include pointless code which is never executed due to run-time
    switch. Excluding should-not-be-executed-code from the beginning minimizes size and cost.

(4) Compile-time switch is easier to prove configurations than scanning very very long kernel
    command line which is likely already excluded from the console log of a crash report.

As a whole, I prefer compile-time and a global switch. If someone finds that run-time and/or
individual switch is more useful, we can change to run-time and/or individual switch as needed.
But no more response from Greg or Linus...



>>> I recognize that there is a need to add commits that serve as testing and
>>> debugging purpose to linux-next, but I think any of these changes should be
>>> temporary in nature and have acknowledgement from maintainers of touched code.
>>> Perhaps these changes should also be in a separate topic branch which gets
>>> pulled from linux-next temporarily.
>>
>> I'm happy if we can assign a git tree and a ML that are intended for temporary patches.
>> But please note that asking fuzzers to test a tree for hosting temporary patches is not
>> a choice. We need to test on massive instances to reproduce problems. linux.git is the
> 
> I don't understand why it's not an option, couldn't you just ask syzbot
> to apply the patches only for linux-next, or merge a tree but only for
> linux-next?

Basic constraint is
https://github.com/google/syzkaller/blob/master/docs/syzbot.md#no-custom-patches .

I don't know whether
https://groups.google.com/g/syzkaller/c/4Y3zvo_t_lI/m/z-4-79ZHBQAJ
could loosen this constraint to some degree.

>             The point is not just syzbot consumes linux-next, everyone
> does. Although I trust your good intents, but temporarily patches
> (especially when they are silently merged into linux-next) can undermine
> what linux-next is supposed to be.

I know that syzbot is not the only consumer of linux-next. Therefore, I try to minimize
users affected (e.g. guard changes by CONFIG_DEBUG_AID_FOR_SYZBOT=y or CONFIG_KCOV=y )
when making changes.

> 
> By "silently" I mean I didn't see you gave a heads-up about doing this
> either, e.g. an email saying "hey I'm including these into the
> linux-next". Maybe I'm missing something here?

I'm fine with announcing to ML that I am about to make debug/temporary changes.
But we might want a prefix for debug/temporary patches that are not intended for upstream?
Also, we might want a kernel config option (e.g. CONFIG_DEBUG_AID_FOR_SYZBOT) for
minimizing users affected?

