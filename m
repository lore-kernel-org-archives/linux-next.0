From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 4 Jun 2012 08:19:28 +0100
Message-ID: <20120604071927.GD26676@opensource.wolfsonmicro.com>
References: <20120604132500.56c579be8e468d9c20fc0b28@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60105 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751724Ab2FDHTa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jun 2012 03:19:30 -0400
Content-Disposition: inline
In-Reply-To: <20120604132500.56c579be8e468d9c20fc0b28@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ola Lilja <ola.o.lilja@stericsson.com>


--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 04, 2012 at 01:25:00PM +1000, Stephen Rothwell wrote:

> ERROR: "clk_enable" [sound/soc/snd-soc-core.ko] undefined!
> ERROR: "clk_disable" [sound/soc/snd-soc-core.ko] undefined!
> ERROR: "clk_get" [sound/soc/snd-soc-core.ko] undefined!

Oh, fail - it looks like the stubs for the clock API didn't actually
manage to get merged.  Should be fixed, anyway.

--JwB53PgKC5A7+0Ej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPzGF2AAoJEBus8iNuMP3dePUP/2D6DWP44j7IIB6nrcc2xxeA
FIe/YwpyWiI84Gl895DoxhxyMgUuTuQiG4aflfnL1xooHVxESVrIX4xUOvKK+YUe
u3irDu+YJ1GqUvzFR0bFYpthKhGsJ1LNmhPdNI7Ypf/tGvKMZ9wDvKnFWxt73z1S
oXMI7I6sQr7787+fxzYH7fKKIM/8NOibgSygHU2uOOw7RvUGqA43vJTc1c1JAld2
egKXnUX6p2n450RkLHTENGv6D4EB8WnBy2g+klnnXMYTnrIKOXJcdRe0Plx7CuTJ
1UlMj94RYyjzeqJUNkj20BGbA6fxVzLR1V05C357XwlzG9e/NztDoh8U7ciH1hVI
L9cKPa1rlXhsb9T3Rvz6y0EaFEzKXwzmouXCSFLzOsGDpSkse9dj6xXLvd7NsPhC
XzL9++fK7wgDadbh2lQrbLsWaAT5tYvRDPPToMMgU7SyYXUaxqIRXOCcaduD8We6
5n+3EumP4NjZQdPx3ZAqn0VNtNVQQCiaVOz4seJCtmc6+lq6EvYeWA5dPD+NVA+6
pJzc+TQyOQj2wF87AEBgt8jo6YCqIDMfDbtNZ95QmMULNthWZndjC1E7TfW2wOPA
sRrYWCJw4pSMpMm6rnzFUiRpNtjUHRTPQ2JgKqMyVN1n2zSz7bv4DhZ6WP5277Qg
siqoBy1vdQKaRUzVeXkg
=Fgp0
-----END PGP SIGNATURE-----

--JwB53PgKC5A7+0Ej--
