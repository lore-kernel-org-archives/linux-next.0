From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] DMA: PL330: Fix build error (on linux-next-20120924)
Date: Tue, 25 Sep 2012 09:55:12 +0530
Message-ID: <CAK9yfHzCCXm4+pWX+Eiv+VGEeZrkSSzshF_LQbsREkK3SbP02g@mail.gmail.com>
References: <1348546800-15857-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:34003 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751024Ab2IYEZN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Sep 2012 00:25:13 -0400
Received: by vcbfo13 with SMTP id fo13so7167862vcb.19
        for <linux-next@vger.kernel.org>; Mon, 24 Sep 2012 21:25:12 -0700 (PDT)
In-Reply-To: <1348546800-15857-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: sachin.kamat@linaro.org, patches@linaro.org, Inderpal Singh <inderpal.singh@linaro.org>, Vinod Koul <vinod.koul@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>

Compile tested using exynos4_defconfig.

On 25 September 2012 09:50, Sachin Kamat <sachin.kamat@linaro.org> wrot=
e:
> Auto resolution of merge conflict between commits 61c6e753 (DMA: PL33=
0:
> Check the pointer returned by kzalloc) from Linus tree and 7c71b8eb
> (DMA: PL330: Remove redundant runtime_suspend/resume functions) from =
slave-dma
> tree probably led to this build error.
>
> drivers/dma/pl330.c: In function =91pl330_probe=92:
> drivers/dma/pl330.c:2921:3: error: label =91probe_err5=92 used but no=
t defined
>
> Cc: Inderpal Singh <inderpal.singh@linaro.org>
> Cc: Vinod Koul <vinod.koul@linux.intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/dma/pl330.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index dcb88b0..13cc576 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -2918,7 +2918,7 @@ pl330_probe(struct amba_device *adev, const str=
uct amba_id *id)
>         if (!pdmac->peripherals) {
>                 ret =3D -ENOMEM;
>                 dev_err(&adev->dev, "unable to allocate pdmac->periph=
erals\n");
> -               goto probe_err5;
> +               goto probe_err4;
>         }
>
>         for (i =3D 0; i < num_chan; i++) {
> --
> 1.7.4.1
>



--=20
With warm regards,
Sachin
