From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless-drivers-next tree with
 Linus' tree
Date: Mon, 9 Feb 2015 14:14:47 +1100
Message-ID: <20150209141447.43697f4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/i.k7tCciQtQBOdR.NzIxZQH"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47159 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754208AbbBIDOy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Feb 2015 22:14:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>, Troy Tan <troy_tan@realsil.com.cn>

--Sig_/i.k7tCciQtQBOdR.NzIxZQH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kalle,

Today's linux-next merge of the wireless-drivers-next tree got a
conflict in drivers/net/wireless/rtlwifi/pci.c between commit
e9538cf4f907 ("rtlwifi: Fix error when accessing unmapped memory in
skb") from Linus' tree and commit d0311314d002 ("rtlwifi: rtl8192ee:
Fix handling of new style descriptors") from the wireless-drivers-next
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/net/wireless/rtlwifi/pci.c
index c70efb9a6e78,88331d729b0e..000000000000
--- a/drivers/net/wireless/rtlwifi/pci.c
+++ b/drivers/net/wireless/rtlwifi/pci.c
@@@ -924,17 -917,14 +931,16 @@@ new_trx_end
  			rtlpriv->enter_ps =3D false;
  			schedule_work(&rtlpriv->works.lps_change_work);
  		}
- end:
 +		skb =3D new_skb;
 +no_new:
  		if (rtlpriv->use_new_trx_flow) {
 -			_rtl_pci_init_one_rxdesc(hw, (u8 *)buffer_desc,
 +			_rtl_pci_init_one_rxdesc(hw, skb, (u8 *)buffer_desc,
  						 rxring_idx,
 -					       rtlpci->rx_ring[rxring_idx].idx);
 +						 rtlpci->rx_ring[rxring_idx].idx);
  		} else {
 -			_rtl_pci_init_one_rxdesc(hw, (u8 *)pdesc, rxring_idx,
 +			_rtl_pci_init_one_rxdesc(hw, skb, (u8 *)pdesc,
 +						 rxring_idx,
  						 rtlpci->rx_ring[rxring_idx].idx);
 -
  			if (rtlpci->rx_ring[rxring_idx].idx =3D=3D
  			    rtlpci->rxringcount - 1)
  				rtlpriv->cfg->ops->set_desc(hw, (u8 *)pdesc,

--Sig_/i.k7tCciQtQBOdR.NzIxZQH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU2CYsAAoJEMDTa8Ir7ZwVFHwP/RsqGOffmmSb6IMJEo863Dz5
L0nQ/t0vn9LQNUruR9egznjsOuUG/GNFMRi4fVMxCOjed+oFatWJrbgmirmaE6rt
CP0zKdUyjPBvFGIRB3xH7XijN9KWaxv8eMaN7bjBulHX4V41/XAK5W3BKDedHdK7
SBsg0M+OkNgEYYgvqnWW2hTfhfpYPR2j8NmRVeluXMuT7gN8sg2ZUs26HfP6PI/M
utOijb1C3xiw8L4IlCrvF1N5W1rJ4rJedA5aa/14QGq8rjgRJN4wVjQD8zB/Tj7d
H8wVBzog8cjiKxU9EiaJTUGEWaESoISDEBToE+Bs6Dh4xNDGZbgEcDyTLckoGHae
te1reu1C6fec3t0t3D1PpEdj3ln0tHpJV9bHgg4e2YMuvXQA/RiB+hrIFke/NCSU
aPZk6TKcyLrN+kUC7N5Bm+YQETQpBAXD9f7uKydWfzWFS+mStj/SsMcE3a6wGU77
ToqvmtTSMFVnbVyHF4RpcK+ti1xgpyX4QmuZH1W4FStokJVi36jOOpA/jkIvQOH/
CBaxci10+0pNWO3U/FhRoTTcpi3xGlK3MpQ1NBjcXabb+Nv6VJJM9pkndfJ+pZJ/
+NHtycuDTbHpnDTURnfS5kA79FySiCBoNbHA1jA3KtQhMDBleFRPaZKeZav17snX
4w0XQnJkIQlszkSjdOtL
=I9LO
-----END PGP SIGNATURE-----

--Sig_/i.k7tCciQtQBOdR.NzIxZQH--
