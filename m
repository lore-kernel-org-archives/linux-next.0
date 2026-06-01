Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8423BFE3E;
	Mon,  1 Jun 2026 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325329; cv=none; b=c589CuZl/4CamiekWxnejOC0hdFDuZbii2nPLxJDE/uM9lrkc7mlJTTj5XkzT3hJZ8xVqN3VsK3x6QUlr5CAotyWEZFGLzh8yNKnF26UHDyosQX+hU4+3afWhuFHp+IjAYvHpVYCTzx+k77ooCIE6vpNK9phXIPjBVi07Sl8sro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325329; c=relaxed/simple;
	bh=EGO+cf+qlSP6wMDgUJyTRigHHAJMv+fwMqNYE+NwFtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dkf4rUp1GleKIl3n70ndoRcrEBZbEb3XRUsOwZp/g6hgmRgXWX2P0HdmZ4yMDWD8CRpn1eq3tdNFjw1KZJ0jhV9yJ7i/IeTIyFQH0gZqidAjYJTniSPv36YIuxO0t/RwHPYAQ5tNVxTAaM3iXK3r77R5KTQeZyxNdyBPb3zbPik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltGxEhOI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltGxEhOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD6D1F00893;
	Mon,  1 Jun 2026 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780325328;
	bh=hBa7pYtvgcfUmpDsR4wyEIs1R9x8m9tWS1Q/yluF2SI=;
	h=Date:From:To:Cc:Subject;
	b=ltGxEhOIXcFv5mP/8AnDJj+QYDtZlBAr2p7U4FIKGcF6X+2aDnXaj05HmhoIlNn6K
	 zTf2olNXZDRAy/575lQdJ5hg6zjZSYuuLG1dRznd/7VE8RwohI3YV6GMzF6EfDCLaA
	 52BVwZI0YMWp6l1Bu2XMv5MycVxOJBBi49pOPCOvD+zBtVt/2WiDMR5Ai6aNXbj44k
	 LLGIp0mufqrNFjxlJ0pX7A7+ktsFCTyC2gbSCELMvfUNaJUzSvUJTUnfNTZtPbdoR9
	 TU2kUp4g4hl7z/2VvbbEZoyGBtMniwI81oi/UAAbK6zDUElyY08aOlgVDnOZWZjJYF
	 tmRV9tworlv0Q==
Date: Mon, 1 Jun 2026 15:48:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Dudu Lu <phx0fer@gmail.com>, Jann Horn <jannh@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <ah2bzMouvFUsFZK8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hIai62a3f7jVbrAv"
Content-Disposition: inline


--hIai62a3f7jVbrAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/bnep/core.c

between commits:

  59e932ded949f ("Bluetooth: bnep: Fix UAF read of dev->name")
  72b8deccff17a ("Bluetooth: bnep: fix incorrect length parsing in bnep_rx_=
frame() extension handling")

=66rom the origin tree and commits:

  feaef2aa27201 ("Bluetooth: bnep: fix incorrect length parsing in bnep_rx_=
frame() extension handling")
  ffeee619a13bf ("Bluetooth: bnep: Fix UAF read of dev->name")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined net/bluetooth/bnep/core.c
index 0de5df690bd0b,5c5f53ff30e8e..0000000000000
--- a/net/bluetooth/bnep/core.c
+++ b/net/bluetooth/bnep/core.c
@@@ -206,14 -206,11 +206,11 @@@ static int bnep_ctrl_set_mcfilter(struc
  	return 0;
  }
 =20
- static int bnep_rx_control(struct bnep_session *s, void *data, int len)
+ static int bnep_rx_control_cmd(struct bnep_session *s, u8 cmd, void *data,
+ 			       int len)
  {
- 	u8  cmd =3D *(u8 *)data;
  	int err =3D 0;
 =20
- 	data++;
- 	len--;
-=20
  	switch (cmd) {
  	case BNEP_CMD_NOT_UNDERSTOOD:
  	case BNEP_SETUP_CONN_RSP:
@@@ -254,6 -251,14 +251,14 @@@
  	return err;
  }
 =20
+ static int bnep_rx_control(struct bnep_session *s, void *data, int len)
+ {
+ 	if (len < 1)
+ 		return -EILSEQ;
+=20
+ 	return bnep_rx_control_cmd(s, *(u8 *)data, data + 1, len - 1);
+ }
+=20
  static int bnep_rx_extension(struct bnep_session *s, struct sk_buff *skb)
  {
  	struct bnep_ext_hdr *h;
@@@ -299,19 -304,26 +304,26 @@@ static int bnep_rx_frame(struct bnep_se
  {
  	struct net_device *dev =3D s->dev;
  	struct sk_buff *nskb;
+ 	u8 *data;
  	u8 type, ctrl_type;
 =20
  	dev->stats.rx_bytes +=3D skb->len;
 =20
- 	type =3D *(u8 *) skb->data;
- 	skb_pull(skb, 1);
- 	ctrl_type =3D *(u8 *)skb->data;
+ 	data =3D skb_pull_data(skb, sizeof(type));
+ 	if (!data)
+ 		goto badframe;
+ 	type =3D *data;
 =20
  	if ((type & BNEP_TYPE_MASK) >=3D sizeof(__bnep_rx_hlen))
  		goto badframe;
 =20
  	if ((type & BNEP_TYPE_MASK) =3D=3D BNEP_CONTROL) {
- 		if (bnep_rx_control(s, skb->data, skb->len) < 0) {
+ 		data =3D skb_pull_data(skb, sizeof(ctrl_type));
+ 		if (!data)
+ 			goto badframe;
+ 		ctrl_type =3D *data;
+=20
+ 		if (bnep_rx_control_cmd(s, ctrl_type, skb->data, skb->len) < 0) {
  			dev->stats.tx_errors++;
  			kfree_skb(skb);
  			return 0;
@@@ -324,24 -336,27 +336,31 @@@
 =20
  		/* Verify and pull ctrl message since it's already processed */
  		switch (ctrl_type) {
- 		case BNEP_SETUP_CONN_REQ:
- 			/* Pull: ctrl type (1 b), len (1 b), data (len bytes) */
- 			if (!skb_pull(skb, 2 + *(u8 *)(skb->data + 1) * 2))
+ 		case BNEP_SETUP_CONN_REQ: {
+ 			u8 uuid_size;
+=20
+ 			/* Pull uuid_size and the dst/src service UUIDs. */
+ 			data =3D skb_pull_data(skb, sizeof(uuid_size));
+ 			if (!data)
+ 				goto badframe;
+ 			uuid_size =3D *data;
+ 			if (!skb_pull(skb, uuid_size + uuid_size))
  				goto badframe;
  			break;
+ 		}
  		case BNEP_FILTER_MULTI_ADDR_SET:
 -		case BNEP_FILTER_NET_TYPE_SET:
 -			/* Pull: len (2 b), data (len bytes) */
 -			data =3D skb_pull_data(skb, sizeof(u16));
 -			if (!data)
 +		case BNEP_FILTER_NET_TYPE_SET: {
 +			u8 *hdr;
 +
 +			/* Pull ctrl type (1 b) + len (2 b) */
 +			hdr =3D skb_pull_data(skb, 3);
 +			if (!hdr)
  				goto badframe;
 -			if (!skb_pull(skb, get_unaligned_be16(data)))
 +			/* Pull data (len bytes); length is big-endian */
 +			if (!skb_pull(skb, get_unaligned_be16(&hdr[1])))
  				goto badframe;
  			break;
 +		}
  		default:
  			kfree_skb(skb);
  			return 0;

--hIai62a3f7jVbrAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodm8sACgkQJNaLcl1U
h9AFmgf/XaEVORWWUImeqd2gMQ4ohNkHCKBZg0b6lpNG0PQk/te7apAUf2wCEF0u
vPqc0+ChFCrw18Ch2OjqazdwUIEt6ORQy/j6/meXtjaJlySghK9ufB5gsB0hqoP1
3yyrVjc8S23Qq2ekrJY+AZ+ezQXwH+OU/xV9Zc6rCx5pIBVc2fOI2Ay9Yd+IS2AZ
HDAK9GpqkRtJUqtszKlCLHbhmxuhFbTZ9sJ5NEwcKc+BTj42DcCavmWYI1UgAfr3
qPT868ZpJ9lmhoqXFxyRP62VOQAK0ElL1pmz6BuFUkgLXcCM9K1BG0XWzDOP3jvV
sT4gcXbK08anRGqqC5MCcFDLmecmEg==
=rXn+
-----END PGP SIGNATURE-----

--hIai62a3f7jVbrAv--
