Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53380329387
	for <linux-next@vger.kernel.org>; Tue, 10 Feb 2026 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730492; cv=pass; b=uKc2JpcbpVJiyHXqpgCYW2ykNkcaWqhz2a3ZWrMnY3euv6cpJdgl7j5zWy+omZvALsKXcDNy+RDU7K5gG3DlFOD6d6YR5y9JsczYncunC7lfBra4HHLV6sknZWte9Ji+xWXht1SHjFST8YUm9Fd9sq6EyypNWf12Yd9iUotDZos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730492; c=relaxed/simple;
	bh=AdpjSw7dNkdr+/tjYVp8tYBCboA8uj/PFr3NOiu6QnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ovu4U8v/RuKsFTg0xWd6XBAL+57HM17wTN4N98Jywz7yMjuheljQY3NAqOAhyIUNpZVpSsUkC4gHYoT/MxwqC3NkS/RyzgLqLQ1B86WeRWxWFQJsm8cH1km+tCa8IIERAtfH1mOQlX8U7q3g4MVIYww/6ODHDJCmzVmK8iXsJLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xClPmlTp; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xClPmlTp"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-649e97f1e1eso4580973d50.1
        for <linux-next@vger.kernel.org>; Tue, 10 Feb 2026 05:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770730489; cv=none;
        d=google.com; s=arc-20240605;
        b=ZygE+SP5C2+twEeobjN4Oon0OO76eOXuA0KRRNDtrkGTf0M8LPKb0//q2mcNBzmXEq
         ugw/HvhcIHx3gW38SRNA+1mPVCDxE9oNEoAXHs5UNsenulVwKiYRKnXDgNECH2tcSAmx
         oywmkx/Z9GhGdryXHsZQl82NslKmVZWG6M6uCYgWXA8+SkBgz2Ez/DRgqubzflCD2XUT
         QzqAj6vyxu5/hbEpiIIk8Uwp0M6j3zkJ+MFc2sVNUdSMQ3ElzSk7Q/LYsShgxEvNgo0C
         AgEDjGUBwchQmN5qNfiDuqyBRD7naAQmrit9emNgrkrUA7LN//+ZOYmPZAJF0N/5fmwt
         s8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Awy7xGMtWG+lB2DiLFib9mc4+as+WZ2R0n66soYWbRE=;
        fh=AiIXAsZYvAQTDOnXMFeimC+4x320cYq9BeRmD1ngSMo=;
        b=BTFlwBkdENO3LPuRPV515tRbWqxKJAXDIgFRQQSwdUjqrKmJ7CSbY/5mgnnDRXIxqW
         jADXy1l6/myvh601LCXyBuxcOlmRQqZRrsiLVnXZUHga2SdPsERp7Tri0EAUEJTHLae7
         P2B/RY1/ChleWp+NWCLk9F23Tt1Dcu60WZbvRs3RPPle5w0ZuUphl2bb/1u9d0XRse5O
         r2hvVf5WFr3nQew/ytQtgxkc8GFKrbsePVb8k+VhSQmYLnVgpwdItGIeMR/9E8xCyf1u
         OHYeGu5i4GXxfweT0SNNcnprxpQy2Yx8cWrYKfEiiD6xQMmPzygkF4oMahSPDlwt4Txr
         LEpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770730489; x=1771335289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awy7xGMtWG+lB2DiLFib9mc4+as+WZ2R0n66soYWbRE=;
        b=xClPmlTpW83778ogu7Eud87AdTFkK5Y4I3tN0m07H8z5/B5dd+cfmFGGyaSSVyrVDi
         tzg+ya1XVE4Pvenqpeg/8oeXjW7X4IyqTr/UKqJO0zse1lvk/OM/HkUfQTEvAaWjoaae
         /ADxiDrH0cDK6FYyrQ/AArhpdTpKVzCPthnM7YY65W8kmBgepquzR5y6cTi9XKq8HWQK
         qMxzVpOc9WQ5FuA0iQc9mGLTM/YW7S0220kmZPsRn4OcnIhyOAPmBX/KhBTlrW9IbUC+
         Dh0YgD4uc6qoNVG++fqfUW2VdaCIryq0Du5K5OqEuHGSWipPPRmcEie1wIhWOuAgLES5
         BraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730489; x=1771335289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Awy7xGMtWG+lB2DiLFib9mc4+as+WZ2R0n66soYWbRE=;
        b=Sph+fJd3Tu/cdpfrxdskqP4Q/V0f9XX+1jZBbUifdUE0fnIoCuoAC5sajzysVJKw6a
         14njiyevJHwk7tHv+6Q/RPMtf7elwifqbwc6hWVQnmSvTD5TYq11y2k4LY8Okp9cfa4D
         WPgXCtyECmQRr97A6AOJOroRareZRBsEaA+pr5L5bNmplX7O8y7J5n45hKBXt7zuYC6M
         AwIERi3L4Ar2BE2lo74ktrJfk7HE8jf323uBPo9h2j6f/ZOJHd4NWi0XbSAZzW4O1MdS
         nvJQx24wOVXYqRu95h5/9gZOtIo4KLd2BA+gIU+b384cKupY+f0flRU53cyb1boaktB4
         aIZg==
X-Forwarded-Encrypted: i=1; AJvYcCXDTvNNFckUHTKrzkLUDyygpLXPBA1MoPcDgdcTOT27zaJEkrqbjUiRwyPREHDNPgR7/7w0jEnTsUKn@vger.kernel.org
X-Gm-Message-State: AOJu0YzEl8F8Hv7xoi17ubusqtQcvdyF1sfHOGx17cEOR4G/BnSEv0M2
	E1snCLvm1UGhMP3xMBCwv1rLNaIGGNHH2ZoahNghbR07r3ZsoI2SS8uBnOwoiRr29tKg7jbPHj5
	05FiFCUkeWv0iedKB8980GCQeNeFneV/E/NsVeMVkxywtvJGTYND2JNM=
X-Gm-Gg: AZuq6aIV4iIif6jlaACYEJWnv5By6JjgaOHaYmFq9mdyqJeXr7LrKctxOQnch/PTP2p
	kRPnXUAgqeNGHa0rPlUcRc8tRmi3Fn4WqDnbYYPj0vp1mPJj0pYo2+xivou6IwEKJR8D/ff1R2P
	VNnpNHlsfXOhOK3RfaLnsyu40O64OF68uR1Q7N5Izt8fFJBKutmuJvQ9v6ACx6kMEdPB6eOQYf4
	TbGn8zeeuJaI9u/yWBsFNtgdP5rGCC3cI88G1voYtfxQXKR9/oGpySi8hJhEUr8IOg8VyH5OLUd
	5cl5CTgbNTNMHxK7njo=
X-Received: by 2002:a05:690e:4082:b0:649:f272:4e71 with SMTP id
 956f58d0204a3-64af2194733mr1895375d50.61.1770730489200; Tue, 10 Feb 2026
 05:34:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
In-Reply-To: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Feb 2026 14:34:11 +0100
X-Gm-Features: AZwV_Qh7YZqJ6fn57eqSKDNnShG5y8_vQaT5Jjd2bk1tO-PMV5NbiA4MiAomS4E
Message-ID: <CAPDyKFpY2X8hephSfHq7rj_DaKX76ZSkWSCYXrGTEBUFHkvOzg@mail.gmail.com>
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local devm_mux_state_get_optional()
To: Vinod Koul <vkoul@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Josua Mayer <josua@solid-run.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, linux-phy@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Feb 2026 at 11:53, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Now the mux core provides devm_mux_state_get_optional():
>
>     drivers/phy/renesas/phy-rcar-gen3-usb2.c:944:1: error: static declara=
tion of =E2=80=98devm_mux_state_get_optional=E2=80=99 follows non-static
>      declaration
>       944 | devm_mux_state_get_optional(struct device *dev, const char *m=
ux_name)
>           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>     In file included from drivers/phy/renesas/phy-rcar-gen3-usb2.c:20:
>     include/linux/mux/consumer.h:64:19: note: previous declaration of =E2=
=80=98devm_mux_state_get_optional=E2=80=99 with type =E2=80=98struct mux_st=
ate *(struct device *, const char *)=E2=80=99
>        64 | struct mux_state *devm_mux_state_get_optional(struct device *=
dev, const char *mux_name);
>           |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fix this by dropping the temporary local wrapper.
>
> Fixes: ad314348ceb4fe1f ("mux: Add helper functions for getting optional =
and selected mux-state")
> Fixes: 8bb92fd7a0407792 ("phy: renesas: rcar-gen3-usb2: Use mux-state for=
 phyrst management")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert for helping out!

> ---
>   - ad314348ceb4fe1f is in mmc/next, and a PR has already been sent
>     https://lore.kernel.org/20260209133441.556464-1-ulf.hansson@linaro.or=
g
>   - 8bb92fd7a0407792 is in phy/next

Vinod, do you want to pick up the $subject patch as a fix for 7.0-rc1
or do you prefer me to handle it?

Kind regards
Uffe

> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index cfc2a8d9028d58d0..65cbf330bd8fa10c 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -939,16 +939,6 @@ static int rcar_gen3_phy_usb2_vbus_regulator_registe=
r(struct rcar_gen3_chan *cha
>         return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(cha=
nnel, enable);
>  }
>
> -/* Temporary wrapper until the multiplexer subsystem supports optional m=
uxes */
> -static inline struct mux_state *
> -devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> -{
> -       if (!of_property_present(dev->of_node, "mux-states"))
> -               return NULL;
> -
> -       return devm_mux_state_get(dev, mux_name);
> -}
> -
>  static void rcar_gen3_phy_mux_state_deselect(void *data)
>  {
>         mux_state_deselect(data);
> --
> 2.43.0
>
