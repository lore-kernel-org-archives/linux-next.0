From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: linux-next: manual merge of the mmc-uh tree with the sunxi tree
Date: Wed, 21 Jan 2015 12:27:09 +0100
Message-ID: <CAPDyKFq4TyiadznYCM-dGmeu799vWevBt1XVZ4DALhv-3bP=AA@mail.gmail.com>
References: <20150120141750.3dcade27@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:61667 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871AbbAUL1K (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Jan 2015 06:27:10 -0500
Received: by mail-qa0-f46.google.com with SMTP id j7so32237084qaq.5
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2015 03:27:09 -0800 (PST)
In-Reply-To: <20150120141750.3dcade27@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?David_Lanzend=C3=B6rfer?= <david.lanzendoerfer@o2s.ch>

On 20 January 2015 at 04:17, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Ulf,
>
> Today's linux-next merge of the mmc-uh tree got a conflict in
> drivers/mmc/host/sunxi-mmc.c between commit 6c09bb851e57 ("mmc: sunxi:
> Convert MMC driver to the standard clock phase API") from the sunxi
> tree and commit 776e24c502da ("mmc: sunxi: Removing unused code") from
> the mmc-uh tree.
>
> I fixed it up (the former includes the latter change) and can carry the
> fix as necessary (no action is required).

Maxime,

I can't find the sunxi tree, is it listed in MAINTAINERS?

I know I have acked below patch, but that was quite a I while ago. Is
there any reason to why I can't take it through my mmc tree at this
point?
"mmc: sunxi: Convert MMC driver to the standard clock phase API".

Kind regards
Uffe

>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
