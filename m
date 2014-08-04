From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Mon, 4 Aug 2014 13:10:14 +0900
Message-ID: <CAAVeFuJmHX351WQpEo43sQUf+4BHk9QRJqZfJMsgWf8AXH=_8w@mail.gmail.com>
References: <20140729183153.0e77a6f6@canb.auug.org.au> <20140729084237.GE31360@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:50055 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751077AbaHDEKf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Aug 2014 00:10:35 -0400
In-Reply-To: <20140729084237.GE31360@ulmo.nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <treding@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

I have sent a patch to fix this. In the meantime, if the merge
conflict of the GPIO tree on board-paz00.c is solved by taking the
GPIO version, there is no build error.

There are a few important patches pending in the GPIO tree that should
undergo testing - Stephen, do you think you could resolve the conflict
that way to enable the latest GPIO tree to be tested again?

Thanks,
Alex.

On Tue, Jul 29, 2014 at 5:42 PM, Thierry Reding <treding@nvidia.com> wrote:
> On Tue, Jul 29, 2014 at 10:31:53AM +0200, Stephen Rothwell wrote:
>> * PGP Signed by an unknown key
>>
>> Hi Linus,
>>
>> After merging the gpio tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> In file included from arch/arm/mach-tegra/board-paz00.c:20:0:
>> include/linux/gpio/machine.h:24:2: error: unknown type name 'u16'
>>   u16 chip_hwnum;
>>   ^
>> include/linux/gpio/machine.h:31:19: error: field 'list' has incomplete type
>>   struct list_head list;
>>                    ^
>>
>> Caused by commit 0a6d315827ee ("gpio: split gpiod board registration
>> into machine header") or an interaction of that with commit
>> a0524acc94c9 ("ARM: tegra: Sort includes alphabetically") from the
>> arm-soc tree.
>>
>> linux/gpio/machine.h needs to include some of the same files that
>> linux/gpio/driver.h does.  See Rule 1 in Documentation/SubmitChecklist.
>>
>> I have used the version of the gpio tree from next-20140728 for today.
>
> I think linux/gpio/machine.h needs at least linux/types.h (for u16,
> though I guess that "dependency" could be removed by simply making
> gpiod_lookup.chip_hwnum an unsigned int) and linux/list.h for struct
> list_head.
>
> Thierry
