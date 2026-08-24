Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC641837E;
	Mon, 24 Aug 2026 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574983; cv=none; b=HO1UQVdMPh5wLBGH/KAHohhZw3TpyqKiFcAUeO/VtuETmz6B9KKtdUHLKmYkwRCUtv9a6ZtaYQWphxoB4Z3OhbrrbjBsL/bgGZIEfjSOV6rJwvLKVa4XuYZo8R1UG+298q0XOLLLVHrq3tDPYSAfeu9OuHqpJ3g4dHA0HdopksQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574983; c=relaxed/simple;
	bh=jrYMHLED8/bgESw3WPoxxts0uqOQFmaQCKwQt9gljxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VWXLQ/ihGtEYIf9zUxJGMARjnVaQ0fJc26y3GFQo7L+GdiprwtOOxwLG45sqio57nWPnkviWs3NAT1dxhDeLCTVBH8lXJIh7PthV7DtaFTRlvJnZ2YcGdoYV9VfotQX53GlYqOxTxEbblgnVtLS5YTEpg0AzFl4+9R2GdMQNX14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSeT0arw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSeT0arw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5DB1F000E9;
	Mon, 24 Aug 2026 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574979;
	bh=0hVp1TvDs4JrKb1Mp6MVUf9HYLL9CWucbEnSqsSMgmk=;
	h=Date:From:To:Cc:Subject;
	b=oSeT0arwtngenWRJWICDNniCp6tsSAWg8uEau0w6tj8TU5yvEc1vuFpPFg5tw3m+5
	 rOKDj1C8FagnjjG+jCoCuWOB1KfC3emi/A4bZ5DBCh3MSxEpVKBnOxuZbWtRK3DFqa
	 PQY/rH8gSAiy7oP2fn4FRNxCb73au7rkj1sxCMsiDEHZZLOzWlE1P8Xo0Il2e/bSey
	 5AuUF8sFeFhYYF32ZnuTfvbJ3tRfVERkHV/XVWw02EfMIgy6Q223Y6OLp/kXpsd8Dc
	 9cfsgXyY64ysk0d/5rQOQB+Yuq8DCUkFAYeEUiH5QD4doBNPt4k4rhH95YtRmogRdX
	 BxK9wMAIiNFoA==
Date: Mon, 24 Aug 2026 13:36:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the rtc tree with the origin tree
Message-ID: <aow6wPvEaMCIWmY3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p+HB2fGFnhIuRC+L"
Content-Disposition: inline


--p+HB2fGFnhIuRC+L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rtc tree got a conflict in:

  drivers/rtc/rtc-rzn1.c

between commit:

  995832b2cebe6 ("Replace <linux/mod_devicetable.h> by more specific <linux=
/device-id/*.h> (c files)")

=66rom the origin tree and commit:

  38a3a3b09958d ("rtc: rzn1: Add OF match data to gate SUBU register access=
")

=66rom the rtc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/rtc/rtc-rzn1.c
index 305f10a8a85b6,1e1676a7f3cc9..0000000000000
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@@ -16,6 -18,8 +18,7 @@@
  #include <linux/init.h>
  #include <linux/iopoll.h>
  #include <linux/module.h>
 -#include <linux/mod_devicetable.h>
+ #include <linux/of.h>
  #include <linux/platform_device.h>
  #include <linux/pm_runtime.h>
  #include <linux/rtc.h>

--p+HB2fGFnhIuRC+L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMOr8ACgkQJNaLcl1U
h9CtOgf8CkIA3AWABzioDJz6YmTgpcfKbJtRmytjavCR05jT9QLZ+2yoC5wz6EA6
mATdxq9eCZbkEGeB1PPnI4WOPpzXDMsLYaMhidvgHSTOF4PeYjSVWPgOwQQGvKPT
Oz9NMtryurBKghDZi9DGxABOxjCugIrP8bejsnvIU3SGTmBgsRFxcGyOxyjgOvWv
Ph4WI3W+TyzJqnyibo+ic0DmugAPObmpppUTauThxRO9mJeOuNPnNqh1lAlI6kRW
/u7+VrVX72gmbfbR/ICPjYhMTmse+LRFeGbMIoZ2xC+gcFoD1keo/HRnrXB7FFox
ssMtOpPDSGT9ZUykme40UjmoTgSSTw==
=MrW5
-----END PGP SIGNATURE-----

--p+HB2fGFnhIuRC+L--
