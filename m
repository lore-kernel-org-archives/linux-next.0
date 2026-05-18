Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFBA43C060;
	Mon, 18 May 2026 12:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108467; cv=none; b=DaGZATTR2B/gL1yTElR6kk022GDXHLK7mnIXhX0eApcZNBpm2uqFyOe0oIsOCMivcvlgiZx6ENVy7j80E5Pw54EEoO8VlOXWpyNEcTxYHBZLpgFLFeF6VYcvkku5ndBdmKRa7oblckR3FV7YPyUmX3cxF4TItrMi+ytXak3EfjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108467; c=relaxed/simple;
	bh=dmAHpDHwrTQcyBrC3Re8K3PQ4HVVhFtkN/lb0e+B4WA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=esPHDWhFn7CEjAVNB/qfFkqMrirh70C5lJhg+hrEAVIGzanQhz004q16huAiarDFZVyGqNg/CSk2KSKPugkNkrBpXfps5Z95FOCGyAgDevT/2dHg9EzzOEABAjP9WZGVigwcXlhGLvySeXrbFF5ty/x+ECIiVrzrS0Oqc0AuBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZV5q7SV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZV5q7SV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F408C2BCB7;
	Mon, 18 May 2026 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779108467;
	bh=dmAHpDHwrTQcyBrC3Re8K3PQ4HVVhFtkN/lb0e+B4WA=;
	h=Date:From:To:Cc:Subject:From;
	b=uZV5q7SVUVDPT4qk14MLe9QTd1iU0LiVTT4NEmgeZti7eIcGg1zqX9UamWTcfZLgk
	 J0OQwNdBdv5yzX9ABYsPO6C9it806BGlrbXr6yuBw1QunPf1yatV2v1UK2joLPpnye
	 N1tAuUE1qtCQ9Cli3/u87mXig/hv1Ypivpxsy+Cy7yiSVC4fFNOxp3jeTuVwHa2ZUL
	 At1n+ysHX7QJhnEzf7qdX/5rzeBc9MNcdy4hV8gbS8stynm2zuNh6XeUbqMEwyT/r3
	 wVyHBKgvybh6gOx5k4Q/byp3V2RPSHl4SMZclMiwwQp1hhm5JwN+DRmvd/KcMCcxtk
	 UNDYcclrX74Jw==
Date: Mon, 18 May 2026 13:47:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Pauli Virtanen <pav@iki.fi>,
	Tristan Madani <tristan@talencesecurity.com>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <agsKbvEi8yNDsJyc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xuurBAGuYGpUP3Se"
Content-Disposition: inline


--xuurBAGuYGpUP3Se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  drivers/bluetooth/btmtk.c

between commit:

  634a4408c0615 ("Bluetooth: btmtk: validate WMT event SKB length before st=
ruct access")

=66rom the origin tree and commits:

  041e88fb0c086 ("Bluetooth: btmtk: validate WMT event SKB length before st=
ruct access")
  162b1adeb057d ("Bluetooth: btmtk: accept too short WMT FUNC_CTRL events")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/bluetooth/btmtk.c
index f70c1b0f89903,68a32d11e5ec9..0000000000000
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@@ -719,8 -719,8 +719,8 @@@ static int btmtk_usb_hci_wmt_sync(struc
  	case BTMTK_WMT_FUNC_CTRL:
  		if (!skb_pull_data(data->evt_skb,
  				   sizeof(wmt_evt_funcc->status))) {
- 			err =3D -EINVAL;
- 			goto err_free_skb;
+ 			status =3D BTMTK_WMT_ON_UNDONE;
+ 			break;
  		}
 =20
  		wmt_evt_funcc =3D (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
@@@ -1545,6 -1545,29 +1545,29 @@@ int btmtk_usb_shutdown(struct hci_dev *
  	return 0;
  }
  EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
+=20
+ int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
+ {
+ 	struct hci_event_hdr *hdr =3D (void *)skb->data;
+ 	struct hci_ev_cmd_complete *ec;
+=20
+ 	if (hdr->evt =3D=3D HCI_EV_CMD_COMPLETE &&
+ 	    skb->len >=3D HCI_EVENT_HDR_SIZE + sizeof(*ec)) {
+ 		u16 opcode;
+=20
+ 		ec =3D (void *)(skb->data + HCI_EVENT_HDR_SIZE);
+ 		opcode =3D __le16_to_cpu(ec->opcode);
+=20
+ 		/* Filter vendor opcode */
+ 		if (opcode =3D=3D 0xfc5d) {
+ 			kfree_skb(skb);
+ 			return 0;
+ 		}
+ 	}
+=20
+ 	return hci_recv_frame(hdev, skb);
+ }
+ EXPORT_SYMBOL_GPL(btmtk_recv_event);
  #endif
 =20
  MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");

--xuurBAGuYGpUP3Se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLCm4ACgkQJNaLcl1U
h9DJEwf8DL5H6Ky0D5UCrAuct3QRK6ciDDn2wojFpHvo7b2g8uwmL9/OES4qoyeQ
DwB2tdz5MZeF21B+cI8B8emSIphSxWcTNbO42wGYqP0HESXsx3683XGGF/q9J/Vz
gt1mgxyTkKTJaCrq0YwCb/ldj36AGhLdyqkS/HC5gGP/K4j28sT0xzPzYrHgW2qU
B4qWwt6tjnEith4G+I0bLG4AGs4gKDgvtMPjahi6hI9qDIAnNYcCrtRfPqjR52rY
vBHJ0wc2oMnVbOuJ6h1QRkkpp7F34xg2Ts4L+yIvu7O+jfzZOQ/nD0QiKZTNDsM9
ZT+tcnCEarqKc3JLUQa4QC++wF96AA==
=JbyB
-----END PGP SIGNATURE-----

--xuurBAGuYGpUP3Se--
