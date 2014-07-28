From: Sonny Rao <sonnyrao@chromium.org>
Subject: Re: linux-next: build failure after merge of the mmc-uh tree
Date: Mon, 28 Jul 2014 10:58:47 -0700
Message-ID: <CAPz6YkWO=cJSrPk2+Xy_Euxv9tMt6EHc-k+NTNAoPmVvxCE4-A@mail.gmail.com>
References: <20140728144608.7d9ac736@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:36681 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751625AbaG1R7J (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Jul 2014 13:59:09 -0400
Received: by mail-ie0-f176.google.com with SMTP id tr6so6808484ieb.7
        for <linux-next@vger.kernel.org>; Mon, 28 Jul 2014 10:59:08 -0700 (PDT)
In-Reply-To: <20140728144608.7d9ac736@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Jul 27, 2014 at 9:46 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Ulf,
>
> After merging the mmc-uh tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/mmc/host/dw_mmc.c: In function 'dw_mci_reset':
> drivers/mmc/host/dw_mmc.c:2262:3: error: implicit declaration of function 'dw_mci_idmac_reset' [-Werror=implicit-function-declaration]
>    dw_mci_idmac_reset(host);
>    ^

Hi, sorry about that.  It looks like it fails to build when
CONFIG_MMC_DW_IDMAC is not set.
I changed that bit of code from using #ifdef to using just C if
statement, but I think in this case the function being called doesn't
exist when CONFIG_MMC_DW_IDMAC is not set, so that was incorrect and
we should go back to using something like:

#if IS_ENABLED(CONFIG_MMC_DW_IDMAC)
        /* It is also recommended that we reset and reprogram idmac */
        dw_mci_idmac_reset(host);
#endif


Ulf, I can respin the patch if you'd like or feel free to fix it
yourself too.  Thanks.


>
> Caused by commit 25f7dadbd982 ("mmc: dw_mmc: change to use recommended
> reset procedure").
>
> I have used the mmc-uh tree from next-20140725 for today.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
