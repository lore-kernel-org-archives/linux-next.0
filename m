From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the regmap tree with Linus' tree
Date: Thu, 9 May 2013 11:01:49 +0100
Message-ID: <20130509100149.GD7478@sirena.org.uk>
References: <20130509115659.fed19d305e0b180697060f95@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YTqNa7If1bmePjLb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45520 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752698Ab3EIKCO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 May 2013 06:02:14 -0400
Content-Disposition: inline
In-Reply-To: <20130509115659.fed19d305e0b180697060f95@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Dimitris Papastamos <dp@opensource.wolfsonmicro.com>


--YTqNa7If1bmePjLb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 09, 2013 at 11:56:59AM +1000, Stephen Rothwell wrote:

> Today's linux-next merge of the regmap tree got a conflict in
> drivers/base/regmap/regmap-debugfs.c between commit 480738de0e07
> ("regmap: debugfs: Simplify calculation of `c->max_reg'") from Linus'
> tree and commit 5e3f5901ac6c ("regmap: debugfs: Fix start_reg
> calculation") from the regmap tree.

> I am not sure that the latter patch is ever required on top of the
> former, so for now I just used the former version (except for the last
> hunk) (see below) and can carry the fix as necessary (no action is
> required).

> Please let me know if this is the incorrect resolution.

Looks sensible.  I'll resolve everything on top of -rc1 once that's
released but I think that's the solution.

--YTqNa7If1bmePjLb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRi3QKAAoJELSic+t+oim9sMMQAJyrh9BTsercEfioDhhbMmqf
+E20qzo36QBUeUa1fgiDD8a6D3xbk2qSJHtAMd7rtcAXfRnVyjcl51faQWJuFy5Z
C8bP39Gz9zBlc/KhnbjHz11jEKZnLIh/ZxqBgVof1c0szERUg9ZE7Sx6wLrW+xyK
J4U7k7uBJqbIbxFaJoyNFkYLML2hO5q5FT/3dhCMYCpLY93TYJza0UgL4+AT7Y6H
LSMCpvbBSNlk4PSFvzaEXbhYL5TyCvazpIs1Cc749tjANXFybWjsUp7xGIeAgmTu
J80l8Qv2vBep45EIJukko93LpPFj+UndRKOdcKi1QOf35d5ePahRjJJvoVxjKQeG
/ZUWQqr3qbaaO2+W1IBOhVYVN3gHCyQkyCYuAGCwpqP+JzufHYd7GL2VMJsWLdwi
YM7/1vq7HIM/3mi7KSKY88hVYaxob9HvAXGlazXfu2sgAvqt5QFCv0pMwgNH63+F
wXhEfE8tdqDTlSGFQwv8LXzQS003aZMG2GJ5XxzJCx970E1glY6iI9AV/bV+d7zB
UMl7h1GpXk+o4q0ADUNFs9EfX0/WhCqQoNFsvt0N4/guoQuRh/CFegfop7KqzNJF
vKgK/1XZySXDZcvCGkDybcMb5+AA944/sZEf5NaR2OaL2JmWmfqZHcfKEoJzfXv4
KWjn5ACZ3WwA8VVJ6DKT
=S4lo
-----END PGP SIGNATURE-----

--YTqNa7If1bmePjLb--
