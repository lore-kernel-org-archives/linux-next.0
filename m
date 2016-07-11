From: Doug Anderson <dianders@chromium.org>
Subject: Re: linux-next: manual merge of the pwm tree with the regulator tree
Date: Mon, 11 Jul 2016 09:47:34 -0700
Message-ID: <CAD=FV=UBidDK2XN=uchV=Rr9LtYQ7m6Y6uRxe8xKhFLva6f5+w@mail.gmail.com>
References: <20160711165648.029cb6f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160711165648.029cb6f7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-next.vger.kernel.org

Hi,

On Sun, Jul 10, 2016 at 11:56 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Thierry,
>
> Today's linux-next merge of the pwm tree got a conflict in:
>
>   drivers/regulator/pwm-regulator.c
>
> between commit:
>
>   830583004e61 ("regulator: pwm: Drop unneeded pwm_enable() call")
>   27bfa8893b15 ("regulator: pwm: Support for enable GPIO")
>   c2588393e631 ("regulator: pwm: Fix regulator ramp delay for continuous mode")
>
> from the regulator tree and commit:
>
>   b0303deaa480 ("regulator: pwm: Adjust PWM config at probe time")
>   8bd57ca236d0 ("regulator: pwm: Switch to the atomic PWM API")
>   25d16595935b ("regulator: pwm: Retrieve correct voltage")
>   53f239af4c14 ("regulator: pwm: Support extra continuous mode cases")
>
> from the pwm tree.
>
> I fixed it up (I think, please check - see below) and can carry the fix
> as necessary. This is now fixed as far as linux-next is concerned, but
> any non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell

[ cut ]

>  -      /* Delay required by PWM regulator to settle to the new voltage */
>  -      usleep_range(ramp_delay, ramp_delay + 1000);
>  +      /* Ramp delay is in uV/uS. Adjust to uS and delay */
>  +      ramp_delay = DIV_ROUND_UP(abs(min_uV - old_uV), ramp_delay);

This was what I was worried about and why I originally sent my patch
based upon Boris's series.  The above should be:

ramp_delay = DIV_ROUND_UP(abs(req_min_uV - old_uV), ramp_delay);

Specifically note the use of "req_min_uV" and not "min_uV".


-Doug
