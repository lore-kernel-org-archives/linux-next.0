Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DDB3C3431;
	Thu, 12 Mar 2026 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321248; cv=none; b=DibsoXqi+FKayMuXFEruQuIG7Nmz4JHM1UtZ0T6oGuzgYtaBsODqNalYCUbVdBKJmKaH7/0c+oz3XHbIYRINVw5jDLZih78z0BwZTE7jxEbRRM/zg7FvmzrFhl0q9e9tCb80zlQV+O5V34Lhi+zYOKUevvQ4og3nnImuWElODXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321248; c=relaxed/simple;
	bh=mbU3z5usNLKIWL5X/Zu9nNiHg9JxGxzhfwRVZ+Qouqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RvNrwok8f3kcmfFIE6dfa0kYFI3NNeFdLCeZxsuuTe+4Mm8pYpJnARkV8G/WjWqTDsPl9Oi+rNwDIrvGlkaz62lAAIM5ECj5cfPLwsVf+IQbmttkWvHZQ+s3yVZd8oFlPzJuRKgMeyVJjr4s/63LKEeyBbDUGdooy5pGgV7w3eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKMH3gIj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKMH3gIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AF4C4AF0B;
	Thu, 12 Mar 2026 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773321248;
	bh=mbU3z5usNLKIWL5X/Zu9nNiHg9JxGxzhfwRVZ+Qouqo=;
	h=Date:From:To:Cc:Subject:From;
	b=SKMH3gIjDrQgXqPI9WOKFZfaET8T9LLua8SGzvfeD+Q5wnkaWQG4uQ+QIvKHmfyes
	 IJ2Y4H1xIZdPPyQ4dj7drOl2lHGSBoC5sD4t7CsS8Tbf/PmzQD8THVdI++U3A8Qi0K
	 fJEQcEbeVHtuduv/tOWo0Iwj2b4/a87TMI/5Cnzs9bsPl/pvPcGSQcsZo1BiOc+Ilg
	 7WOwNz9WuHbaiJ5ee0bK+lzCcLIJLbDQWArinEzNyJ6wAlfOamBd3NaKn6X8Zouejc
	 Q0+oxb4mV+uhAUDzOI06eoFQILpJAP7tYQRYZL72vNr+OCNUT+LYLHu3JhINeo3ofj
	 lFvPSVhPRJItg==
Date: Thu, 12 Mar 2026 13:14:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <abK8HK9tHmE7JC_6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="274IKMYisliaJKrx"
Content-Disposition: inline


--274IKMYisliaJKrx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/l2cap_core.c

between commit:

  c28d2bff70444 ("Bluetooth: L2CAP: Fix result of L2CAP_ECRED_CONN_RSP when=
 MTU is too short")

=66rom the origin tree and commit:

  19ba9c64840d4 ("Bluetooth: L2CAP: Fix accepting multiple L2CAP_ECRED_CONN=
_REQ")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined net/bluetooth/l2cap_core.c
index ad98db9632fd2,475fdf1908cb8..0000000000000
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
@@@ -1678,17 -1678,15 +1678,15 @@@ static void l2cap_info_timeout(struct w
 =20
  int l2cap_register_user(struct l2cap_conn *conn, struct l2cap_user *user)
  {
- 	struct hci_dev *hdev =3D conn->hcon->hdev;
  	int ret;
 =20
  	/* We need to check whether l2cap_conn is registered. If it is not, we
- 	 * must not register the l2cap_user. l2cap_conn_del() is unregisters
- 	 * l2cap_conn objects, but doesn't provide its own locking. Instead, it
- 	 * relies on the parent hci_conn object to be locked. This itself relies
- 	 * on the hci_dev object to be locked. So we must lock the hci device
- 	 * here, too. */
+ 	 * must not register the l2cap_user. l2cap_conn_del() unregisters
+ 	 * l2cap_conn objects under conn->lock, and we use the same lock here
+ 	 * to protect access to conn->users and conn->hchan.
+ 	 */
 =20
- 	hci_dev_lock(hdev);
+ 	mutex_lock(&conn->lock);
 =20
  	if (!list_empty(&user->list)) {
  		ret =3D -EINVAL;
@@@ -1709,16 -1707,14 +1707,14 @@@
  	ret =3D 0;
 =20
  out_unlock:
- 	hci_dev_unlock(hdev);
+ 	mutex_unlock(&conn->lock);
  	return ret;
  }
  EXPORT_SYMBOL(l2cap_register_user);
 =20
  void l2cap_unregister_user(struct l2cap_conn *conn, struct l2cap_user *us=
er)
  {
- 	struct hci_dev *hdev =3D conn->hcon->hdev;
-=20
- 	hci_dev_lock(hdev);
+ 	mutex_lock(&conn->lock);
 =20
  	if (list_empty(&user->list))
  		goto out_unlock;
@@@ -1727,7 -1723,7 +1723,7 @@@
  	user->remove(conn, user);
 =20
  out_unlock:
- 	hci_dev_unlock(hdev);
+ 	mutex_unlock(&conn->lock);
  }
  EXPORT_SYMBOL(l2cap_unregister_user);
 =20
@@@ -4616,7 -4612,8 +4612,8 @@@ static inline int l2cap_information_rsp
 =20
  	switch (type) {
  	case L2CAP_IT_FEAT_MASK:
- 		conn->feat_mask =3D get_unaligned_le32(rsp->data);
+ 		if (cmd_len >=3D sizeof(*rsp) + sizeof(u32))
+ 			conn->feat_mask =3D get_unaligned_le32(rsp->data);
 =20
  		if (conn->feat_mask & L2CAP_FEAT_FIXED_CHAN) {
  			struct l2cap_info_req req;
@@@ -4635,7 -4632,8 +4632,8 @@@
  		break;
 =20
  	case L2CAP_IT_FIXED_CHAN:
- 		conn->remote_fixed_chan =3D rsp->data[0];
+ 		if (cmd_len >=3D sizeof(*rsp) + sizeof(rsp->data[0]))
+ 			conn->remote_fixed_chan =3D rsp->data[0];
  		conn->info_state |=3D L2CAP_INFO_FEAT_MASK_REQ_DONE;
  		conn->info_ident =3D 0;
 =20
@@@ -5059,7 -5057,7 +5057,7 @@@ static inline int l2cap_ecred_conn_req(
  	u16 mtu, mps;
  	__le16 psm;
  	u8 result, rsp_len =3D 0;
- 	int i, num_scid;
+ 	int i, num_scid =3D 0;
  	bool defer =3D false;
 =20
  	if (!enable_ecred)
@@@ -5072,6 -5070,14 +5070,14 @@@
  		goto response;
  	}
 =20
+ 	/* Check if there are no pending channels with the same ident */
+ 	__l2cap_chan_list_id(conn, cmd->ident, l2cap_ecred_list_defer,
+ 			     &num_scid);
+ 	if (num_scid) {
+ 		result =3D L2CAP_CR_LE_INVALID_PARAMS;
+ 		goto response;
+ 	}
+=20
  	cmd_len -=3D sizeof(*req);
  	num_scid =3D cmd_len / sizeof(u16);
 =20
@@@ -5424,7 -5430,7 +5430,7 @@@ static inline int l2cap_ecred_reconf_rs
  					 u8 *data)
  {
  	struct l2cap_chan *chan, *tmp;
- 	struct l2cap_ecred_conn_rsp *rsp =3D (void *) data;
+ 	struct l2cap_ecred_reconf_rsp *rsp =3D (void *)data;
  	u16 result;
 =20
  	if (cmd_len < sizeof(*rsp))
@@@ -5432,7 -5438,7 +5438,7 @@@
 =20
  	result =3D __le16_to_cpu(rsp->result);
 =20
- 	BT_DBG("result 0x%4.4x", rsp->result);
+ 	BT_DBG("result 0x%4.4x", result);
 =20
  	if (!result)
  		return 0;
@@@ -6662,8 -6668,17 +6668,17 @@@ static int l2cap_ecred_data_rcv(struct=20
  		return -ENOBUFS;
  	}
 =20
- 	if (chan->imtu < skb->len) {
- 		BT_ERR("Too big LE L2CAP PDU");
+ 	if (skb->len > chan->imtu) {
+ 		BT_ERR("Too big LE L2CAP PDU: len %u > %u", skb->len,
+ 		       chan->imtu);
+ 		l2cap_send_disconn_req(chan, ECONNRESET);
+ 		return -ENOBUFS;
+ 	}
+=20
+ 	if (skb->len > chan->mps) {
+ 		BT_ERR("Too big LE L2CAP MPS: len %u > %u", skb->len,
+ 		       chan->mps);
+ 		l2cap_send_disconn_req(chan, ECONNRESET);
  		return -ENOBUFS;
  	}
 =20
@@@ -6689,7 -6704,9 +6704,9 @@@
  		       sdu_len, skb->len, chan->imtu);
 =20
  		if (sdu_len > chan->imtu) {
- 			BT_ERR("Too big LE L2CAP SDU length received");
+ 			BT_ERR("Too big LE L2CAP SDU length: len %u > %u",
+ 			       skb->len, sdu_len);
+ 			l2cap_send_disconn_req(chan, ECONNRESET);
  			err =3D -EMSGSIZE;
  			goto failed;
  		}
@@@ -6725,6 -6742,7 +6742,7 @@@
 =20
  	if (chan->sdu->len + skb->len > chan->sdu_len) {
  		BT_ERR("Too much LE L2CAP data received");
+ 		l2cap_send_disconn_req(chan, ECONNRESET);
  		err =3D -EINVAL;
  		goto failed;
  	}
@@@ -6947,7 -6965,7 +6965,7 @@@ static struct l2cap_conn *l2cap_conn_ad
  	if (!hchan)
  		return NULL;
 =20
 -	conn =3D kzalloc(sizeof(*conn), GFP_KERNEL);
 +	conn =3D kzalloc_obj(*conn);
  	if (!conn) {
  		hci_chan_del(hchan);
  		return NULL;

--274IKMYisliaJKrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyvBsACgkQJNaLcl1U
h9Co9Qf+Mmd7Wywe8Xy9FyPhQBDRcGdC50i3n/SBihT5AYiacoalsX4zQaajf4i5
kN8OyDry5JvQrCFo9fv6f6+iPvdnSJv9tjUqK7RrTAO33xWGxTxwlQt483/XBuAS
zD32HZETbJPKtCBugoKVLS4WnUbVwmqGg1nfVDeLgYqWifP3GrKohqrjD0clc9T1
6gA3IilQtNjUYYG2KG99azN9J7EDkxtV46lk1xGK0lZGIXz5PCi7GkE7esSeZoym
OP0wBS5MOmqRdOZZaZkuceL4657XhxQno0LqmVuf7P+VxDc0U+tDbgUMxU72YGNr
NcU8dVUhpJZwcvEu/ZSd+IyxAbSyzw==
=WODg
-----END PGP SIGNATURE-----

--274IKMYisliaJKrx--
