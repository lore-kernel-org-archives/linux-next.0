Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1E3D091D;
	Mon, 16 Mar 2026 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681206; cv=none; b=aafXQPydM8A2FCu1dNhnIfkcc5jM1MzHwl6B6Y4eEsuKDoELUarSnHDtMKcKLUXhhioXG+s/UBiWww1j25b0f4+eXPiaMmkZy0QYJZq5yMnBMVnqNF0q9CdrdRFREuar0YPxEjCZRIDsIdyuflUoT1rnpdTPj04/MrEfrMqIDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681206; c=relaxed/simple;
	bh=wR1jw6wJVE0yDqB4ULdFi56xF5B+VN+txMliwMmjunc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RBFXHy6Ru6g1Q1ItKPXojDHf9eBJtFlMG0vL+uItdmKKfmclrEEf6q7sJ/C9bT+2+8P4PKRVeWxA+JpkZp48g6/Pkbykkfxd9/KikoWVI33ZT1yQlGpWIgUeTUr+OxJNpmJZGhqGjY4DfBypBgtz3IvcshPXMwn4I9ldP3HQNio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iegn/zeL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iegn/zeL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E56FC19421;
	Mon, 16 Mar 2026 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773681206;
	bh=wR1jw6wJVE0yDqB4ULdFi56xF5B+VN+txMliwMmjunc=;
	h=Date:From:To:Cc:Subject:From;
	b=Iegn/zeLFyAyoGl7f8HQUPEXkFTT3NI+GuDxQfoVqc96uubA0ps+X3fnCCHLflU0r
	 0fpZCeaq8pQaJCWsdq9J28td/1MIUYkmRIcTUd4PcXApZpsJlW0FZ5wZ6OaDWH0/xG
	 OQpeqZB65r7V82PiVtdF/9BDDjLDXVRUEaIAdgRcsuDywDEV2uXMcnzSvNgwF9X7Pt
	 PPFEdllYhlDc/Ei+0/HDh1j/JG9YKgkd43bzNDZDJ5VHgYNqP89PZbrK+Dl8VjnCA0
	 iUW4PmwiW1bbIQ/eZdHgcvlkJuxWXR/ARBuzQVez4aqoopLaYaaJyxJYcqVQhs39cm
	 gHkL2135A3Q2g==
Date: Mon, 16 Mar 2026 17:13:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Christian Eggers <ceggers@arri.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the net tree
Message-ID: <abg6Ms9h71og0q7_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m09IT1SFcTDY8O0t"
Content-Disposition: inline


--m09IT1SFcTDY8O0t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/l2cap_core.c

between commit:

  e1d9a66889867 ("Bluetooth: LE L2CAP: Disconnect if received packet's SDU =
exceeds IMTU")

=66rom the net tree and commits:

  b65e87418bb37 ("Bluetooth: LE L2CAP: Disconnect if received packet's SDU =
exceeds IMTU")
  cb75c9a0505b8 ("Bluetooth: L2CAP: CoC: Disconnect if received packet size=
 exceeds MPS")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I note that the bluetooth tree does not seem to have merged up v7.0-rcX
at all.

diff --combined net/bluetooth/l2cap_core.c
index 5deb6c4f1e41d,475fdf1908cb8..0000000000000
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@@ -442,7 -442,7 +442,7 @@@ struct l2cap_chan *l2cap_chan_create(vo
  {
  	struct l2cap_chan *chan;
 =20
 -	chan =3D kzalloc(sizeof(*chan), GFP_ATOMIC);
 +	chan =3D kzalloc_obj(*chan, GFP_ATOMIC);
  	if (!chan)
  		return NULL;
 =20
@@@ -6675,6 -6675,13 +6675,13 @@@ static int l2cap_ecred_data_rcv(struct=20
  		return -ENOBUFS;
  	}
 =20
+ 	if (skb->len > chan->mps) {
+ 		BT_ERR("Too big LE L2CAP MPS: len %u > %u", skb->len,
+ 		       chan->mps);
+ 		l2cap_send_disconn_req(chan, ECONNRESET);
+ 		return -ENOBUFS;
+ 	}
+=20
  	chan->rx_credits--;
  	BT_DBG("chan %p: rx_credits %u -> %u",
  	       chan, chan->rx_credits + 1, chan->rx_credits);
@@@ -6958,7 -6965,7 +6965,7 @@@ static struct l2cap_conn *l2cap_conn_ad
  	if (!hchan)
  		return NULL;
 =20
 -	conn =3D kzalloc(sizeof(*conn), GFP_KERNEL);
 +	conn =3D kzalloc_obj(*conn);
  	if (!conn) {
  		hci_chan_del(hchan);
  		return NULL;

--m09IT1SFcTDY8O0t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4OjEACgkQJNaLcl1U
h9BtFAf/TEmtdWUdrqIYvY7jeZZdilsHOEhHwjzeZiiUKfVnPKJH2mhnhTQeWVQm
lS3a7bO4D/LZ4fjtNlFGQqwQIF42KlUUK3l9LarzURJor98/OQFOxuvxTiCehUkf
h2wyymhRKRv88GdWC51ntSIaQS+SSUZXEtCZqlCYhRCbDVjLjktQTSDMuHNOYmT0
ZPPfWmPrc2n2jfw08rR6YmtdYqHBmBjUCMHomJyNal9mIlzuM4i5YJ+eBqbrHuWi
fZnF/3Pcbfx1Fzbi8cJJFjY4yzM8X22BALZJaGvrez8qMRbU2yfUlZxrvi6qugoS
bMsEQSNfm8kXM9IJW5/Y2qVwMr13iQ==
=43mB
-----END PGP SIGNATURE-----

--m09IT1SFcTDY8O0t--
