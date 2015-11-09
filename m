From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: linux-next: build failure after merge of the thermal-soc tree
Date: Mon, 9 Nov 2015 11:17:30 -0800
Message-ID: <20151109191729.GA10824@localhost.localdomain>
References: <20151105160113.5d6f73f7@canb.auug.org.au>
 <563B2DC8.1080900@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:34586 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750792AbbKITRf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2015 14:17:35 -0500
Content-Disposition: inline
In-Reply-To: <563B2DC8.1080900@rock-chips.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Caesar Wang <wxt@rock-chips.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen,

On Thu, Nov 05, 2015 at 06:22:00PM +0800, Caesar Wang wrote:
>=20
>=20
> =E5=9C=A8 2015=E5=B9=B411=E6=9C=8805=E6=97=A5 13:01, Stephen Rothwell=
 =E5=86=99=E9=81=93:
> >Hi Eduardo,
> >
> >After merging the thermal-soc tree, today's linux-next build (powerp=
c
> >allyesconfig) failed like this:
> >
> >drivers/thermal/rockchip_thermal.c: In function 'rockchip_thermal_su=
spend':
> >drivers/thermal/rockchip_thermal.c:641:2: error: implicit declaratio=
n of function 'pinctrl_pm_select_sleep_state' [-Werror=3Dimplicit-funct=
ion-declaration]
> >   pinctrl_pm_select_sleep_state(dev);
> >   ^
> >drivers/thermal/rockchip_thermal.c: In function 'rockchip_thermal_re=
sume':
> >drivers/thermal/rockchip_thermal.c:679:2: error: implicit declaratio=
n of function 'pinctrl_pm_select_default_state' [-Werror=3Dimplicit-fun=
ction-declaration]
> >   pinctrl_pm_select_default_state(dev);
> >   ^
>=20

Thanks, I wonder why I did not catch this in my bots.

> That's indeed wonder that I build up in next-kernel-v4.3, applied
> into chromium v3.14 stable kernel.
>=20
> from the log I guess wee need the include file:
> "#include <linux/pinctrl/consumer.h>"

Caesar, are you sending a patch or should I just take care of it?

BR,

>=20
>=20
> >
> >Caused by commit
> >
> >   7e38a5b1daa1 ("thermal: rockchip: support the sleep pinctrl state=
 to avoid glitches")
> >
> >Probably just a missing include file.
> >
> >I have reverted that commit for today.
> >
> >
> >
>=20
> --=20
> Yours,
> Caesar
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
