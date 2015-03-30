From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] dma: vdma: Fix compilation warnings
Date: Mon, 30 Mar 2015 20:36:24 +1100
Message-ID: <20150330203624.51cd07d5@canb.auug.org.au>
References: <3912f868-18f8-44ef-9312-b3842270b4da@BY2FFO11OLC001.protection.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EPG+5V7QT9/AL/.0dac4Nr3"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41526 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751897AbbC3Jgc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2015 05:36:32 -0400
In-Reply-To: <3912f868-18f8-44ef-9312-b3842270b4da@BY2FFO11OLC001.protection.gbl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: vinod.koul@intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, anirudh@xilinx.com, Kedareswara rao Appana <appanad@xilinx.com>

--Sig_/EPG+5V7QT9/AL/.0dac4Nr3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kedareswara,

On Mon, 30 Mar 2015 14:30:26 +0530 Kedareswara rao Appana <appana.durga.rao=
@xilinx.com> wrote:
>
> diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
> index 022e34f..01c91bb 100644
> --- a/include/linux/dmapool.h
> +++ b/include/linux/dmapool.h
> @@ -13,6 +13,7 @@
> =20
>  #include <asm/io.h>
>  #include <asm/scatterlist.h>
> +#include <linux/device.h>
> =20
>  struct dma_pool *dma_pool_create(const char *name, struct device *dev,=20
>  			size_t size, size_t align, size_t allocation);

This might be to much, all it really needs is a

struct device;

line ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/EPG+5V7QT9/AL/.0dac4Nr3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGRkdAAoJEMDTa8Ir7ZwVlRUP/3rLNFIGgW9v8y0Tk5FeHfmn
30xyUIoDW7XefGtw1pER4JzplcGp5Fpo+VsqAMqeiGfo4li3b+E/Zt15yipkvrd8
B0ez7SBnWYNJ4E9O3qqt3l861L9+1oO9hMe0qIyoA2VNbVHVxwZxpDXQplScHvLt
WX3BnS31zaHySuWKe74WsAz7O0Yjuyjh+2bDt7hfhnPNwiXL2ikj8wOSZAPBNTze
lnS0BWNAkwXYhXygoi3/ZTpOgPYde+YBCF8IljRIBrETKs0Wq5nczeOPHrozqsh5
32OnbtSYvXIbShIjQsHgVH2jFUJ+++ThDfVKmQP7L7rNQR59JS89ibHCuNu8Y/9x
B30WTNR66OxlCh1iII3x7dtoW7a2OY7FRgPJDej1tvUNyVhxL7ViA4BCnjNI60+w
3NYc0rV1hVJ30eMCpocFSx7+iWyf4BqB+rhXhfrxscuV/8jH4m+CO/Mrmq1kdH66
X+bQC97PAc9s+R0eBY05obanxFpmk7lFt+My7LjTkE6K2TaGqq1MNT6DfovAWMNb
WpBBKnGafiYU1tkoFRZI5Q8v1k0Jb1T7ZbChM+rE2MdQC6np+SryYiNOTcUKjjQi
3eBFkmFYXc39Lkf0FUf3k6uwAKizzl0HI5cTNZYs3Wjr2eX/x3Qv9EoR0A13QsKb
/dblVHeV1P4ihWKuycrf
=IbRq
-----END PGP SIGNATURE-----

--Sig_/EPG+5V7QT9/AL/.0dac4Nr3--
