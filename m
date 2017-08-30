From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
Date: Wed, 30 Aug 2017 09:21:47 -0700
Message-ID: <CAOesGMg130BvqS1vGid9jm-G7-Gub+7bOQFKtaSg4qPTvosxcA@mail.gmail.com>
References: <20170830230712.55db7911@canb.auug.org.au> <20170830131930.bvu6furm7dlhes3i@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:38808 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751415AbdH3QVv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Aug 2017 12:21:51 -0400
Received: by mail-lf0-f68.google.com with SMTP id z12so2737658lfd.5
        for <linux-next@vger.kernel.org>; Wed, 30 Aug 2017 09:21:50 -0700 (PDT)
In-Reply-To: <20170830131930.bvu6furm7dlhes3i@piout.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Rezvanov <dmitry.rezvanov@yandex.ru>

On Wed, Aug 30, 2017 at 6:19 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> On 30/08/2017 at 23:07:12 +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Commit
>>
>>   1a9f9af07e80 ("ARM: dts: at91: at91sam9g45: add AC97")
>>
>> is missing a Signed-off-by from its author.
>>
>
> Oh crap, it was the only one not in linux-next... iThe original
> submission had the SoB:
> https://patchwork.kernel.org/patch/9794803/
>
> Olof, how do you want to proceed?

Please prepare a new branch. I'll rebuild next/dt (and our for-next)
to drop your previous version, and merge it when it's ready.

Thanks for the heads up, Stephen. I presume you have a script that
checks this? It's something we should run too, do you keep it in a
shared location?


-Olof
