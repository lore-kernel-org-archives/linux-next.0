From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: linux-next: build failure after merge of the mmc-uh tree
Date: Mon, 4 Aug 2014 15:44:48 +0200
Message-ID: <CAPDyKFq2isO+DKMuLT9Ud8B9reFZiVYKG6LL8ysF0ZTNGfY8Nw@mail.gmail.com>
References: <20140728144608.7d9ac736@canb.auug.org.au>
	<CAPz6YkWO=cJSrPk2+Xy_Euxv9tMt6EHc-k+NTNAoPmVvxCE4-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:42326 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752033AbaHDNou (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Aug 2014 09:44:50 -0400
Received: by mail-lb0-f176.google.com with SMTP id u10so5282233lbd.7
        for <linux-next@vger.kernel.org>; Mon, 04 Aug 2014 06:44:48 -0700 (PDT)
In-Reply-To: <CAPz6YkWO=cJSrPk2+Xy_Euxv9tMt6EHc-k+NTNAoPmVvxCE4-A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sonny Rao <sonnyrao@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 28 July 2014 19:58, Sonny Rao <sonnyrao@chromium.org> wrote:
> On Sun, Jul 27, 2014 at 9:46 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Ulf,
>>
>> After merging the mmc-uh tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> drivers/mmc/host/dw_mmc.c: In function 'dw_mci_reset':
>> drivers/mmc/host/dw_mmc.c:2262:3: error: implicit declaration of function 'dw_mci_idmac_reset' [-Werror=implicit-function-declaration]
>>    dw_mci_idmac_reset(host);
>>    ^
>
> Hi, sorry about that.  It looks like it fails to build when
> CONFIG_MMC_DW_IDMAC is not set.
> I changed that bit of code from using #ifdef to using just C if
> statement, but I think in this case the function being called doesn't
> exist when CONFIG_MMC_DW_IDMAC is not set, so that was incorrect and
> we should go back to using something like:
>
> #if IS_ENABLED(CONFIG_MMC_DW_IDMAC)
>         /* It is also recommended that we reset and reprogram idmac */
>         dw_mci_idmac_reset(host);
> #endif
>
>
> Ulf, I can respin the patch if you'd like or feel free to fix it
> yourself too.  Thanks.

I haven't got the time to fix this yet, sorry.

It would simplify a bit if you respin the patch, so please do so.

Kind regards
Uffe

>
>
>>
>> Caused by commit 25f7dadbd982 ("mmc: dw_mmc: change to use recommended
>> reset procedure").
>>
>> I have used the mmc-uh tree from next-20140725 for today.
>> --
>> Cheers,
>> Stephen Rothwell                    sfr@canb.auug.org.au
