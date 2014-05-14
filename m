From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: new branch for linux-next (irqchip)
Date: Wed, 14 May 2014 10:10:25 +1000
Message-ID: <20140514101025.2cf4e84f@canb.auug.org.au>
References: <20140513160537.GD27822@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KteZIY_Z_R_Q6.vxQtQ26e."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35242 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750834AbaENAKg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 May 2014 20:10:36 -0400
In-Reply-To: <20140513160537.GD27822@titan.lakedaemon.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-next@vger.kernel.org

--Sig_/KteZIY_Z_R_Q6.vxQtQ26e.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Tue, 13 May 2014 12:05:37 -0400 Jason Cooper <jason@lakedaemon.net> wrot=
e:
>
> Thomas has recently asked me to lend him a hand reviewing and
> collecting patches for drivers/irqchip.  I'll then send him a pull
> request for that branch.  So, it's very similar to what we (mvebu) does
> wrt arm-soc.
>=20
> If you could please add the following branch to your list, we'd
> appreciate it.
>=20
> Contact: Jason Cooper <jason@lakedaemon.net>
> ML:      linux-kernel@vger.kernel.org
> Tree:    git://git.infradead.org/users/jcooper/linux.git
> Branch:  irqchip/for-next

Added from today.  I note that the branch is currently empty (which is
fine - just checking).

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/KteZIY_Z_R_Q6.vxQtQ26e.
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTcrR5AAoJEMDTa8Ir7ZwV3w8P/iQleNMrn2Rk4QwTePN5wSYq
OLx9vCfhT6dzwPdOCoxZllb3kbn1166JXkkKHSais6GWmZFXgkRDfYDBQYczQsH6
t5K25VCARmhsgurpFY9wQ743kHJ9R0xBIr5v7TeQNOa0LoIWpoSsFBup0F18wJss
KiADjBxHKPgeLdDbjDHhiAeyD5iJJmAJ3EWO7jDZWj9JPr22jgUPrdUPw/Dfmr4M
A2VmZQvb7EVBVQkMWpK1TJWPXjO+tsHyQbGGXFwnHku1NrH2nEtK/WjEiREfnvcC
Zr6NUguh8U0nJyfdqz9rYHIpZUoaoAX1fsyLIHcU5HcPOzNi8ITjyhT5N0ggRhZN
r7yBin1Og6eLQJrxlcgvwU2lKVyaV6mFOOP+yiENC1zOooxC6Fn6bahQWV9c0WBi
6Nxsqsmjl2MR5jMItAAumzeAxPHX0hY9TDXgkQIgRFpYZzMxhWbiaR73pmI4U1SE
p/WbnVtEAH7hlhk3LXgBMO/H3tUknlHXTozhyZCqHUBGzAzkP8KVcoswPpwhDrCx
nA4UlNnDiQnyl4ZzMlaiKvLApe4nOuAxRWoi+r4+oby3xj5/9br7xGL8lmsdq/aw
jgPGEoxw4ZQuAs+QRhleM5brCG5jdlllkM1p3N6gb/tNHUmTT7t8XNL8ODcXpFWR
3yIGPdSGyL1GgiDerZmB
=NU/R
-----END PGP SIGNATURE-----

--Sig_/KteZIY_Z_R_Q6.vxQtQ26e.--
