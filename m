From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 6.2/7] MMC: mmci: Enable Device Tree support for ux500
Date: Tue, 8 May 2012 19:58:49 -0400
Message-ID: <CAP=VYLoz0o7qh9TNgWPatAsSjtoKoyaBUW7L+3q1w0PsLkOMOQ@mail.gmail.com>
References: <1334325909-5779-1-git-send-email-lee.jones@linaro.org>
 <1334325909-5779-7-git-send-email-lee.jones@linaro.org> <CACRpkdYyP=V=aXtDuo_W4oDxH0UkQKq1x1HKG_z=zWHoWng6JQ@mail.gmail.com>
 <4F8BE5B0.4000900@linaro.org> <20120425185747.GC24211@n2100.arm.linux.org.uk>
 <4FA29E46.6040204@linaro.org> <20120503151253.GE897@n2100.arm.linux.org.uk>
 <4FA2A4A8.9010208@linaro.org> <20120503163008.GF897@n2100.arm.linux.org.uk>
 <4FA2B4A3.2040402@linaro.org> <20120503164501.GG897@n2100.arm.linux.org.uk>
 <8762cdur7o.fsf@laptop.org> <4FA3D720.7010004@linaro.org> <87mx5ot6vp.fsf@laptop.org>
 <4FA3DC27.6030204@linaro.org> <CAP=VYLoLgLmwWTWrJrMBCRLD_BjupjmfV2me6TDeej=ZS=W7hw@mail.gmail.com>
 <4FA90127.1050107@linaro.org> <878vh2rhlh.fsf@laptop.org> <4FA918BA.3080303@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:41678 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751241Ab2EHX7V convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 May 2012 19:59:21 -0400
Received: by lahd3 with SMTP id d3so1488405lah.19
        for <linux-next@vger.kernel.org>; Tue, 08 May 2012 16:59:19 -0700 (PDT)
In-Reply-To: <4FA918BA.3080303@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Chris Ball <cjb@laptop.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linus.walleij@stericsson.com, arnd@arndb.de, Linus Walleij <linus.walleij@linaro.org>, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

On Tue, May 8, 2012 at 8:59 AM, Lee Jones <lee.jones@linaro.org> wrote:
> Here you go Chris.
>
> From: Lee Jones <lee.jones@linaro.org>
> Date: Tue, 8 May 2012 13:40:02 +0100
> Subject: [PATCH] MMC: mmci: Fix compiler error when CONFIG_OF is not =
set
>
> error: implicit declaration of function 'mmci_dt_populate_generic_pda=
ta'
>
> This is due to the '#if CONFIG_OF' guards placed around
> mmci_dt_populate_generic_pdata(), but not around the call to it. We
> repair this by inserting a stub which elegantly returns when CONFIG_O=
=46
> is not set.
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Please if possible, do not neglect to add the Reported-by: line when
appropriate.  I've been at this long enough that it really won't change
my life any if it is there or not there, but for someone new to linux, =
it
might make the difference between an "I'm glad I reported that" vs.
a "Screw them, I'm not reporting anything else in the future."

Thanks,
Paul.
--

> ---
> =A0drivers/mmc/host/mmci.c | =A0 =A06 ++++++
> =A01 file changed, 6 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 2303a16..efc822d 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1241,6 +1241,12 @@ static void mmci_dt_populate_generic_pdata(str=
uct device_node *np,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warn("%s: Unsupported bus width\n",=
 np->full_name);
> =A0 =A0 =A0 =A0}
> =A0}
> +#else
> +static void mmci_dt_populate_generic_pdata(struct device_node *np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct mmci_platform_data *pdata)
> +{
> + =A0 =A0 =A0 return;
> +}
> =A0#endif
>
> =A0static int __devinit mmci_probe(struct amba_device *dev,
> --
> 1.7.9.5
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
