From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Aug 31 (new arm, arm64, s390 failures)
Date: Mon, 31 Aug 2015 08:47:07 -0700
Message-ID: <55E476FB.2040208@roeck-us.net>
References: <20150831195420.371e8849@canb.auug.org.au>	<20150831141736.GA19616@roeck-us.net> <20150831163103.2e13b301@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59520 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752968AbbHaPrK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 11:47:10 -0400
In-Reply-To: <20150831163103.2e13b301@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "pi-cheng.chen" <pi-cheng.chen@linaro.org>, Alexei Starovoitov <ast@plumgrid.com>

Hi Marc,

On 08/31/2015 08:31 AM, Marc Zyngier wrote:
> On Mon, 31 Aug 2015 07:17:36 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi Guenter,
>
>> Qemu test results:
>> 	total: 85 pass: 74 fail: 11
>> Failed tests:
>> 	arm:vexpress-a9:arm_vexpress_defconfig:vexpress-v2p-ca9
>> 	arm:vexpress-a15:arm_vexpress_defconfig:vexpress-v2p-ca15-tc1
>> 	arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
>> 	arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
>> 	arm:realview-pb-a8:arm_realview_pb_defconfig
>> 	arm:realview-eb:arm_realview_eb_defconfig
>> 	mips:fuloong2e_defconfig
>> 	xtensa:dc232b:lx60:xtensa_defconfig
>> 	xtensa:dc232b:kc705:xtensa_defconfig
>> 	xtensa:dc233c:ml605:generic_kc705_defconfig
>> 	xtensa:dc233c:kc705:generic_kc705_defconfi
>>
>> Notable new failures (since next-20150828) are the s390 build failures,
>> the arm64 build failure, and the arm qemu test failures.
>>
>
> [...]
>
>> The qemu arm tests all fail silently, meaning there is no console
>> output. Bisect points to 'irqchip/GIC: Convert to EOImode == 1'.
>> Bisect log attached.
>
> Could you give me a qemu command-line I can use to track this down?
> Real HW seems happy enough, from what I can see...
>

That is what I was most concerned about :-(. Unfortunately, it
affects many of the most widely used arm qemu emulations, so it
would be very desirable to get this fixed, either in the kernel
or in qemu.

See https://github.com/groeck/linux-build-test, specifically
https://github.com/groeck/linux-build-test/tree/master/rootfs/arm/.
run-qemu-arm.sh includes the various command lines and configurations.

Note that some of the tests require a patched version of qemu.
The tests failing above should all work with the latest published
version of qemu (2.4), though.

Please let me know if there is anything I can do to help tracking
this down.

Thanks,
Guenter
