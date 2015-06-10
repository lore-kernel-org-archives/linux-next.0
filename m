From: Hanjun Guo <hanjun.guo@linaro.org>
Subject: Re: [Linaro-acpi] next-20150609 build: 2 failures 40 warnings (next-20150609)
Date: Wed, 10 Jun 2015 17:02:36 +0800
Message-ID: <5577FD2C.1070208@linaro.org>
References: <E1Z2Ny7-00019f-Dj@optimist>	<20150609182305.GW14071@sirena.org.uk>	<5577E860.1040605@linaro.org> <CAL4ahLdOSHXZ+O8Q1gsO9ON=cp+1wHC-Btp4XP-1UjpfM5jEcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:36669 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753352AbbFJJCo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2015 05:02:44 -0400
Received: by pdjm12 with SMTP id m12so33497464pdj.3
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2015 02:02:44 -0700 (PDT)
In-Reply-To: <CAL4ahLdOSHXZ+O8Q1gsO9ON=cp+1wHC-Btp4XP-1UjpfM5jEcw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Y Vo <yvo@apm.com>
Cc: Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linaro-acpi@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org

On 06/10/2015 04:43 PM, Y Vo wrote:
> On Wed, Jun 10, 2015 at 2:33 PM, Hanjun Guo <hanjun.guo@linaro.org> wrote:
>> On 06/10/2015 02:23 AM, Mark Brown wrote:
>>>
>>> On Tue, Jun 09, 2015 at 07:09:47PM +0100, Build bot for Mark Brown wrote:
>>>
>>>>          arm64-allmodconfig
>>>> ERROR: "acpi_gpiochip_request_interrupts" [drivers/gpio/gpio-xgene-sb.ko]
>>>> undefined!
>>>> ERROR: "acpi_gpiochip_free_interrupts" [drivers/gpio/gpio-xgene-sb.ko]
>>>> undefined!
>>>
>>>
>>> Today's -next fails to build an arm64 allmodconfig due to commit
>>> 733cf014f02040b3ad (gpio: xgene: add ACPI support for APM X-Gene GPIO
>>> standby driver) which adds ACPI support to the X-Gene standby driver
>>> without either adding a dependency on ACPI or there being stubs in the
>>> ACPI headers for the above functions in !ACPI configurations.  My
>>> instinct is that the stubs are going to be nicer since it'll save on
>>> ifdefs in drivers which seems nicer.
>>
>>
>> It seems that acpi_gpiochip_request_interrupts didn't export
>> so there will be a compile error when xgene-sb compiled as
>> a ko, I prepared a patch below:
>
> Coud you help to submit this patch ?

No problem, will do it right now.

Thanks
Hanjun
