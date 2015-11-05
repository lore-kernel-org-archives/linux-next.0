From: Caesar Wang <wxt@rock-chips.com>
Subject: Re: linux-next: build failure after merge of the thermal-soc tree
Date: Thu, 5 Nov 2015 18:22:00 +0800
Message-ID: <563B2DC8.1080900@rock-chips.com>
References: <20151105160113.5d6f73f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from regular2.263xmail.com ([211.157.152.4]:55845 "EHLO
	regular2.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031182AbbKEKWL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2015 05:22:11 -0500
Received: from regular1.263xmail.com (unknown [192.168.165.234])
	by regular2.263xmail.com (Postfix) with ESMTP id 95C6318EBC7
	for <linux-next@vger.kernel.org>; Thu,  5 Nov 2015 18:22:06 +0800 (CST)
In-Reply-To: <20151105160113.5d6f73f7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Eduardo Valentin <edubezval@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org



=E5=9C=A8 2015=E5=B9=B411=E6=9C=8805=E6=97=A5 13:01, Stephen Rothwell =E5=
=86=99=E9=81=93:
> Hi Eduardo,
>
> After merging the thermal-soc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/thermal/rockchip_thermal.c: In function 'rockchip_thermal_sus=
pend':
> drivers/thermal/rockchip_thermal.c:641:2: error: implicit declaration=
 of function 'pinctrl_pm_select_sleep_state' [-Werror=3Dimplicit-functi=
on-declaration]
>    pinctrl_pm_select_sleep_state(dev);
>    ^
> drivers/thermal/rockchip_thermal.c: In function 'rockchip_thermal_res=
ume':
> drivers/thermal/rockchip_thermal.c:679:2: error: implicit declaration=
 of function 'pinctrl_pm_select_default_state' [-Werror=3Dimplicit-func=
tion-declaration]
>    pinctrl_pm_select_default_state(dev);
>    ^

That's indeed wonder that I build up in next-kernel-v4.3, applied into=20
chromium v3.14 stable kernel.

from the log I guess wee need the include file:
"#include <linux/pinctrl/consumer.h>"


>
> Caused by commit
>
>    7e38a5b1daa1 ("thermal: rockchip: support the sleep pinctrl state =
to avoid glitches")
>
> Probably just a missing include file.
>
> I have reverted that commit for today.
>
>
>

--=20
Yours,
Caesar
