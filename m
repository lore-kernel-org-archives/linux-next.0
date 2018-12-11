From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the hwmon-staging
 tree
Date: Tue, 11 Dec 2018 14:30:43 +1100
Message-ID: <20181211143043.668c45c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YpFLWko5lt5qaw6TbsNjpEl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pu Wen <puwen@hygon.cn>, Brian Woods <Brian.Woods@amd.com>, Borislav Petkov <bp@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/YpFLWko5lt5qaw6TbsNjpEl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/hwmon/k10temp.c

between commit:

  c552e29fdd63 ("hwmon: (k10temp) Add Hygon Dhyana support")

from the hwmon-staging tree and commit:

  210ba1201ff9 ("hwmon/k10temp: Add support for AMD family 17h, model 30h C=
PUs")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/hwmon/k10temp.c
index 1eb954daa2c8,9790f1f5eb98..000000000000
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@@ -367,7 -360,7 +360,8 @@@ static const struct pci_device_id k10te
  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
 +	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
+ 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
  	{}
  };
  MODULE_DEVICE_TABLE(pci, k10temp_id_table);

--Sig_/YpFLWko5lt5qaw6TbsNjpEl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwPL2MACgkQAVBC80lX
0Gy8xwf7Bwaw5+huoUwidlH59nd21kjdBj9iQuZdH9f8wg0EDrBnrtPb7rDfmhoD
d97TQjTK2xuPW62DDabJl/4uGq5q5e3ioPNIGgvvvsjGWwTDLeVxmlxBoC8AvSJr
yGyZs+ma+QxK/ClVBIiKz6ui7UiHUJR+XSRDyvt07i/f7vLEggSFA8109WTQNlAi
j7mdBuN086xjleEIF5TBZ414cFgI0KcItGZby7eLFda14MD3yvFWOzUVFH/q7nH1
v2GBrOpMYwpTnoG9Trq6pIYN/D7sTR+M9ppkA3xE9PVC50Sg5Zucs3HaP23JUOTc
10k+wE9n0c/M7vpIyvAG13UKdMtzaA==
=2kk1
-----END PGP SIGNATURE-----

--Sig_/YpFLWko5lt5qaw6TbsNjpEl--
