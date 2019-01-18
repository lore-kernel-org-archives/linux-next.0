From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the imx-drm tree
Date: Fri, 18 Jan 2019 14:19:12 +1100
Message-ID: <20190118141912.69d2a6e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kgLjQTJpQJ8ImKpYAaGd6aF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/kgLjQTJpQJ8ImKpYAaGd6aF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

After merging the imx-drm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/imx/imx-tve.c: At top level:
drivers/gpu/drm/imx/imx-tve.c:437:29: error: storage size of 'clk_tve_di_op=
s' isn't known
 static const struct clk_ops clk_tve_di_ops =3D {
                             ^~~~~~~~~~~~~~

Exposed by commit

  97144d12df00 ("drm/imx: Allow building under COMPILE_TEST")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/kgLjQTJpQJ8ImKpYAaGd6aF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxBRbAACgkQAVBC80lX
0Gzt4Qf+MDCFQoARVpv1DSUrUl2bgftqfbHkPUQfsItRIOllKlKDkw1llEkA04A/
t9awX3P8kI+ZIOrU3FuQLC6OGuQ7eGqXaTQcJcavpkQxVAHvtxbp0HjBzkunXeoi
Tdu461Xk6yWkwFXu72BOV3lZFjosvIvINLo2J+p/aPKBW+M8o4si4NRerLChZ2kD
I9t9LOwU62lqSslLDiBDEdyhIF9F41md/2Bad6aOdVK5tu11zLzx26bSa5Anhc1L
AN0eTcT/5oXJQVAjnE8vHCP7vCmtmEvmBipcymJK8Te/OcgOI/suMZYNAuUqfkUm
BiJL0be14cYgTxv6jivKBbvHyB1XHA==
=5wGe
-----END PGP SIGNATURE-----

--Sig_/kgLjQTJpQJ8ImKpYAaGd6aF--
