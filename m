From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Wed, 19 Dec 2018 13:42:43 +1100
Message-ID: <20181219134243.674b80b7@canb.auug.org.au>
References: <20181129112428.45287471@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GaYj3LuP+JQSqFPEj+DHbQ3"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181129112428.45287471@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, Kees Cook <keescook@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/GaYj3LuP+JQSqFPEj+DHbQ3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 29 Nov 2018 11:24:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the net-next tree, today's linux-next build
> (x86_64_allmodconfig) produced this warning:
>=20
> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c: In function 'run_xdp':
> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:324:3: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
>    bpf_warn_invalid_xdp_action(xdp_act);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:325:2: note: here
>   case XDP_ABORTED:
>   ^~~~
> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:326:3: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
>    trace_xdp_exception(priv->net_dev, xdp_prog, xdp_act);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:327:2: note: here
>   case XDP_DROP:
>   ^~~~
>=20
> Introduced by commit
>=20
>   7e273a8ebdd3 ("dpaa2-eth: Add basic XDP support")
>=20
> This due to my use of -Wimplicit-fallthrough.  This is new code.  The
> warning can be suppressed by adding a comment like /* fall through */
> at the appropriate places to indicate that the fallthrough is intended.

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/GaYj3LuP+JQSqFPEj+DHbQ3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwZsCMACgkQAVBC80lX
0Gx51wf/StrZL7vewCSh+ed1scOPDKOPNMhjwt5AYHJXXLg3n2WACsds32NGP0pX
8zVkXtAa0490e119oF5fBxudAgBG6Uru+4qfFX7DNGV+hT8FDIuiX+Rh6rCO0lOG
0l+MtVzN8lLBLepAfp1QcqBfXOoWUiuDPn9uxAHMTCIDSK5xhqXJ7EXdeP8lgk8l
zXA5s1RsTuc3kid4Fe64+PizcMgEPauvF2Fhuj1kAtcSCS5FXzE1FJGwfejuhVCD
+z7BFUc+DH7XXeS033FqI+ZtSTD7ooZou61PShgZqzC5S1xId3VAhvxRK4EHzFZA
TwjweZKy+oiESmKeTzIg2Yb1V0rEqw==
=dv3k
-----END PGP SIGNATURE-----

--Sig_/GaYj3LuP+JQSqFPEj+DHbQ3--
