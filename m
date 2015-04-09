From: Rob Clark <robdclark@gmail.com>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Thu, 9 Apr 2015 11:00:44 -0400
Message-ID: <CAF6AEGtgyHYqmJPgzqSpDgFy1t447V1+0hfaYe1MFJCp-729Lw@mail.gmail.com>
References: <20150409143309.3a1fac67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f173.google.com ([209.85.216.173]:34201 "EHLO
	mail-qc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755799AbbDIPAp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2015 11:00:45 -0400
In-Reply-To: <20150409143309.3a1fac67@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hai Li <hali@codeaurora.org>, Dave Airlie <airlied@linux.ie>, Bjorn Andersson <bjorn.andersson@sonymobile.com>

On Thu, Apr 9, 2015 at 12:33 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the regulator tree, today's linux-next build (arm multi_v7_defconfig)
> failed like this:
>
> drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'dsi_host_regulator_disable':
> drivers/gpu/drm/msm/dsi/dsi_host.c:330:4: error: implicit declaration of function 'regulator_set_optimum_mode' [-Werror=implicit-function-declaration]
>     regulator_set_optimum_mode(s[i].consumer,
>     ^
>
> Caused by commit a689554ba6ed ("drm/msm: Initial add DSI connector
> support") from the drm tree interacting with commit ae6e808f1574
> ("regulator: Drop temporary regulator_set_optimum_mode wrapper") from
> the regulator tree.

Thanks.. btw, would it be possible to get my msm-next branch picked up
by linux-next?  That seems like it would help to catch these earlier..

 git://people.freedesktop.org/~robclark/linux msm-next

BR,
-R

> This happens every time someone renames/changes an API :-(
>
> I have applied the following merge fix patch.  Someone needs to make
> sure Linus finds out when the latter of these two trees is merged into
> his.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 9 Apr 2015 14:28:42 +1000
> Subject: [PATCH] drm/msm: fixes for regulator_set_optimum_mode name change
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index fdc54e3eff55..962cf545d24c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -327,8 +327,7 @@ static void dsi_host_regulator_disable(struct msm_dsi_host *msm_host)
>         DBG("");
>         for (i = num - 1; i >= 0; i--)
>                 if (regs[i].disable_load >= 0)
> -                       regulator_set_optimum_mode(s[i].consumer,
> -                                               regs[i].disable_load);
> +                       regulator_set_load(s[i].consumer, regs[i].disable_load);
>
>         regulator_bulk_disable(num, s);
>  }
> @@ -343,8 +342,8 @@ static int dsi_host_regulator_enable(struct msm_dsi_host *msm_host)
>         DBG("");
>         for (i = 0; i < num; i++) {
>                 if (regs[i].enable_load >= 0) {
> -                       ret = regulator_set_optimum_mode(s[i].consumer,
> -                                                       regs[i].enable_load);
> +                       ret = regulator_set_load(s[i].consumer,
> +                                               regs[i].enable_load);
>                         if (ret < 0) {
>                                 pr_err("regulator %d set op mode failed, %d\n",
>                                         i, ret);
> @@ -363,7 +362,7 @@ static int dsi_host_regulator_enable(struct msm_dsi_host *msm_host)
>
>  fail:
>         for (i--; i >= 0; i--)
> -               regulator_set_optimum_mode(s[i].consumer, regs[i].disable_load);
> +               regulator_set_load(s[i].consumer, regs[i].disable_load);
>         return ret;
>  }
>
> --
> 2.1.4
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
