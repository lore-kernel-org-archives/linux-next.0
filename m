From: Qais Yousef <qsyousef@gmail.com>
Subject: Re: linux-next: Tree for Mar 14 (mips qemu failure bisected)
Date: Wed, 16 Mar 2016 20:27:54 +0000
Message-ID: <56E9C1CA.7050208@gmail.com>
References: <20160314174037.0097df55@canb.auug.org.au>
 <20160314143729.GA31845@roeck-us.net> <20160315052659.GA9320@roeck-us.net>
 <56E884BA.5050103@gmail.com> <20160316001713.GA4412@roeck-us.net>
 <20160316132210.GA21918@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160316132210.GA21918@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: linux-next.vger.kernel.org



On 16/03/2016 13:22, Guenter Roeck wrote:
> On Tue, Mar 15, 2016 at 05:17:13PM -0700, Guenter Roeck wrote:
>> On Tue, Mar 15, 2016 at 09:55:06PM +0000, Qais Yousef wrote:
>>> Hi Guenter,
>>>
> [ ... ]
>>>>> Qemu test results:
>>>>> 	total: 96 pass: 69 fail: 27
>>>>> Failed tests:
>>>> [ ... ]
>>>>> 	mips:mips_malta_smp_defconfig
>>>> I bisected this failure to commit bb11cff327e54 ("MIPS: Make smp CMP, CPS and MT
>>>> use the new generic IPI functions". Bisect log is attached.
>>> Thanks for bisecting this. I tested this on a real Malta system but not
>>> qemu. I'll try to reproduce.
>>>
>> I run the tests with only a single CPU core enabled. Maybe that causes
>> problems with your code ?
>>
> I ran another qemu test (this time on mainline) with "-smp 2", but the only
> difference is that the image now gets stuck even earlier.
>
> Also, I ran another set of bisects, this time with both mips and mips64
> on mainline (after your patch landed), with the same results.
>
> Guenter
>

OK thanks for the info. The offending commit just enables using quite a 
few of the newly added code before that. So the problem could be in any 
of the newly added code.

Unfortunately I can only look at this during my limited time in the 
evening and I have to setup my system to compile and run this, so I 
won't be able to get to the bottom of this as fast as I'd like to.

Qais
