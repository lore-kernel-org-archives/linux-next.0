From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 14 (mips qemu failure bisected)
Date: Wed, 16 Mar 2016 19:10:04 -0700
Message-ID: <56EA11FC.9000304@roeck-us.net>
References: <20160314174037.0097df55@canb.auug.org.au>
 <20160314143729.GA31845@roeck-us.net> <20160315052659.GA9320@roeck-us.net>
 <56E884BA.5050103@gmail.com> <20160316001713.GA4412@roeck-us.net>
 <20160316132210.GA21918@roeck-us.net> <56E9C1CA.7050208@gmail.com>
 <56E9DB85.9090405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from forward.webhostbox.net ([5.100.155.97]:37237 "EHLO
	forward.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752508AbcCQCKL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Mar 2016 22:10:11 -0400
In-Reply-To: <56E9DB85.9090405@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Qais Yousef <qsyousef@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org

On 03/16/2016 03:17 PM, Qais Yousef wrote:
> On 16/03/2016 20:27, Qais Yousef wrote:
>>
>>
>> On 16/03/2016 13:22, Guenter Roeck wrote:
>>> On Tue, Mar 15, 2016 at 05:17:13PM -0700, Guenter Roeck wrote:
>>>> On Tue, Mar 15, 2016 at 09:55:06PM +0000, Qais Yousef wrote:
>>>>> Hi Guenter,
>>>>>
>>> [ ... ]
>>>>>>> Qemu test results:
>>>>>>>     total: 96 pass: 69 fail: 27
>>>>>>> Failed tests:
>>>>>> [ ... ]
>>>>>>>     mips:mips_malta_smp_defconfig
>>>>>> I bisected this failure to commit bb11cff327e54 ("MIPS: Make smp CMP, CPS and MT
>>>>>> use the new generic IPI functions". Bisect log is attached.
>>>>> Thanks for bisecting this. I tested this on a real Malta system but not
>>>>> qemu. I'll try to reproduce.
>>>>>
>>>> I run the tests with only a single CPU core enabled. Maybe that causes
>>>> problems with your code ?
>>>>
>>> I ran another qemu test (this time on mainline) with "-smp 2", but the only
>>> difference is that the image now gets stuck even earlier.
>>>
>>> Also, I ran another set of bisects, this time with both mips and mips64
>>> on mainline (after your patch landed), with the same results.
>>>
>>> Guenter
>>>
>>
>> OK thanks for the info. The offending commit just enables using quite a few of the newly added code before that. So the problem could be in any of the newly added code.
>>
>> Unfortunately I can only look at this during my limited time in the evening and I have to setup my system to compile and run this, so I won't be able to get to the bottom of this as fast as I'd like to.
>>
>> Qais
>
> OK I was up and running faster than I thought I would be. Can you confirm that you're hitting a BUG_ON() in mips_smp_ipi_init()?
>

Most likely, but mips is one of the qemu emulations which simply hang if there is a crash,
without a log message, and I have not been able to figure out a command line that gives me
the actual crash log.

> What I see is that BUG_ON() is hit because we couldn't find an ipidomain to allocate the ipis from. The reason of whih is that the qemu malta machine doesn't have a GIC though the config is compiled with GIC on. Also if I remember correctly qemu malta doesn't really support SMP. I think that was the reason I never ran this on qemu.
>
Idea is to run the SMP build, not really a multi-core machine.

> I'm not sure what's the best way forward here. I can add a check to verify gic_present inside this function and return early. Patch attached.
>

With your patch I get

WARNING: CPU: 0 PID: 1 at arch/mips/kernel/smp.c:251 mips_smp_ipi_init+0x3c/0x1b0()

and the boot continues.

If Ralf accepts it, feel free to add

Tested-by: Guenter Roeck <linux@roeck-us.net>

though I'll probably adjust my configuration to drop GIC from it (if that is possible).

Thanks a lot for looking into this!

Guenter
