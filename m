From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: manual merge of the imx-mxs tree with the tree
Date: Sun, 5 Jan 2014 16:06:10 -0800
Message-ID: <CAOesGMiTjUV78Gw1eKKSsz2Q0ODTk9p8hT_FcX1d0F3gMbX4Tw@mail.gmail.com>
References: <20140106104938.82a53f6d3b4d773607fe7556@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:55098 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751407AbaAFAGN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 5 Jan 2014 19:06:13 -0500
Received: by mail-qc0-f171.google.com with SMTP id c9so16694423qcz.2
        for <linux-next@vger.kernel.org>; Sun, 05 Jan 2014 16:06:10 -0800 (PST)
In-Reply-To: <20140106104938.82a53f6d3b4d773607fe7556@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shawn Guo <shawn.guo@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>, Troy Kisky <troy.kisky@boundarydevices.com>

On Sun, Jan 5, 2014 at 3:49 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Shawn,
>
> Today's linux-next merge of the imx-mxs tree got a conflict in
> arch/arm/boot/dts/imx6q-sabrelite.dts between commit 8f568b496dd9 ("ARM:
> imx: Explicitly pass the active level of the PHY reset") from the arm-soc
> tree and commit e5a5af250568 ("ARM: dts: imx: sabrelite: add Dual
> Lite/Solo support") from the imx-mxs tree.
>
> I fixed it up (just used the latter) and can carry the fix as necessary
> (no action is required).

Thanks Stephen. The offending patch from the arm-soc side has been
dropped, but I didn't push out the new for-next yet. It should be gone
tomorrow. Same for some of the other imx conflicts.


-Olof
