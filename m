From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Tue, 29 Jan 2019 16:17:42 +1100
Message-ID: <20190129161742.6b1b7338@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7Kh.mcqnnU1QXqo=E9drG_l"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/7Kh.mcqnnU1QXqo=E9drG_l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/net/ethernet/freescale/enetc/enetc.c: In function 'enetc_alloc_txbd=
r':
drivers/net/ethernet/freescale/enetc/enetc.c:685:17: error: implicit declar=
ation of function 'vzalloc'; did you mean 'kzalloc'? [-Werror=3Dimplicit-fu=
nction-declaration]
  txr->tx_swbd =3D vzalloc(txr->bd_count * sizeof(struct enetc_tx_swbd));
                 ^~~~~~~
                 kzalloc
drivers/net/ethernet/freescale/enetc/enetc.c:685:15: warning: assignment to=
 'struct enetc_tx_swbd *' from 'int' makes pointer from integer without a c=
ast [-Wint-conversion]
  txr->tx_swbd =3D vzalloc(txr->bd_count * sizeof(struct enetc_tx_swbd));
               ^
drivers/net/ethernet/freescale/enetc/enetc.c:691:3: error: implicit declara=
tion of function 'vfree'; did you mean 'kfree'? [-Werror=3Dimplicit-functio=
n-declaration]
   vfree(txr->tx_swbd);
   ^~~~~
   kfree
drivers/net/ethernet/freescale/enetc/enetc.c: In function 'enetc_alloc_rxbd=
r':
drivers/net/ethernet/freescale/enetc/enetc.c:749:15: warning: assignment to=
 'struct enetc_rx_swbd *' from 'int' makes pointer from integer without a c=
ast [-Wint-conversion]
  rxr->rx_swbd =3D vzalloc(rxr->bd_count * sizeof(struct enetc_rx_swbd));
               ^

Caused by commit

  d4fd0404c1c9 ("enetc: Introduce basic PF and VF ENETC ethernet drivers")

I have added the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 29 Jan 2019 16:13:08 +1100
Subject: [PATCH] enetc: include linux/vmalloc.h for vzalloc etc

Fixes: d4fd0404c1c9 ("enetc: Introduce basic PF and VF ENETC ethernet drive=
rs")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/ethernet/freescale/enetc/enetc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/eth=
ernet/freescale/enetc/enetc.c
index 37b587c541ee..5bb9eb35d76d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -5,6 +5,7 @@
 #include <linux/tcp.h>
 #include <linux/udp.h>
 #include <linux/of_mdio.h>
+#include <linux/vmalloc.h>
=20
 /* ENETC overhead: optional extension BD + 1 BD gap */
 #define ENETC_TXBDS_NEEDED(val)	((val) + 2)
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/7Kh.mcqnnU1QXqo=E9drG_l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxP4fYACgkQAVBC80lX
0GxDEAf+NFmYzu1g8eLByZEyiJurOZroXbfuOcn8cfI6i7zpeHWAJTHVKWSjcXlp
H/N/7jpgHba1UwHiD7yqw4YC3z2xzO3rEtJOFDlpiq0+usVceozKNkmvAyWuTGww
Es7JoU04+2cq+s9UdJzZujBSAXq3TKuDjEnQZkwmETlCcGdWoOX4C9zo7jciC/fE
471DKDOPRXsoEcH5kfR5Tdndcg/i4ZwMOkpikuq2/a0z/jKzkKrP994/unP59NTJ
rLCAdzuOnK4LpEVtW6NNG7Rf3SHN/lUZAenBc7q7Ep051QZ8861HGk4Y6nj7XpKc
yRYc8kwaQcRDCjFrEBzU8UyOfuht2A==
=ycni
-----END PGP SIGNATURE-----

--Sig_/7Kh.mcqnnU1QXqo=E9drG_l--
