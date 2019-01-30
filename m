From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the wireless-drivers-next
 tree
Date: Thu, 31 Jan 2019 10:46:26 +1100
Message-ID: <20190131104626.62ff05ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/afMExeCp/SIBblsvDHiEv0V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Berg <johannes.berg@intel.com>, Luca Coelho <luciano.coelho@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/afMExeCp/SIBblsvDHiEv0V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the wireless-drivers-next tree, today's linux-next build
(x86_64 allmodconfig) produced this warning:

drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c:195:13: warning: 'iwl_mvm_add=
_rtap_sniffer_config' defined but not used [-Wunused-function]
 static void iwl_mvm_add_rtap_sniffer_config(struct iwl_mvm *mvm,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  9bf13bee2d74 ("iwlwifi: mvm: include configured sniffer AID in radiotap")

--=20
Cheers,
Stephen Rothwell

--Sig_/afMExeCp/SIBblsvDHiEv0V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxSN1IACgkQAVBC80lX
0Gyukwf+MOAs6EFm07dVghXCzXuqRffQNaZ003yGYC6+DGV8IYV1lkRJZqYirZ9Z
+jQYhepillqMj1xQXxvQ6IsPeXxkAvaSPYLc9phqA6cs91MHIroPhzL7j9hDLaUB
gZGOtq+6R+2fdxj9OABrqiqRJ56oYhsCua1h1tNdY8ipv/NHW4xC5AlJkdGJLNg7
8OsVE+fe0SPUuRqzHWqqEMn2DWFytljuEb0c9XqmzTXf029FDtFr8zJ1jCcSrM9O
3FlDzATEE7xA/wn82qsU0Ey8hputtHUgGx7+efYUPgpR0AEUqtmzpPqYlB0rAN6Z
2Z2kP2bEtRmOMFSrBl7JIVGSPA4Aww==
=Mxa2
-----END PGP SIGNATURE-----

--Sig_/afMExeCp/SIBblsvDHiEv0V--
