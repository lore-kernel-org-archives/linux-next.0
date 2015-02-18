From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 17 (mips build failures)
Date: Wed, 18 Feb 2015 05:54:57 -0800
Message-ID: <54E499B1.7060303@roeck-us.net>
References: <20150217160221.1a15340e@canb.auug.org.au> <20150217172036.GA29820@roeck-us.net> <20150218073740.71da0354@canb.auug.org.au> <20150218091436.GA14404@mchandras-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150218091436.GA14404@mchandras-linux.le.imgtec.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Markos Chandras <markos.chandras@imgtec.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
List-Id: linux-next.vger.kernel.org

On 02/18/2015 01:14 AM, Markos Chandras wrote:
> On Wed, Feb 18, 2015 at 07:37:40AM +1100, Stephen Rothwell wrote:
>> Hi Guenter,
>>
>> [Add Ralf to cc]
>>
>> On Tue, 17 Feb 2015 09:20:36 -0800 Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> Build results:
>>> 	total: 121 pass: 109 fail: 12
>>> Failed builds:
>>> 	mips:defconfig
>>> 	mips:allmodconfig
>>> 	mips:bcm47xx_defconfig
>>> 	mips:bcm63xx_defconfig
>>> 	mips:nlm_xlp_defconfig
>>> 	mips:ath79_defconfig
>>> 	mips:ar7_defconfig
>>> 	mips:fuloong2e_defconfig
>>> 	mips:e55_defconfig
>>> 	mips:cavium_octeon_defconfig
>>> 	mips:malta_defconfig
>>> 	sparc64:allmodconfig
>>>
>>> mips builds are all failing with
>>>
>>> Building mips:defconfig ... failed
>>> --------------
>>> Error log:
>>> arch/mips/kernel/genex.S: Assembler messages:
>>> arch/mips/kernel/genex.S:128: Error: Bad value (mips64r6) for internal use
>>> arch/mips/kernel/genex.S:128: Error: unknown ISA level 64r6
>>>
>>> This was introduced by commit 0bf705e94771800 ("MIPS: kernel: genex: Set
>>> correct ISA level") which apparently assumes that only mips64r6 is a valid
>>> ISA level, though it is obviously not supported on older compilers. This
>>> is on top of the other mips r6 related build errors seen yesterday.
>>>
>>> I really hope that this is not 3.20 material, given the lack of testing
>>> with architectures other than mips r6 or with older compilers.
>>
>> --
>> Cheers,
>> Stephen Rothwell                    sfr@canb.auug.org.au
>
> This is just a typo I introduced yesterday by mistake. This has been fixed in
> the meantime but it did not make it in today's linux-next.
>
Yes, but it is not the only r6 related bug. Did you fix all the others as well ?

Guenter
