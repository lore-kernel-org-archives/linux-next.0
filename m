From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH linux-next] ARM: shmobile: rcar-gen2: update call to dma_contiguous_reserve_area
Date: Fri, 20 Jun 2014 13:11:42 +0200
Message-ID: <5123262.2QjNse2sTm@avalon>
References: <1403170270-17877-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:51855 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966703AbaFTLLA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Jun 2014 07:11:00 -0400
In-Reply-To: <1403170270-17877-1-git-send-email-vincent.stehle@laposte.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vincent =?ISO-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Cc: linux-sh@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>

Hi Vincent,

Thank you for the patch.

On Thursday 19 June 2014 11:31:10 Vincent Stehl=C3=A9 wrote:
> Commit 5ea3b1b2f8ad 'cma: add placement specifier for "cma=3D" kernel
> parameter' adds a new 'fixed' parameter to dma_contiguous_reserve_are=
a().
> Update rcar_gen2_reserve() accordingly.
>=20
> This fixes the following compilation error:
>=20
>   arch/arm/mach-shmobile/setup-rcar-gen2.c: In function =E2=80=98rcar=
_gen2_reserve=E2=80=99:
> arch/arm/mach-shmobile/setup-rcar-gen2.c:182:10: error: too few argum=
ents
> to function =E2=80=98dma_contiguous_reserve_area=E2=80=99
>=20
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
> Cc: Simon Horman <horms@verge.net.au>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>=20
> Hi,
>=20
> This can be seen with linux next-20140619 and e.g. arm allmodconfig.
>=20
> Best regards,
>=20
> V.
>=20
>  arch/arm/mach-shmobile/setup-rcar-gen2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> b/arch/arm/mach-shmobile/setup-rcar-gen2.c index 73fb2a6..42d5b43 100=
644
> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> @@ -179,6 +179,6 @@ void __init rcar_gen2_reserve(void)
>  #ifdef CONFIG_DMA_CMA
>  	if (mrc.size)
>  		dma_contiguous_reserve_area(mrc.size, mrc.base, 0,
> -					    &rcar_gen2_dma_contiguous);
> +					    &rcar_gen2_dma_contiguous, true);
>  #endif
>  }

--=20
Regards,

Laurent Pinchart
