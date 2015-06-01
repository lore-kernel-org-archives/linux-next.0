From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree with
 the wireless-drivers tree
Date: Mon, 1 Jun 2015 11:15:45 +0200
Message-ID: <CAMuHMdXUeqnq1_bSSr_GnwvO1iNM2ceKp5BhME6LA3Wvt3-tgQ@mail.gmail.com>
References: <20150525130747.12747385@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:32813 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751911AbbFAJPq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2015 05:15:46 -0400
In-Reply-To: <20150525130747.12747385@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kalle Valo <kvalo@codeaurora.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>

On Mon, May 25, 2015 at 5:07 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the wireless-drivers-next tree got a
> conflict in drivers/net/wireless/iwlwifi/Kconfig between commit
> ed65918735a5 ("iwlwifi: 7000: modify the firmware name for 3165") from
> the wireless-drivers tree and commit 87411456834a ("iwlwifi: clarify
> the device / firmware mapping in Kconfig") from the
> wireless-drivers-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc drivers/net/wireless/iwlwifi/Kconfig
> index f89f446e5c8a,99f9760fc11e..000000000000
> --- a/drivers/net/wireless/iwlwifi/Kconfig
> +++ b/drivers/net/wireless/iwlwifi/Kconfig
> @@@ -21,7 -21,7 +21,8 @@@ config IWLWIF
>                 Intel 7260 Wi-Fi Adapter
>                 Intel 3160 Wi-Fi Adapter
>                 Intel 7265 Wi-Fi Adapter
>  +              Intel 3165 Wi-Fi Adapter
> +               Intel 8260 Wi-Fi Adapter

Sorting would be nice...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
