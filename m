From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mmc-fixes tree
Date: Tue, 26 Feb 2019 08:22:00 +1100
Message-ID: <20190226082200.4f7aa469@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HsmC5+H8BGJg6XR3Y=16OJp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Takeshi Saito <takeshi.saito.xv@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms+renesas@verge.net.au>
List-Id: linux-next.vger.kernel.org

--Sig_/HsmC5+H8BGJg6XR3Y=16OJp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

After merging the mmc-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mmc/host/tmio_mmc_core.c: In function 'tmio_mmc_start_data':
drivers/mmc/host/tmio_mmc_core.c:706:34: error: 'SZ_64K' undeclared (first =
use in this function); did you mean 'EM_68K'?
  if (host->mmc->max_blk_count >=3D SZ_64K)
                                  ^~~~~~
                                  EM_68K
drivers/mmc/host/tmio_mmc_core.c:706:34: note: each undeclared identifier i=
s reported only once for each function it appears in

Caused by commit

  063f8fee9927 ("mmc: tmio: fix access width of Block Count Register")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/HsmC5+H8BGJg6XR3Y=16OJp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx0XHgACgkQAVBC80lX
0Gy7OAf/cT6Hlz+ghJ1ym3d25eF+1tCidaPkMIzPTfdZs7B+jKiILoehFNQqPvqc
7rjFL5a/7vZd5JDeH9kXADKRBRUKFTOMGeNtleIfZO5hewkfRYDDtLU4r77A9NtS
RATn3uo1JwfHUUsi2YC2dNvzc8UiNKlsKLSNSnUmA9heVHmkl0xqvIdekd15JEKI
mpKqkRg2aITc+5SleFqzTguifd+mJARhqt5m9X4GgWHbQqa5jpI8yQgw8VnJGrCN
G7J0DMpvUzWYXmji8lCDn848t74uqvT7y+MAFdNN4QyN/SGKcqzZREN2zghbOyAV
X5JwnHUJqqW8Y12KkgMWjPTx3FZvBQ==
=8Idg
-----END PGP SIGNATURE-----

--Sig_/HsmC5+H8BGJg6XR3Y=16OJp--
