From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pidfd tree with Linus' tree
Date: Thu, 6 Jun 2019 15:40:34 +1000
Message-ID: <20190606154034.7d8ba5d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/P82a9gtvGIURYM1Ekb4W_o0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Brauner <christian@brauner.io>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>
List-Id: linux-next.vger.kernel.org

--Sig_/P82a9gtvGIURYM1Ekb4W_o0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  tools/testing/selftests/pidfd/pidfd_test.c

between commit:

  1fcd0eb356ad ("tests: fix pidfd-test compilation")

from Linus' tree and commit:

  233ad92edbea ("pidfd: add polling selftests")

from the pidfd tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/P82a9gtvGIURYM1Ekb4W_o0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz4p1IACgkQAVBC80lX
0GyrXggAiI/EPPvyqGl/jsf+PRndL5BZ2c9nKe5AlOG+tD8poTyrAvz7a8iPvd0v
QGuYnPtPt/AJVIBf8PvfB+XbNI+pwzw+Agy7+J2qboB4PcqxOk5t4j1nZ0pGRz4P
f4hetzqVgjIU+68r+5kR1Hm81u0sMfqVg8rrIMvchZB3THxDugaLy4byLSXJKkzH
v9vtKYog/Wpxe4px1NhxUbO8RaLMUyBm/+H1smgkpNQ7FrpzV12Gjdn2KS8nTD3r
0HYiheEFLSGaIOir2xxRu84+zZ8yPF1g2C27Q6f5vvYTbQkGmo7R27ME8e8sbZ5T
ZJFR5E6MgWJ/737Vx8ws67YdnU1Mdg==
=+018
-----END PGP SIGNATURE-----

--Sig_/P82a9gtvGIURYM1Ekb4W_o0--
