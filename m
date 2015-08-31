From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Aug 31 (new arm, arm64, s390 failures)
Date: Mon, 31 Aug 2015 11:33:27 -0700
Message-ID: <55E49DF7.6010000@roeck-us.net>
References: <20150831195420.371e8849@canb.auug.org.au>	<20150831141736.GA19616@roeck-us.net>	<20150831163103.2e13b301@arm.com>	<55E476FB.2040208@roeck-us.net>	<20150831171807.27d78ff0@arm.com>	<55E4838B.5000500@roeck-us.net> <20150831180922.4392875e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34542 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753741AbbHaSdc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 14:33:32 -0400
In-Reply-To: <20150831180922.4392875e@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "pi-cheng.chen" <pi-cheng.chen@linaro.org>, Alexei Starovoitov <ast@plumgrid.com>

On 08/31/2015 10:09 AM, Marc Zyngier wrote:
> On Mon, 31 Aug 2015 09:40:43 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
>
>> Hi Marc,
>>
>> On 08/31/2015 09:18 AM, Marc Zyngier wrote:
>>> On Mon, 31 Aug 2015 08:47:07 -0700
>>> Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>>> Hi Marc,
>>>>
>>>> On 08/31/2015 08:31 AM, Marc Zyngier wrote:
>>>>> On Mon, 31 Aug 2015 07:17:36 -0700
>>>>> Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> Hi Guenter,
>>>>>
>>>>>> Qemu test results:
>>>>>> 	total: 85 pass: 74 fail: 11
>>>>>> Failed tests:
>>>>>> 	arm:vexpress-a9:arm_vexpress_defconfig:vexpress-v2p-ca9
>>>>>> 	arm:vexpress-a15:arm_vexpress_defconfig:vexpress-v2p-ca15-tc1
>>>>>> 	arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
>>>>>> 	arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
>>>>>> 	arm:realview-pb-a8:arm_realview_pb_defconfig
>>>>>> 	arm:realview-eb:arm_realview_eb_defconfig
>>>>>> 	mips:fuloong2e_defconfig
>>>>>> 	xtensa:dc232b:lx60:xtensa_defconfig
>>>>>> 	xtensa:dc232b:kc705:xtensa_defconfig
>>>>>> 	xtensa:dc233c:ml605:generic_kc705_defconfig
>>>>>> 	xtensa:dc233c:kc705:generic_kc705_defconfi
>>>>>>
>>>>>> Notable new failures (since next-20150828) are the s390 build failures,
>>>>>> the arm64 build failure, and the arm qemu test failures.
>>>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>>> The qemu arm tests all fail silently, meaning there is no console
>>>>>> output. Bisect points to 'irqchip/GIC: Convert to EOImode == 1'.
>>>>>> Bisect log attached.
>>>>>
>>>>> Could you give me a qemu command-line I can use to track this down?
>>>>> Real HW seems happy enough, from what I can see...
>>>>>
>>>>
>>>> That is what I was most concerned about :-(. Unfortunately, it
>>>> affects many of the most widely used arm qemu emulations, so it
>>>> would be very desirable to get this fixed, either in the kernel
>>>> or in qemu.
>>>>
>>>> See https://github.com/groeck/linux-build-test, specifically
>>>> https://github.com/groeck/linux-build-test/tree/master/rootfs/arm/.
>>>> run-qemu-arm.sh includes the various command lines and configurations.
>>>>
>>>> Note that some of the tests require a patched version of qemu.
>>>> The tests failing above should all work with the latest published
>>>> version of qemu (2.4), though.
>>>>
>>>> Please let me know if there is anything I can do to help tracking
>>>> this down.
>>>
>>> I give it a quick go with qemu 2.1.2 as installed on my laptop, and the
>>> results are interesting:
>>>
>>> - With -next as of today, qemu segfaults. Humpffff.
>>>
>>> - If I use my branch that contains the EOImode==1 patch, the system
>>>     boots normally.
>>>
>>> So there is an interaction between this patch and whatever is in -next
>>> at the moment, but that patch on its own is not what triggers the issue.
>>>
>> Looks like it.
>>
>> I did a couple of tests.
>> - Revert 'irqchip/GIC: Don't deactivate interrupts forwarded to a guest'.
>>     Same problem.
>> - Revert both 'irqchip/GIC: Don't deactivate interrupts forwarded to a guest'
>>     and 'irqchip/GIC: Convert to EOImode == 1'.
>>     Problem is no longer seen.
>
> This is getting even more weird. I've upgraded my qemu to 2.3 (the
> latest Debian seems to be carrying). I'm booting a A15-TC1 model with
> the following:
>
> emu-system-arm -machine vexpress-a15 -cpu cortex-a15 -m 512M
> -kernel arch/arm/boot/zImage -append "console=ttyAMA0 earlyprintk"
> -serial stdio -dtb arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dtb -display
> none
>

After building multi_v7_defconfig, this fails for me as well (qemu hang
without console output) with both qemu 2.2 and qemu 2.4. This is with
both your and my command line.

Yes, turns out there are more failures. The only problem fixed by reverting
your patches was arm:realview-pb-a8:qemu_arm_realview_pb_defconfig as well as
arm:realview-eb:qemu_arm_realview_eb_defconfig. All the vexpress tests still
fail.

Guenter
