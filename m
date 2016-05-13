From: Huacai Chen <chenhc@lemote.com>
Subject: Re: next: fuloong2e qemu boot failure due to 'MIPS: Loongson:
 AddLoongson-3A R2 basic support'
Date: Fri, 13 May 2016 13:49:58 +0800
Message-ID: <CAAhV-H6s4EmFOqrGFR2YSDV4nyPX_hZDzQ8kt6bYBqDMGNWDJw@mail.gmail.com>
References: <20160420025454.GA17200@roeck-us.net>
	<tencent_5BBD94596E55516D1B4FED5F@qq.com>
	<5717090E.2050004@roeck-us.net>
	<CAAhV-H6Br2r0yMX2+2gCqjY=+LxSh4Pf9pwvZhDu4MYx5b_jZQ@mail.gmail.com>
	<57354E33.8080905@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f194.google.com ([209.85.213.194]:34645 "EHLO
	mail-ig0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751044AbcEMFt7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 May 2016 01:49:59 -0400
In-Reply-To: <57354E33.8080905@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips <linux-mips@linux-mips.org>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

I'll send a patch, but it seems be ignored by maintainer.
https://patchwork.linux-mips.org/patch/13136/

Huacai

On Fri, May 13, 2016 at 11:46 AM, Guenter Roeck <linux@roeck-us.net> wr=
ote:
> On 04/19/2016 10:41 PM, Huacai Chen wrote:
>>
>> This is a kernel bug, I'll send a patch.
>>
>
> Did you ever send a patch to fix this problem ? It is still broken in
> next-20160512.
>
> Guenter
>
>
>> Huacai
>>
>> On Wed, Apr 20, 2016 at 12:43 PM, Guenter Roeck <linux@roeck-us.net>
>> wrote:
>>>
>>> On 04/19/2016 08:37 PM, =E9=99=88=E5=8D=8E=E6=89=8D wrote:
>>>>
>>>>
>>>> Hi,
>>>>
>>>> Could you please remove the line "#define cpu_hwrena_impl_bits
>>>> 0xc0000000" in
>>>> arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
>>>> and try again?Thanks.
>>>>
>>>
>>> That fixes the problem.
>>>
>>> Does this need to be addressed in qemu or in the Linux kernel ?
>>>
>>> Thanks,
>>> Guenter
>>>
>>>
>>>> Huacai
>>>>
>>>> ------------------ Original ------------------
>>>> From:  "Guenter Roeck"<linux@roeck-us.net>;
>>>> Date:  Wed, Apr 20, 2016 10:54 AM
>>>> To:  "Huacai Chen"<chenhc@lemote.com>;
>>>> Cc:  "Ralf Baechle"<ralf@linux-mips.org>;
>>>> "linux-mips"<linux-mips@linux-mips.org>;
>>>> "linux-next"<linux-next@vger.kernel.org>;
>>>> "linux-kernel"<linux-kernel@vger.kernel.org>;
>>>> Subject:  next: fuloong2e qemu boot failure due to 'MIPS: Loongson=
:
>>>> AddLoongson-3A R2 basic support'
>>>>
>>>> Hi,
>>>>
>>>> qemu fails to boot in -next for machine fulong2e with configuratio=
n
>>>> fuloong2e_defconfig. Bisect points to commit 'MIPS: Loongson: Add
>>>> Loongson-3A R2 basic support'. qemu hangs in boot, after displayin=
g
>>>> "Inode-cache hash table entries: 16384 (order: 3, 131072 bytes)".
>>>>
>>>> Bisect log is attached.
>>>>
>>>> Guenter
>>>>
>>>> ---
>>>> # bad: [1bd7a2081d2c7b096f75aa934658e404ccaba5fd] Add linux-next
>>>> specific
>>>> files for 20160418
>>>> # good: [bf16200689118d19de1b8d2a3c314fc21f5dc7bb] Linux 4.6-rc3
>>>> git bisect start 'HEAD' 'v4.6-rc3'
>>>> # bad: [493ac92ff65ec4c4cd4c43870e778760a012951d] Merge remote-tra=
cking
>>>> branch 'ipvs-next/master'
>>>> git bisect bad 493ac92ff65ec4c4cd4c43870e778760a012951d
>>>> # bad: [20ca3ae9c517eee9b2f1bd0fb2a06e2d14153792] Merge remote-tra=
cking
>>>> branch 'btrfs-kdave/for-next'
>>>> git bisect bad 20ca3ae9c517eee9b2f1bd0fb2a06e2d14153792
>>>> # good: [c454e65fb9ade11d0f84718d06a6888e2c92804d] Merge remote-tr=
acking
>>>> branch 'omap/for-next'
>>>> git bisect good c454e65fb9ade11d0f84718d06a6888e2c92804d
>>>> # good: [6f5c70fb9b4fc0534157bfa40cea9b402e6f2506] Merge remote-tr=
acking
>>>> branch 'microblaze/next'
>>>> git bisect good 6f5c70fb9b4fc0534157bfa40cea9b402e6f2506
>>>> # bad: [7f053cd68fd14243c8f202b4086d7dd75c409e6f] MIPS: Loongson-3=
:
>>>> Introduce CONFIG_LOONGSON3_ENHANCEMENT
>>>> git bisect bad 7f053cd68fd14243c8f202b4086d7dd75c409e6f
>>>> # good: [e9aacdd7f0b66c4ace17e5950c48e7cc61a253c8] MIPS: Allow RIX=
I to
>>>> be
>>>> used on non-R2 or R6 cores
>>>> git bisect good e9aacdd7f0b66c4ace17e5950c48e7cc61a253c8
>>>> # good: [d1e8b9a8dc6c7fa9add5dfa7083e035ce037e56d] MAINTAINERS: ad=
d
>>>> Loongson1 architecture entry
>>>> git bisect good d1e8b9a8dc6c7fa9add5dfa7083e035ce037e56d
>>>> # good: [13ff6275bb389c3669082d3ef8483592a31eb0ea] MIPS: Fix sigin=
fo.h
>>>> to
>>>> use strict posix types
>>>> git bisect good 13ff6275bb389c3669082d3ef8483592a31eb0ea
>>>> # good: [66e74bdd51e617023fa2e79a807b704fb3eed8aa] MIPS: Enable pt=
race
>>>> hw
>>>> watchpoints on MIPS R6
>>>> git bisect good 66e74bdd51e617023fa2e79a807b704fb3eed8aa
>>>> # good: [f7cabc2dac8adf5986dbc700584bc3b8fe493d4d] MIPS: Loongson-=
3:
>>>> Adjust irq dispatch to speedup processing
>>>> git bisect good f7cabc2dac8adf5986dbc700584bc3b8fe493d4d
>>>> # bad: [4978c8477e96fb9e9d870d8f42328dcabf1a65e9] MIPS: Loongson-3=
: Set
>>>> cache flush handlers to cache_noop
>>>> git bisect bad 4978c8477e96fb9e9d870d8f42328dcabf1a65e9
>>>> # bad: [04a35922c1dac1b4864b8b366a37474e9e51d8c0] MIPS: Loongson: =
Add
>>>> Loongson-3A R2 basic support
>>>> git bisect bad 04a35922c1dac1b4864b8b366a37474e9e51d8c0
>>>> # first bad commit: [04a35922c1dac1b4864b8b366a37474e9e51d8c0] MIP=
S:
>>>> Loongson: Add Loongson-3A R2 basic support
>>>>
>>>
>>>
>>
>
>
