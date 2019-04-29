From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the
 wireless-drivers tree
Date: Mon, 29 Apr 2019 11:54:02 +1000
Message-ID: <20190429115338.5decb50b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ouD1/C1Rf=a4YufAYVULo5g"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Luca Coelho <luciano.coelho@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ouD1/C1Rf=a4YufAYVULo5g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/wireless/intel/iwlwifi/mvm/debugfs-vif.c

between commits:

  154d4899e411 ("iwlwifi: mvm: properly check debugfs dentry before using i=
t")
  d156e67d3f58 ("iwlwifi: mvm: fix merge damage in iwl_mvm_vif_dbgfs_regist=
er()")

from the wireless-drivers tree and commit:

  c9af7528c331 ("iwlwifi: mvm: no need to check return value of debugfs_cre=
ate functions")

from the net-next tree.

I fixed it up (the latter removed the code modified by the former, so I
just did that) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ouD1/C1Rf=a4YufAYVULo5g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzGWToACgkQAVBC80lX
0GyjqQf/WmQNjeOP1on2Gd80/wu5PBCMWR0vBySe2WZ8v1efY6dyhDSLHm1bLzu1
3ZYqkjy9od5BqotAHadOWbwNwv2SsYpYvWKuwYP82Fh509SWEwapxFk/hlv7b6MO
OXqPJxLVEQ9lBv9ErhkaEV50AkxApAkidiU5vZMbVLcA23dFjMGtpHOUEsEtR9Qc
xdEK1VHH14ZZAdRt06D3XK0lJwuh/JoMNlZXwmG3syMBwoggULzvqHvdL4KzpOz4
rDlbyPaOUXipocKkNaShf6EeKVPoOn7w0N8rsj2xGA1chlHQYNh53A1fg7adUIvp
bWD+K14cDKZGv5rPnaP63DGE8HrNlg==
=HV9G
-----END PGP SIGNATURE-----

--Sig_/ouD1/C1Rf=a4YufAYVULo5g--
