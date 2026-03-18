Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE631353B;
	Wed, 18 Mar 2026 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844118; cv=none; b=nXdPHKfe+Lu+FORIti85GFPQNbxXXua7vr3CgJga/Mo5tMTd0kih+x+PlGvc0hSDEnFVTBjNFHtE6RI2sFY1PpahUzIO8B/EMXW9CU+Wh8liHnyD5nx/6sYcyy6wDM3L9bW7sAsHjORRGBYqhBTHbnTsi5hDL3dUYNxcd0eIyH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844118; c=relaxed/simple;
	bh=W4SexwZ3Diy9w5afXTF0zprdgXABPlGA5hJR4MJJdd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g5aOWeM0VnO38rk2L/uMaqIVBep5rkBlKFb4agdRpZ9qo1QYverEwsKsINtq1ALkNPwJcr/749sWWI9zdJwLU96ssRy61EUwU/L1We9L8n8PC7fLUvX8OEhfpqsuR2eNt/F2XGc+FROa4apc+rJa9uR6EQczfcJQwemseYokcWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcZ6rZmh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcZ6rZmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7792EC19421;
	Wed, 18 Mar 2026 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844118;
	bh=W4SexwZ3Diy9w5afXTF0zprdgXABPlGA5hJR4MJJdd0=;
	h=Date:From:To:Cc:Subject:From;
	b=DcZ6rZmhox3L9iQFynGSjBYQGFwB0mve8ytieClBnup4AY6fqYTOlGgqIGuE6b9tl
	 vdvMJFj7MuOhpm1twEh1JQJ8B7NlZu/kRJxatj3hnYn3rvtZfWeBRUZ/j/0C8ujjf+
	 VRZk3Rg3MAIGlm6eKtBdS8ycr+dqjuJnT1+Iyt9iZPRkqy6Zu+joR9MVg6F5eCj0VM
	 nwDPCealER90aU+Uux7MzxPQG5OrZNQWrtLE6nw7zK2f7FZfeRE4jxuzqlQ+Q44ben
	 GBS4Q4T1NJDsHdQ+LlqZwBkXQmSWqbG8RkXHBIVIbiRPEKRnTJoflzu3G5A7iryG4h
	 WCT4ZbV1q892A==
Date: Wed, 18 Mar 2026 14:28:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Christian Eggers <ceggers@arri.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the net tree
Message-ID: <abq2ksgs5pn3QPk-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8KlvfE3oRHu7Gcdw"
Content-Disposition: inline


--8KlvfE3oRHu7Gcdw
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

  fa768fce4aae7 ("Bluetooth: LE L2CAP: Disconnect if received packet's SDU =
exceeds IMTU")
  ef20d3012d9e4 ("Bluetooth: L2CAP: CoC: Disconnect if received packet size=
 exceeds MPS")
  013598897448b ("Bluetooth: L2CAP: Fix printing wrong information if SDU l=
ength exceeds MTU")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined net/bluetooth/l2cap_core.c
index 5deb6c4f1e41d,ead51dc0f3f12..0000000000000
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@@ -5081,14 -5081,14 +5081,14 @@@ static inline int l2cap_ecred_conn_req(
  	cmd_len -=3D sizeof(*req);
  	num_scid =3D cmd_len / sizeof(u16);
 =20
- 	/* Always respond with the same number of scids as in the request */
- 	rsp_len =3D cmd_len;
-=20
  	if (num_scid > L2CAP_ECRED_MAX_CID) {
  		result =3D L2CAP_CR_LE_INVALID_PARAMS;
  		goto response;
  	}
 =20
+ 	/* Always respond with the same number of scids as in the request */
+ 	rsp_len =3D cmd_len;
+=20
  	mtu  =3D __le16_to_cpu(req->mtu);
  	mps  =3D __le16_to_cpu(req->mps);
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
@@@ -6690,6 -6697,11 +6697,11 @@@
  	if (!chan->sdu) {
  		u16 sdu_len;
 =20
+ 		if (!pskb_may_pull(skb, L2CAP_SDULEN_SIZE)) {
+ 			err =3D -EINVAL;
+ 			goto failed;
+ 		}
+=20
  		sdu_len =3D get_unaligned_le16(skb->data);
  		skb_pull(skb, L2CAP_SDULEN_SIZE);
 =20
@@@ -6698,7 -6710,7 +6710,7 @@@
 =20
  		if (sdu_len > chan->imtu) {
  			BT_ERR("Too big LE L2CAP SDU length: len %u > %u",
- 			       skb->len, sdu_len);
+ 			       sdu_len, chan->imtu);
  			l2cap_send_disconn_req(chan, ECONNRESET);
  			err =3D -EMSGSIZE;
  			goto failed;

--8KlvfE3oRHu7Gcdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm6tpEACgkQJNaLcl1U
h9D4GQf/Ysu+65O7fyuQlfPs40ZVUuSMtYRoQ7epqs0e9rwuliCAckPi2a6oJOIT
NMzi/Cu9IufM0AVkj6xaQC4qDHXdBHnJTUS7R/Rlbn0oqCCYt8yjg4x/vnPM+5az
mAgON0XRhks2acVjldIwLDsrxItEOuINvUv3vbW0bF4dsu2zOHEqqyf0K7fo7Nl/
N9OLpcOkUSsL6ry/qPH2oAGCdSykWfCYCszG8g73ddh7v7iv+HbXfgcuMTu/7k//
nIWSfWcYIfXkKDN+nxxaaUv8kDbjUS3UVGQk8VW/u4JoJTSRu8esH8mQLBCMlxri
14B4wW+HP3a1o0ON99yifWez3CNVUQ==
=UqZO
-----END PGP SIGNATURE-----

--8KlvfE3oRHu7Gcdw--
