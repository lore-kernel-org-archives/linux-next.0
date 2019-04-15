From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless-drivers-next tree with the
 wireless-drivers tree
Date: Mon, 15 Apr 2019 12:01:33 +1000
Message-ID: <20190415120133.40c0f343@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9dAKwPxUqEQEiYVHcHeRlGL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shahar S Matityahu <shahar.s.matityahu@intel.com>, Luca Coelho <luciano.coelho@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/9dAKwPxUqEQEiYVHcHeRlGL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the wireless-drivers-next tree got a conflict
in:

  drivers/net/wireless/intel/iwlwifi/iwl-trans.h

between commit:

  07d35b4270ef ("iwlwifi: use sync nmi in case of init flow failure")

from the wireless-drivers tree and commit:

  4b1831e48974 ("iwlwifi: dbg_ini: support HW error trigger")

from the wireless-drivers-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/wireless/intel/iwlwifi/iwl-trans.h
index d8690acee40c,2235978adf70..000000000000
--- a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
@@@ -830,6 -831,8 +830,7 @@@ struct iwl_trans=20
  	u32 lmac_error_event_table[2];
  	u32 umac_error_event_table;
  	unsigned int error_event_table_tlv_status;
 -	wait_queue_head_t fw_halt_waitq;
+ 	bool hw_error;
 =20
  	/* pointer to trans specific struct */
  	/*Ensure that this pointer will always be aligned to sizeof pointer */

--Sig_/9dAKwPxUqEQEiYVHcHeRlGL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyz5f0ACgkQAVBC80lX
0Gxj3QgAnyucsFp+xPAm2x2mpt5NXUExZvGL0TlsNnT1pLaD3sxGZz2XBhzCRmi3
yu3JuhmhSZzCr9mJO+rXHeTNmzK2mC2xWnxF9baWrKKlfEnYZ322v4UtT5reb08R
s0wRllXtuh9+VKVn88HNGg/6Ku9+PEccWl+D6EksoqB+iKQOkBKymu31cbntwIs5
GRZVvuVTD0Mo0HBBZX9i29iEdqQ8viioKZTJVFki3E4RZJJThwuKwqPglYZ3ChTs
2/5vbBnF5RCxh/WuDKEE/Rd7PASTVl/eMvraaJlCyPykw/T3JmHY5j+c6LSIWOm+
t/FC6zpzgvbB/0+kjJ46vvnCW1Fb+Q==
=exFE
-----END PGP SIGNATURE-----

--Sig_/9dAKwPxUqEQEiYVHcHeRlGL--
