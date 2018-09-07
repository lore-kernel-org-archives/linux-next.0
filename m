From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with a previous
 revert
Date: Fri, 7 Sep 2018 10:12:25 +1000
Message-ID: <20180907101225.05a12d00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OBEI2oCS=mF.Xq=yzLCL2cp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBl?= =?UTF-8?B?bA==?= <bjorn.topel@intel.com>, David Miller <davem@davemloft.net>, Jacob Keller <jacob.e.keller@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Andrew Bowers <andrewx.bowers@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/OBEI2oCS=mF.Xq=yzLCL2cp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bpf-next tree got a conflict in:

  drivers/net/ethernet/intel/i40e/i40e_ethtool.c

between commit:

  39b042e0b347 ("Merge remote-tracking branch 'net-next/master'")
(this is really my revert of
  8fd75c58a09a ("i40e: move ethtool stats boiler plate code to i40e_ethtool=
_stats.h")
due to a build failure
)

and commit:

  b5061a9e8785 ("i40e: disallow changing the number of descriptors when AF_=
XDP is on")

from the bpf-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/intel/i40e/i40e_ethtool.c
index 235012b3bd42,3cd2c88c72f8..000000000000
--- a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
@@@ -5,26 -5,9 +5,27 @@@
 =20
  #include "i40e.h"
  #include "i40e_diag.h"
+ #include "i40e_txrx_common.h"
 -#include "i40e_ethtool_stats.h"
 =20
 +struct i40e_stats {
 +	/* The stat_string is expected to be a format string formatted using
 +	 * vsnprintf by i40e_add_stat_strings. Every member of a stats array
 +	 * should use the same format specifiers as they will be formatted
 +	 * using the same variadic arguments.
 +	 */
 +	char stat_string[ETH_GSTRING_LEN];
 +	int sizeof_stat;
 +	int stat_offset;
 +};
 +
 +#define I40E_STAT(_type, _name, _stat) { \
 +	.stat_string =3D _name, \
 +	.sizeof_stat =3D FIELD_SIZEOF(_type, _stat), \
 +	.stat_offset =3D offsetof(_type, _stat) \
 +}
 +
 +#define I40E_NETDEV_STAT(_net_stat) \
 +	I40E_STAT(struct rtnl_link_stats64, #_net_stat, _net_stat)
  #define I40E_PF_STAT(_name, _stat) \
  	I40E_STAT(struct i40e_pf, _name, _stat)
  #define I40E_VSI_STAT(_name, _stat) \

--Sig_/OBEI2oCS=mF.Xq=yzLCL2cp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluRwmkACgkQAVBC80lX
0Gy+Ngf8DCyDRKjw9bj5z1WeLL9DqglizNpXgH+qLpmf2pEx60+QJBfjw+CF4xHA
rj1fqSvaN0qxSy3/pvq60ltxPSkkvsoTt6DoEh3FSUTs3kcJh15zfFuWGtpiTvTu
f3I6HgWP+WEZ9GgVAbjVCdUpAPi9JK1Dlyz+BPxo1SysFdVENsr8A4W/V9uD5xqG
hyAyUgWTIBuRpxL1LpYEDSLGwEIfHdjfQO0aOVi4LP3XNtIPElkvOtjPVD96jVmo
+EpiHxaVeNoUEQpcpa+kC+GA6KQ9OIOFW4TErQmpCw0XnDLf9lJ63buwLWJVgUsg
Hbve6r7O7b8zBm2RKRYt8tLJRff3Jw==
=q7D6
-----END PGP SIGNATURE-----

--Sig_/OBEI2oCS=mF.Xq=yzLCL2cp--
