From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: linux-next: build warning after merge of the mmc-uh tree
Date: Tue, 7 Jun 2016 23:42:09 +0200
Message-ID: <CAPDyKFrfv-35p_7S4XvsmN2NNcw=GfHZCE9ojtXEfijy1eSi5A@mail.gmail.com>
References: <20160606113848.534cbdf7@canb.auug.org.au> <374e7cf7-fd34-45a7-db34-0d9337833fac@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:38878 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932326AbcFGVmM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2016 17:42:12 -0400
Received: by mail-wm0-f53.google.com with SMTP id m124so131907128wme.1
        for <linux-next@vger.kernel.org>; Tue, 07 Jun 2016 14:42:11 -0700 (PDT)
In-Reply-To: <374e7cf7-fd34-45a7-db34-0d9337833fac@rock-chips.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 6 June 2016 at 03:51, Shawn Lin <shawn.lin@rock-chips.com> wrote:
> Hi Stephen,
>
> On 2016/6/6 9:38, Stephen Rothwell wrote:
>>
>> Hi Ulf,
>>
>> After merging the mmc-uh tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> In file included from include/linux/err.h:4:0,
>>                  from drivers/mmc/core/mmc.c:13:
>> drivers/mmc/core/mmc.c: In function 'mmc_select_hs400es':
>> include/linux/err.h:21:49: warning: cast to pointer from integer of
>> different size [-Wint-to-pointer-cast]
>>  #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned
>> long)-MAX_ERRNO)
>>                                                  ^
>> include/linux/compiler.h:170:42: note: in definition of macro 'unlikely'
>>  # define unlikely(x) __builtin_expect(!!(x), 0)
>>                                           ^
>> drivers/mmc/core/mmc.c:1244:6: note: in expansion of macro 'IS_ERR_VALUE'
>>   if (IS_ERR_VALUE(err))
>>       ^
>
>
> Yup, sorry for this noise. Arnd had removed a lot of IS_ERR_VALUE
> abuses, but I forgot to amend this one.
>
>
> Hi Ulf,
>
> Should I come up with a new fix or you could manually amend it from
> "IS_ERR_VALUE(err)" to "err < 0"? :)
>
>>
>> Introduced by commit
>>
>>   8141f0ace818 ("mmc: core: implement enhanced strobe support")
>>
>> I think error values now must be "long".
>>


Thanks for reporting and fixing!

I have amended the commit above and published the change on my next branch.

Kind regards
Uffe
