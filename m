From: Rob Lee <rob.lee@linaro.org>
Subject: Re: linux-next: manual merge of the cpuidle-cons tree with the tip tree
Date: Mon, 12 Mar 2012 12:06:36 -0500
Message-ID: <CAMXH7KHdfzjZCsBMkFOnwYtyaqBztMY99QcZ7VwLP0JASUiVAw@mail.gmail.com>
References: <20120309184041.bd10edffa51dcd43ce069487@canb.auug.org.au>
	<1331300109.1149.17.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:53180 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751872Ab2CLRGh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Mar 2012 13:06:37 -0400
Received: by ghrr11 with SMTP id r11so2784308ghr.19
        for <linux-next@vger.kernel.org>; Mon, 12 Mar 2012 10:06:36 -0700 (PDT)
In-Reply-To: <1331300109.1149.17.camel@fedora>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <srostedt@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

Steven and Stephen,

On Fri, Mar 9, 2012 at 7:35 AM, Steven Rostedt <srostedt@redhat.com> wr=
ote:
> On Fri, 2012-03-09 at 18:40 +1100, Stephen Rothwell wrote:
>> diff --cc drivers/cpuidle/cpuidle.c
>> index 6588f43,56de5f7..0000000
>> --- a/drivers/cpuidle/cpuidle.c
>> +++ b/drivers/cpuidle/cpuidle.c
>> @@@ -92,15 -109,13 +109,13 @@@ int cpuidle_idle_call(void
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> =A0 =A0 =A0 =A0 }
>>
>> - =A0 =A0 =A0 target_state =3D &drv->states[next_state];
>> -
>> =A0- =A0 =A0 =A0trace_power_start(POWER_CSTATE, next_state, dev->cpu=
);
>> =A0- =A0 =A0 =A0trace_cpu_idle(next_state, dev->cpu);
>> =A0+ =A0 =A0 =A0trace_power_start_rcuidle(POWER_CSTATE, next_state, =
dev->cpu);
>> =A0+ =A0 =A0 =A0trace_cpu_idle_rcuidle(next_state, dev->cpu);
>>
>> - =A0 =A0 =A0 entered_state =3D target_state->enter(dev, drv, next_s=
tate);
>> + =A0 =A0 =A0 entered_state =3D cpuidle_enter_ops(dev, drv, next_sta=
te);
>>
>> =A0- =A0 =A0 =A0trace_power_end(dev->cpu);
>> =A0- =A0 =A0 =A0trace_cpu_idle(PWR_EVENT_EXIT, dev->cpu);
>> =A0+ =A0 =A0 =A0trace_power_end_rcuidle(dev->cpu);
>> =A0+ =A0 =A0 =A0trace_cpu_idle_rcuidle(PWR_EVENT_EXIT, dev->cpu);
>>
>
> Looks good. My change was just a rename of trace_power_* and
> trace_cpu_*, and it looks like another change was the clean up of
> target_state. This is a trivial conflict, and there should be no
> surprises here.
>
> -- Steve
>

Looks good to me as well.

Who should carry this fixup?

Best Regards,
Rob

>
>
>> =A0 =A0 =A0 =A0 if (entered_state >=3D 0) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Update cpuidle counters */
>
