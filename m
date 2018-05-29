From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Tue, 29 May 2018 13:10:36 +1000
Message-ID: <20180529131036.09e95ef2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qzAxrcJtsb24Z8bXAfIoZo0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/qzAxrcJtsb24Z8bXAfIoZo0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

net/core/filter.c: In function 'sk_msg_convert_ctx_access':
net/core/filter.c:6450:6: warning: unused variable 'off' [-Wunused-variable]
  int off;
      ^~~

Introduced by commit

  303def35f64e ("bpf: allow sk_msg programs to read sock fields")

--=20
Cheers,
Stephen Rothwell

--Sig_/qzAxrcJtsb24Z8bXAfIoZo0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsMxKwACgkQAVBC80lX
0GyHxAf+JpYuH0Lc1dCMuDEwC8b/l/VJL19zR5D9P+50NmUF48IuoDwSoZPDYPqr
zYQ1VWkw5Sl55yPCqQbcKwP2/yVudODaEFSX7Yg0YSLN5WjQOfKUxIWaoZfQw2Q1
Hs2nfgkUf1uOSKud9pN7eVWCcV4wt+cZpBiTuxiJ5uHqqoR/7qOiC3+afyI2qaV1
T4Yl0ZNAmfGxp0aoq3WK+9mA64jXW3F68ESKixFwunYu8jQ/plEOegcyiZtPizCv
Ui5ZfzFw4FJwqksO1YtAXCVrTbWUS1lKU7QmXhg7Z6qcWP+SGPOjAq6DwXkFAWWO
89eQHk7zEZu2z30F4bUETImZDVpXXA==
=Nl9J
-----END PGP SIGNATURE-----

--Sig_/qzAxrcJtsb24Z8bXAfIoZo0--
