From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Thu, 29 Nov 2018 11:24:28 +1100
Message-ID: <20181129112428.45287471@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/98MDSry6jDRHt9Ep1W=uTQv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, Kees Cook <keescook@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/98MDSry6jDRHt9Ep1W=uTQv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build
(x86_64_allmodconfig) produced this warning:

drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c: In function 'run_xdp':
drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:324:3: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
   bpf_warn_invalid_xdp_action(xdp_act);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:325:2: note: here
  case XDP_ABORTED:
  ^~~~
drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:326:3: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
   trace_xdp_exception(priv->net_dev, xdp_prog, xdp_act);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:327:2: note: here
  case XDP_DROP:
  ^~~~

Introduced by commit

  7e273a8ebdd3 ("dpaa2-eth: Add basic XDP support")

This due to my use of -Wimplicit-fallthrough.  This is new code.  The
warning can be suppressed by adding a comment like /* fall through */
at the appropriate places to indicate that the fallthrough is intended.

--=20
Cheers,
Stephen Rothwell

--Sig_/98MDSry6jDRHt9Ep1W=uTQv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv/MbwACgkQAVBC80lX
0Gxf2Qf/YWrIZvqMmkjx8UMwGPfDXUI/bw5l7GEJy03urzZJWem+77ggWgl70r0E
AL6O4xHPzcv/TAEz+zqb3mae18N/k9uZudqIBQggxi/oPmQTZSQj7mIw0y3mEhRZ
pOG0v1r3d4P5S7rvi6WTrwNnbzKYWFxIUFyIRCMNyrSB7Sk7DnjCjGwtyXctG2V8
ZqsJKh6EaCpKVUEfCbxry8VOLN/JRjAOydkGWwAifvNsFcTqG8N+uinoZSd2mn/C
N+lPshmqYmUJvCETKcABdLEcBY6IVQdoCRYgXO894VGxdlROBWPYGcVsnKteauRG
3BuPWJbwz9C+IzUobaDc5S9LPA5BpQ==
=+fzU
-----END PGP SIGNATURE-----

--Sig_/98MDSry6jDRHt9Ep1W=uTQv--
