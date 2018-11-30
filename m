From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the wireless-drivers-next
 tree
Date: Fri, 30 Nov 2018 12:05:55 +1100
Message-ID: <20181130120555.1d35eb6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5vQDyDlwVdeiPE8VRGqP7X8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sara Sharon <sara.sharon@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Kees Cook <keescook@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5vQDyDlwVdeiPE8VRGqP7X8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the wireless-drivers-next tree, today's linux-next build
(x86_64 allmodconfig) produced these warnings:

drivers/net/wireless/intel/iwlwifi/iwl-drv.c: In function 'iwl_parse_tlv_fi=
rmware':
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1098:7: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    if (iwlwifi_mod_params.enable_ini)
       ^
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1100:3: note: here
   default:
   ^~~~~~~
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c: In function 'iwl_parse_fw=
_dbg_tlv':
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:203:4: warning: this state=
ment may fall through [-Wimplicit-fallthrough=3D]
    iwl_fw_dbg_copy_tlv(trans, tlv, true);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:204:3: note: here
   default:
   ^~~~~~~

Introduced by commit

  f14cda6f3b31 ("iwlwifi: trans: parse and store debug ini TLVs")

These are noted because I use -Wimplict-fallthrough

The warnings can be suppressed by adding a comment like
	/* fall through */
at the appropriate place to indicate that the fallthough is intended.

--=20
Cheers,
Stephen Rothwell

--Sig_/5vQDyDlwVdeiPE8VRGqP7X8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwAjPMACgkQAVBC80lX
0GxD9gf/akxcHvNuNbGQK28xcmepUq9REkgKWl0+BRhByx0rlxak17GwBFxMa/qJ
sOZWsoIz9hItnKmDKVbk/uQX2TTVLV5i1iqNXx6YCwVdnMsosqYZmunWuFJr0WEm
yFgF2O5B/oqKDiT5YprCX9eFSO7TfG0Z8vxfof9F0HycIFSJzQYCC4nkiKH8dgYU
5nWxZK6gsTU4gDBGUjXE+QqQ5oi8Stn9Ldnfv8YIsJElyE7tndYhvyWZOpOgpKm/
6ACdrSPNsy3mn1j1L7ONR/x7ZmdHFo2qN+FFBANzxAerxCgRO7TFxiDJOs1WLkbS
iRstiLQCvXigJNShoInjdgSgHgjIcA==
=cF0/
-----END PGP SIGNATURE-----

--Sig_/5vQDyDlwVdeiPE8VRGqP7X8--
