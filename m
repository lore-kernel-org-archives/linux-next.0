From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?= <fweisbec@gmail.com>
Subject: Re: next-20090202: task kmemleak:763 blocked for more than 120
	seconds.
Date: Mon, 2 Feb 2009 16:15:33 +0100
Message-ID: <c62985530902020715u73407d4dqe14c340de310c866@mail.gmail.com>
References: <a4423d670902020327x61a1d9dehb1642b25ec7f82f1@mail.gmail.com>
	 <tnxiqns28mm.fsf@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f20.google.com ([209.85.220.20]:32832 "EHLO
	mail-fx0-f20.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995AbZBBPPg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Feb 2009 10:15:36 -0500
In-Reply-To: <tnxiqns28mm.fsf@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mandeep Singh Baines <msb@google.com>

2009/2/2 Catalin Marinas <catalin.marinas@arm.com>:
> Alexander Beregalov <a.beregalov@gmail.com> wrote:
>> It seems it is blocked forever.
>
> Scanning the full memory may take a lot of time, depending on the
> amount of RAM and the number of objects allocated. It is not unlikely
> to take more than 120 seconds on some loaded systems. However, it
> should call schedule() periodically to let other tasks run. Is your
> system unresponsive during this?
>
>> [ 1704.619898] INFO: task kmemleak:763 blocked for more than 120 seconds.
>> [ 1704.697951] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
>> disables this message.
>> [ 1704.791613] kmemleak      D 0000000000000001  6008   763      2
> [...]
>> [ 1706.246334] no locks held by kmemleak/763.
>
> It looks like the kmemleak thread is in the TASK_UNINTERUPTIBLE state.
> This happens when it calls schedule_timeout_uninterruptible() to sleep
> between scans. It probably took more than 120 to scan the memory and
> hence the report.
>
> It doesn't look like a problem, only that the watchdog thread checks
> for uninterruptible tasks. I can try to make it sleep with
> TASK_INTERRUPTIBLE to avoid the message.
>
> Thanks.
>
> --
> Catalin
> --


Hi,

May be it would be better to make the softlockup detector hooking into
schedule_timeout()
(ie by using a tracepoint) to check if a thread chose to sleep more
than hung_task_timeout_secs
intentionally in a TASK_UNINTERRUPTIBLE state.

Fixing it into kmemleak would not solve the problem in other tasks
which do similar sleeps...

Mandeep, if you agree I can try something? Or perhaps you prefer to do
it yourself. As you wish.
