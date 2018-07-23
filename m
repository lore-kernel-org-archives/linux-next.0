From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Jul 23
Date: Tue, 24 Jul 2018 07:03:42 +1000
Message-ID: <20180724070342.36c5a2d9@canb.auug.org.au>
References: <20180723200032.221a8f18@canb.auug.org.au>
        <877elmhvf9.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.vKZNXdL2uNbeeSvD13OLGZ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877elmhvf9.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/.vKZNXdL2uNbeeSvD13OLGZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Tue, 24 Jul 2018 00:35:22 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Would you mind adding my "topic/hvc" branch to linux-next.
>=20
> We (ppc) are notionally the maintainers for that code but it's used by
> some other folks, so I'd like it to get some wider testing before I
> commit it.
>=20
> You should get:
>=20
>   9f65b81f36e3 ("tty: hvc: introduce the hv_ops.flush operation for hvc d=
rivers")

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
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

--Sig_/.vKZNXdL2uNbeeSvD13OLGZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltWQq4ACgkQAVBC80lX
0GyI7gf+P5pl3lh9oWieWUcUDvlW9IaG50WC3U9/+CzkfeD5t+2sbJKrHOUBphcd
WgJkCloTcYBzr4KQ7xeyGYPIjvguHadZnvbmjn3vU0gyaQ5p64IgvKBT5raBPI9y
agzuJusSiizIhi2/MU53v/LP5l/WcNfQFxW/Jq/0r0aAKiunxg3EGGfuzA2yVPgU
PzEC9T/MFlg9KWBPT4E68B97L8g5HutHoe02tjPxbpOOLF3ixEz3DSdPCWXdOJ49
dwCtHn/UHTSzE94P3wg7d2aynn53ruNJLXe7NLNn1WA/DII5ALQYdjuSWU3S+JxW
o6CJY9nyfJ0N1buaeOXrUmkkVkPOkg==
=xVNS
-----END PGP SIGNATURE-----

--Sig_/.vKZNXdL2uNbeeSvD13OLGZ--
