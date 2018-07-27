From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Fri, 27 Jul 2018 20:32:59 +1000
Message-ID: <20180727203259.4ec64ff9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_dv99.1=q0ScTF2sy9Kfpqg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/_dv99.1=q0ScTF2sy9Kfpqg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
allyesconfig) failed like this:

hns_roce_hw_v1.c:(.text.hns_roce_v1_reset+0x8c): undefined reference to `.h=
ns_dsaf_roce_reset'
hns_roce_hw_v1.c:(.text.hns_roce_v1_reset+0xdc): undefined reference to `.h=
ns_dsaf_roce_reset'

Caused by commit

  336a443bd9dd ("net: hns: Make many functions static")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 27 Jul 2018 20:23:20 +1000
Subject: [PATCH] net: hns: make hns_dsaf_roce_reset() not static

This function is declared in a header file and used in a different
source file.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c b/drivers/n=
et/ethernet/hisilicon/hns/hns_dsaf_main.c
index 7afc67510569..619e6ce465c2 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c
@@ -2836,7 +2836,7 @@ module_platform_driver(g_dsaf_driver);
  * @enable: false - request reset , true - drop reset
  * retuen 0 - success , negative -fail
  */
-static int hns_dsaf_roce_reset(struct fwnode_handle *dsaf_fwnode, bool der=
eset)
+int hns_dsaf_roce_reset(struct fwnode_handle *dsaf_fwnode, bool dereset)
 {
 	struct dsaf_device *dsaf_dev;
 	struct platform_device *pdev;
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/_dv99.1=q0ScTF2sy9Kfpqg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlta9NsACgkQAVBC80lX
0Gxs5wf/RxhT5fX7lxBv6bFcZH2Phg0/M46YKesxtc7K8s1PNmm7WsncqKdGIZRC
hxo/wfO8cYa2U28jTwZ118kFJbMEP6ULmX1M9G59nXRmYwiePOAW5nJVATZ7N5Ef
zCyNMMhER7bQ0zX4sYXVzHJMM2otUnaU1PcxWXgeeWsgwWHtwQbeqZ1fqSB58jsc
0rqPOEzduyGBjoq/EQv7NvvV/wkC10Wa8xgKI8E8WIANUeyEmHXdNw7RtRTA88Em
mzTWls7FK/LGWreIDAwN9YlyG5fsshfxUNimMIc/RxKDBTBcQF1AYxxMQ6oOfy3H
QDpQzA3tOzS98oLNq9fXxOanzQOl0A==
=ZvRv
-----END PGP SIGNATURE-----

--Sig_/_dv99.1=q0ScTF2sy9Kfpqg--
