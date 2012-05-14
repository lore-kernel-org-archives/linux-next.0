From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: linux-next: manual merge of the akpm tree with the arm-soc tree
Date: Mon, 14 May 2012 14:57:56 -0700
Message-ID: <CAJOA=zOvLak8ua+0dJTvgOuhF=TrpXaXZt+UXcn9-EEnh1+KBA@mail.gmail.com>
References: <20120514192404.91f9477851ad8485a2112973@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog116.obsmtp.com ([74.125.149.240]:60365 "EHLO
	na3sys009aog116.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757900Ab2ENV6T convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 May 2012 17:58:19 -0400
Received: by bkcjg15 with SMTP id jg15so4501126bkc.10
        for <linux-next@vger.kernel.org>; Mon, 14 May 2012 14:58:17 -0700 (PDT)
In-Reply-To: <20120514192404.91f9477851ad8485a2112973@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On Mon, May 14, 2012 at 2:24 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Andrew,
>
> Today's linux-next merge of the akpm tree got a conflict in
> drivers/clk/Kconfig between commit d269b974e32c ("clk: remove
> COMMON_CLK_DISABLE_UNUSED") from the arm-soc tree and commit "clk: re=
move
> redundant depends on from drivers/Kconfig" from the akpm tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Hi Stephen,

The fix-up is correct.

Thanks,
Mike

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc drivers/clk/Kconfig
> index 4864407,4f10a21..0000000
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@@ -23,9 -22,18 +23,8 @@@ config COMMON_CL
> =A0menu "Common Clock Framework"
> =A0 =A0 =A0 =A0depends on COMMON_CLK
>
> =A0-config COMMON_CLK_DISABLE_UNUSED
> =A0- =A0 =A0 =A0bool "Disabled unused clocks at boot"
> =A0- =A0 =A0 =A0---help---
> =A0- =A0 =A0 =A0 =A0Traverses the entire clock tree and disables any =
clocks that are
> =A0- =A0 =A0 =A0 =A0enabled in hardware but have not been enabled by =
any device drivers.
> =A0- =A0 =A0 =A0 =A0This saves power and keeps the software model of =
the clock in line
> =A0- =A0 =A0 =A0 =A0with reality.
> =A0-
> =A0- =A0 =A0 =A0 =A0If in doubt, say "N".
> =A0-
> =A0config COMMON_CLK_DEBUG
> =A0 =A0 =A0 =A0bool "DebugFS representation of clock tree"
> - =A0 =A0 =A0 depends on COMMON_CLK
> =A0 =A0 =A0 =A0select DEBUG_FS
> =A0 =A0 =A0 =A0---help---
> =A0 =A0 =A0 =A0 =A0Creates a directory hierchy in debugfs for visuali=
zing the clk
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
