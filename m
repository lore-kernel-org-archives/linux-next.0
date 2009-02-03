From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: next-20090202: task kmemleak:763 blocked for more than 120
	seconds.
Date: Tue, 3 Feb 2009 14:57:30 +0300
Message-ID: <a4423d670902030357k773e686dk5162b6c63a562e71@mail.gmail.com>
References: <a4423d670902020327x61a1d9dehb1642b25ec7f82f1@mail.gmail.com>
	 <tnxiqns28mm.fsf@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f21.google.com ([209.85.219.21]:50023 "EHLO
	mail-ew0-f21.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750845AbZBCL5c (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2009 06:57:32 -0500
In-Reply-To: <tnxiqns28mm.fsf@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2009/2/2 Catalin Marinas <catalin.marinas@arm.com>:
> Alexander Beregalov <a.beregalov@gmail.com> wrote:
>> It seems it is blocked forever.
>
> Scanning the full memory may take a lot of time, depending on the
> amount of RAM and the number of objects allocated. It is not unlikely
> to take more than 120 seconds on some loaded systems. However, it
> should call schedule() periodically to let other tasks run. Is your
> system unresponsive during this?
No, it is responsible.
kmemleak proccess is not running all the time, but it is counted for
the loadavg value.
And it produceses lockdep message every 180 sec.
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
>
