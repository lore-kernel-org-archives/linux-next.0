From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Subject: Re: linux-next: kernel/trace/trace.c:658: error:
Date: Thu, 23 Oct 2008 15:15:01 +0200
Message-ID: <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
	 <20081023121145.GB27984@x200.localdomain>
	 <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wx-out-0506.google.com ([66.249.82.228]:30227 "EHLO
	wx-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751118AbYJWNPD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 09:15:03 -0400
Received: by wx-out-0506.google.com with SMTP id h27so103107wxd.4
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 06:15:02 -0700 (PDT)
In-Reply-To: <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

2008/10/23 Fr=E9d=E9ric Weisbecker <fweisbec@gmail.com>:
> 2008/10/23 Alexey Dobriyan <adobriyan@gmail.com>:
>> On alpha-smp-n-debug-y:
>>
>> kernel/trace/trace.c: In function 'tracing_generic_entry_update':
>> kernel/trace/trace.c:658: error: implicit declaration of function 'i=
rqs_disabled_flags'
>> kernel/trace/trace.c: In function 'tracing_cpumask_write':
>> kernel/trace/trace.c:2145: error: implicit declaration of function '=
raw_local_irq_disable'
>> kernel/trace/trace.c:2162: error: implicit declaration of function '=
raw_local_irq_enable'
>> kernel/trace/trace.c: In function 'trace_die_handler':
>> kernel/trace/trace.c:3039: error: 'DIE_OOPS' undeclared (first use i=
n this function)
>>
>> This has something with config dependencies, because adding include =
doesn't fix it.
>>
>
> A lot of arch have an asm/irqflags.h but not alpha.
> In linux/irqflags, raw_local_irq_* functions are defined to be
> local_irq_* function if they don't support
> CONFIG_TRACE_IRQFLAGS_SUPPORT.
> It seems the error is here, alpha may turn this option off.
>

Hmm no actually your CONFIG_TRACE_IRFLAGS_SUPPORT is not set.
So that's because the linux/irqflags.h is not included in the
asm/system.h on alpha (other archs do).
