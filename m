From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH, RESEND] staging: emxx_udc: allow modular build
Date: Tue, 05 Jul 2016 13:06:02 +0300
Message-ID: <87h9c4l7qt.fsf@linux.intel.com>
References: <E1bKMRb-0005l2-N2@optimist> <20160705095242.GP6247@sirena.org.uk> <4551753.qTqdp3sOje@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:18406 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752448AbcGEKGv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Jul 2016 06:06:51 -0400
In-Reply-To: <4551753.qTqdp3sOje@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, kernel-build-reports@lists.linaro.org
Cc: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Arnd Bergmann <arnd@arndb.de> writes:
> A change to the usb gadget core allowed certain API functions to be
> part of a loadable module, which breaks having emxx_udc built-in:
>
> drivers/staging/built-in.o: In function `nbu2ss_drv_probe':
> (.text+0x2428): undefined reference to `usb_ep_set_maxpacket_limit'
>
> The original patch already fixed tons of other cases that have the
> added dependency but apparently missed this one that now appears
> in an ARM allmodconfig build.
>
> This patch makes the symbol "tristate", which lets the Kconfig
> dependency tracking handle it correctly. To make the module
> actually usable, I also revert 0af61e66ee16 ("drivers/staging:
> make emxx_udc.c explicitly non-modular"), which Paul Gortmaker
> added after noticing that the Kconfig symbol was 'bool'.
> Compared to the original version however, I leave out the
> '__exit' annotation on the remove callback, as Paul pointed
> out that this was incorrect.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 5a8d651a2bde ("usb: gadget: move gadget API functions to udc-core")

Sorry guys, I didn't know we had UDC drivers sitting in staging.

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXe4aKAAoJEIaOsuA1yqREwEIP/RxvD7AbI34Ghfj4hnVNDdxX
UeR6aPT9Xn8GKohNebowqsVfa02bMZCBcMTCNCU1vmvfQMydTGed1/s22xTcIELe
x1ZatXUL+4ULLzXlK/Z8chqpekItz6lJc467g1OjQvC8US4eaQ9OwFPFlxLxhnfP
dU0VEK9K8XShJntj2PYwh6rsBFpWqaKJIgbjx9krxuqOCzTLjtXIvdJGTRHu7nej
rBEAvEcWN8Lz2t2R++kxhLZ67iHBrzZgjdMAlvzp7wzLy3CZh1MiPw04AZi4Fv6Z
wwIF3VtW34HY18MKmmORzxnWKYvFnnBlVRJCVf0x8zrycTyDCM/nesuXJQZa5KxO
SgoQu0HvMZz+PlL3VEPpRW/7mbqDqp25ZJNOIJwj/msmAfGDsSUlw5vsvZmBPJmt
TafQ30iu6rbrYfvl+WSGwzS4pt5wZFDlhwU0HXLWEhR6xNkKhSFMEhDGm8Dk038w
GUbakFMcibKPru+H3DRKbAwISsuP81V6a5Nbtn5wjbZSFyt+n7LUITwcD30lrfLx
rh2x6zbgl4Vcg1JB7GI++XvrflPOtTYq6a/OFIbrZ3h/wnrlScFn1aDmuOIWzgBa
lC4iHWgqhJbpIrpxh8GwmmnIb0PtWH5FIXaH7WFRXxitMxDQox3xuyPUmpS1koUq
9puafnW0zlRilVH0Jd4d
=bAuy
-----END PGP SIGNATURE-----
--=-=-=--
