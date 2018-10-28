From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure in Linus' tree
Date: Mon, 29 Oct 2018 09:45:26 +1100
Message-ID: <20181029094526.02c61d71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s3JkVEgTIGhmUYj2X2r5jo/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Sig_/s3JkVEgTIGhmUYj2X2r5jo/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the origin tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/net/ethernet/mellanox/mlx4/en_rx.c:582:18: warning: 'struct iphdr' =
declared inside parameter list will not be visible outside of this definiti=
on or declaration
           struct iphdr *iph)
                  ^~~~~
drivers/net/ethernet/mellanox/mlx4/en_rx.c: In function 'get_fixed_ipv4_csu=
m':
drivers/net/ethernet/mellanox/mlx4/en_rx.c:586:20: error: dereferencing poi=
nter to incomplete type 'struct iphdr'
  __u8 ipproto =3D iph->protocol;
                    ^~

Caused by commit

  55469bc6b577 ("drivers: net: remove <net/busy_poll.h> inclusion when not =
needed")

I added the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 29 Oct 2018 09:40:39 +1100
Subject: [PATCH] drivers: net: include linux/ip.h for iphdr

Fixes: 55469bc6b577 ("drivers: net: remove <net/busy_poll.h> inclusion when=
 not needed")
Cc: Eric Dumazet <edumazet@google.com>
Cc: David S. Miller <davem@davemloft.net>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/ethernet/mellanox/mlx4/en_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_rx.c b/drivers/net/ether=
net/mellanox/mlx4/en_rx.c
index 5a6d0919533d..ffa54767dfe5 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
@@ -31,6 +31,7 @@
  *
  */
=20
+#include <linux/ip.h>
 #include <linux/bpf.h>
 #include <linux/bpf_trace.h>
 #include <linux/mlx4/cq.h>
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/s3JkVEgTIGhmUYj2X2r5jo/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvWPAYACgkQAVBC80lX
0Gx7DggAgis9Oe6Hpje8T6XlIMzfb+tBhH2+JuQBcRF+w0NQF0XikoPQpAvCHDLu
B2BwgeoNSjUlT3lvpgmtX4ANHvmSQPcHP8tkdC5NKTLTDWlbjMwNzpSD777MOFJw
4NVptC99xSdNK/zo99wKpkM0MeErY15aPFh8fFpxJEbWdnjU4oa4PQWqVI2/HeXn
kmSG26uFAEW+uRIv4eUaDi/2oSZ1aBrbpLPGjvfNpfIzHOD6v0NGCuOBuZCjoqIg
aM5lvO3K3LMR1v1zcVsbJ4vib8XHw3b7/Lr+ml/3+zh84PO/ocE23AIQzK//X0Xc
w++T4ghWUOM9yUMB1MX7yZ8GHkDbEA==
=SUKT
-----END PGP SIGNATURE-----

--Sig_/s3JkVEgTIGhmUYj2X2r5jo/--
