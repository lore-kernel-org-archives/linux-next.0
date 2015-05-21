From: Kukjin Kim <kgene@kernel.org>
Subject: Re: linux-next: manual merge of the samsung tree with the arm-soc
 andat91 trees
Date: Thu, 21 May 2015 12:29:03 +0900
Message-ID: <555D50FF.9060700@kernel.org>
References: <20150520102743.3d336a73@canb.auug.org.au> <CAJKOXPdsi-5kdQJtybeaMCy0DXuRTRGgBEOM=SH9BsjquEMjCQ@mail.gmail.com> <20150520091646.GF3338@piout.net> <CAMuHMdVoot1mBHUmGMuTzCkxzd7H5TJThrwmPvnedFAOAP49pw@mail.gmail.com> <CAJKOXPeQEvcUF1NcnSEAMGf5JE2ySftFtP9DHij6siDfzTjPtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33818 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751117AbbEUD3M (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 May 2015 23:29:12 -0400
In-Reply-To: <CAJKOXPeQEvcUF1NcnSEAMGf5JE2ySftFtP9DHij6siDfzTjPtA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kukjin Kim <kgene.kim@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux-Next <linux-next@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Baruch Siach <baruch@tkos.co.il>, Maxime Coquelin <maxime.coquelin@st.com>

On 05/21/15 10:20, Krzysztof Kozlowski wrote:
> 2015-05-20 18:47 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
>> On Wed, May 20, 2015 at 11:16 AM, Alexandre Belloni
>> <alexandre.belloni@free-electrons.com> wrote:
>>> On 20/05/2015 at 09:35:36 +0900, Krzysztof Kozlowski wrote :
>>>> 2015-05-20 9:27 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
>>>>> Today's linux-next merge of the samsung tree got a conflict in
>>>>> arch/arm/configs/multi_v7_defconfig between various commits from the
>>>>> arm-soc and at91 trees and various commits from the samsung tree.
>>>>>
>>>>> I fixed it up (see below) and can carry the fix as necessary (no action
>>>>> is required).
>>>>
>>>> Hi,
>>>>
>>>> Thanks for the merge.
>>>>
>>>> The parts coming from samsung-soc related to manually toggling stuff
>>>> (by me and Javier) look fine. The rest (coming from Kukjin's
>>>> savedefconfig) I don't know - too much of them.
>>>>
>>>
>>> Hum, last time I asked, we were not supposed to do a savedefconfig on
>>> multi_v7...
>>
>> Yeah, IMHO it's something the arm-soc maintainers should do only right
>> after rc1.
>>
>> Doing it at any other point in time may remove options that have just been
>> added to multi_v7_defconfig by an arm-soc submaintainer, and that depend on
>> a Kconfig change queued in another maintainer's for-next branch.
> 
> It also depends on which tree and branch the savedefconfig was
> performed. If on Linus' master then probably it is not a good idea at
> any time.
> 
>> Personally, I think no arm-soc submaintainer should touch multi_v7_defconfig,
>> and all changes should be applied by the arm-soc maintainers.
> 
> Actually Arnd suggested this:
> https://lkml.org/lkml/2015/5/15/303
> [PATCH 0/9] multi_v7_defconfig: Enable options for Exynos Chromebooks
> 
Thanks you guys.

I've sent a pull-request for the update of multi_v7_defconfig just now.
And IMHO need to keep it with savedefconfig from now on...

- Kukjin
