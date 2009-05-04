From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] max6875: should depend on I2C
Date: Mon, 4 May 2009 14:55:56 +0200
Message-ID: <20090504125556.GD3233@pengutronix.de>
References: <1241430586-31878-1-git-send-email-a.beregalov@gmail.com> <20090504124802.13e56a44@hyperion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xm/fll+QQv+hsKip"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:59262 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753010AbZEDMz7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2009 08:55:59 -0400
Content-Disposition: inline
In-Reply-To: <20090504124802.13e56a44@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, linux-next@vger.kernel.org


--Xm/fll+QQv+hsKip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Good catch! I've folded this fix into
> i2c/i2c-chips-move-max6875-to-drivers-misc-eeprom.patch, thanks for
> reporting.

ACK for the patch.

Haven't noticed that Jean put it into his quilt-stack already. Jean,
could you also add the ACK from Ben Gardner or shall I resend it (with
the minor nit removed?)

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Xm/fll+QQv+hsKip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn+5dwACgkQD27XaX1/VRtHXQCfVkP4csStN2FqI/E5tPwckEyT
194An2X5DCbT4mo3SjxlvC0Q4l+oi631
=FBFU
-----END PGP SIGNATURE-----

--Xm/fll+QQv+hsKip--
