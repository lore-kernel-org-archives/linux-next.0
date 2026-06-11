Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D345E1A9B46;
	Thu, 11 Jun 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185514; cv=none; b=OWxYJzgsHRtx8adma0iMt4Z3XE1WXgldMDu1GSa7+glbw0auGlGxQaUj32heZ70JNnBnM+NZBGgtpAJ7R8BFoKwU1qPzLCJjvTwriRtETcQuy0D1qKpogMTXzwqj/8bqMJTxCra8JwkyCBAVp7g4Kw/pgjs7zhU5W3QwpIImvL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185514; c=relaxed/simple;
	bh=+2+ajvymUJ5N4QqN5W22MevGbqmTZxwTxGsxCQ0BNsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TVa1mWxrG0CIG67vzoA8EZXPPgVsYdpyWw8C6FZ4YbLqvi1s4ibzbSm35uoduQAKuX8JXxLp2C9Qpu5BJEMqa/IzI7SsFb5bUFHYerLoAwXAtpGZwrk2Y8E13CTfdabIysb/ff3Y9aTcRoUvWnGWMCkIghLxZMI9QhZPmU8x5GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3BnX5W7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3BnX5W7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231011F00893;
	Thu, 11 Jun 2026 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781185512;
	bh=K31aCyJrJDXjyC8XgrkX7UMg362FqfHqOndUZrr46Fg=;
	h=Date:From:To:Cc:Subject;
	b=H3BnX5W7+ivjMiHYrhCWf8/a6wRh8KRnKrFw4jb1ygjFyEMTF3vmF1kgxf+pfcuuS
	 U/nVC50PSpgGo2e69yeOnhgHVsngpeI1SJhIJJecPggiQxXT5AVD6MigUIHe1zpeEn
	 6dgakUvgOVrpNXN4OVflf1AU9J/giYd92paygbXtHnyoNDHyQd1kZRAas+6ONCjoUY
	 hBcHXnu0QFBV6P2NszNqKU0dG3DmNGE5Yh2z1H3EvdE5ef7IF5k6fxYAP3OvDQ8GsE
	 1qk5r2phiYv3EoGTxI31KrHh1HJxyVbDoR1SJUaCHEpl8Cpe0dTnlz8L13efm9lQuV
	 s2nnhrbCho/eQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 624FA1AC56C6; Thu, 11 Jun 2026 14:45:09 +0100 (BST)
Date: Thu, 11 Jun 2026 14:45:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Simon Horman <horms@verge.net.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Marco Elver <elver@google.com>, Siwei Zhang <oss@fourdim.xyz>
Subject: linux-next: manual merge of the ipvs-next tree with the origin tree
Message-ID: <aiq75YYylC-GAy79@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k7nmJwZiENRHEtlY"
Content-Disposition: inline


--k7nmJwZiENRHEtlY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ipvs-next tree got a conflict in:

  net/bluetooth/l2cap_core.c

between commit:

  9dbd84990394c5 ("Bluetooth: L2CAP: fix chan ref leak in l2cap_chan_timeou=
t() on !conn")

=66rom the origin tree and commit:

  06528e2f5fc933 ("Bluetooth: L2CAP: Fix UAF in channel timeout by holding =
conn ref")

=66rom the ipvs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined net/bluetooth/l2cap_core.c
index c4ccfbda9d7890,62133eef9d2fea..00000000000000
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@@ -1,3 -1,4 +1,4 @@@
+ // SPDX-License-Identifier: GPL-2.0
  /*
     BlueZ - Bluetooth protocol stack for Linux
     Copyright (C) 2000-2001 Qualcomm Incorporated
@@@ -8,10 -9,6 +9,6 @@@
 =20
     Written 2000,2001 by Maxim Krasnyansky <maxk@qualcomm.com>
 =20
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License version 2 as
-    published by the Free Software Foundation;
-=20
     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RI=
GHTS.
@@@ -411,7 -408,7 +408,7 @@@ static void l2cap_chan_timeout(struct w
 =20
  	BT_DBG("chan %p state %s", chan, state_to_string(chan->state));
 =20
- 	if (!conn) {
+ 	if (test_bit(FLAG_DEL, &chan->flags)) {
  		l2cap_chan_put(chan);
  		return;
  	}
@@@ -422,6 -419,9 +419,9 @@@
  	 */
  	l2cap_chan_lock(chan);
 =20
+ 	if (test_bit(FLAG_DEL, &chan->flags))
+ 		goto unlock;
+=20
  	if (chan->state =3D=3D BT_CONNECTED || chan->state =3D=3D BT_CONFIG)
  		reason =3D ECONNREFUSED;
  	else if (chan->state =3D=3D BT_CONNECT &&
@@@ -434,10 -434,10 +434,10 @@@
 =20
  	chan->ops->close(chan);
 =20
+ unlock:
  	l2cap_chan_unlock(chan);
- 	l2cap_chan_put(chan);
-=20
  	mutex_unlock(&conn->lock);
+ 	l2cap_chan_put(chan);
  }
 =20
  struct l2cap_chan *l2cap_chan_create(void)
@@@ -490,6 -490,9 +490,9 @@@ static void l2cap_chan_destroy(struct k
  	list_del(&chan->global_l);
  	write_unlock(&chan_list_lock);
 =20
+ 	if (chan->conn)
+ 		l2cap_conn_put(chan->conn);
+=20
  	kfree(chan);
  }
 =20
@@@ -593,7 -596,7 +596,7 @@@ void __l2cap_chan_add(struct l2cap_con
 =20
  	conn->disc_reason =3D HCI_ERROR_REMOTE_USER_TERM;
 =20
- 	chan->conn =3D conn;
+ 	chan->conn =3D l2cap_conn_get(conn);
 =20
  	switch (chan->chan_type) {
  	case L2CAP_CHAN_CONN_ORIENTED:
@@@ -648,30 -651,26 +651,26 @@@ void l2cap_chan_add(struct l2cap_conn *
 =20
  void l2cap_chan_del(struct l2cap_chan *chan, int err)
  {
- 	struct l2cap_conn *conn =3D chan->conn;
-=20
  	__clear_chan_timer(chan);
 =20
- 	BT_DBG("chan %p, conn %p, err %d, state %s", chan, conn, err,
+ 	BT_DBG("chan %p, err %d, state %s", chan, err,
  	       state_to_string(chan->state));
 =20
  	chan->ops->teardown(chan, err);
 =20
- 	if (conn) {
+ 	if (!test_and_set_bit(FLAG_DEL, &chan->flags)) {
  		/* Delete from channel list */
  		list_del(&chan->list);
 =20
  		l2cap_chan_put(chan);
 =20
- 		chan->conn =3D NULL;
-=20
  		/* Reference was only held for non-fixed channels or
  		 * fixed channels that explicitly requested it using the
  		 * FLAG_HOLD_HCI_CONN flag.
  		 */
  		if (chan->chan_type !=3D L2CAP_CHAN_FIXED ||
  		    test_bit(FLAG_HOLD_HCI_CONN, &chan->flags))
- 			hci_conn_drop(conn->hcon);
+ 			hci_conn_drop(chan->conn->hcon);
  	}
 =20
  	if (test_bit(CONF_NOT_COMPLETE, &chan->conf_state))
@@@ -1903,7 -1902,7 +1902,7 @@@ static void l2cap_monitor_timeout(struc
 =20
  	l2cap_chan_lock(chan);
 =20
- 	if (!chan->conn) {
+ 	if (test_bit(FLAG_DEL, &chan->flags)) {
  		l2cap_chan_unlock(chan);
  		l2cap_chan_put(chan);
  		return;
@@@ -1924,7 -1923,7 +1923,7 @@@ static void l2cap_retrans_timeout(struc
 =20
  	l2cap_chan_lock(chan);
 =20
- 	if (!chan->conn) {
+ 	if (test_bit(FLAG_DEL, &chan->flags)) {
  		l2cap_chan_unlock(chan);
  		l2cap_chan_put(chan);
  		return;
@@@ -2565,7 -2564,7 +2564,7 @@@ int l2cap_chan_send(struct l2cap_chan *
  	int err;
  	struct sk_buff_head seg_queue;
 =20
- 	if (!chan->conn)
+ 	if (test_bit(FLAG_DEL, &chan->flags))
  		return -ENOTCONN;
 =20
  	/* Connectionless channel */
@@@ -3160,12 -3159,16 +3159,16 @@@ static void l2cap_ack_timeout(struct wo
 =20
  	l2cap_chan_lock(chan);
 =20
+ 	if (test_bit(FLAG_DEL, &chan->flags))
+ 		goto unlock;
+=20
  	frames_to_ack =3D __seq_offset(chan, chan->buffer_seq,
  				     chan->last_acked_seq);
 =20
  	if (frames_to_ack)
  		l2cap_send_rr_or_rnr(chan, 0);
 =20
+ unlock:
  	l2cap_chan_unlock(chan);
  	l2cap_chan_put(chan);
  }
@@@ -7026,6 -7029,11 +7029,11 @@@ static void l2cap_recv_frame(struct l2c
  		break;
 =20
  	case L2CAP_CID_CONN_LESS:
+ 		if (skb->len < L2CAP_PSMLEN_SIZE) {
+ 			kfree_skb(skb);
+ 			break;
+ 		}
+=20
  		psm =3D get_unaligned((__le16 *) skb->data);
  		skb_pull(skb, L2CAP_PSMLEN_SIZE);
  		l2cap_conless_channel(conn, psm, skb);

--k7nmJwZiENRHEtlY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoqu+QACgkQJNaLcl1U
h9AWXAf/XsbnFTJCW1fVSYDsBveZPqyQTZ7kM7JSRoiuEBkmEGfAuCq9sWM7nCC2
zsiVVSK1Ln0yfY6Rri1VIwwiIRYXzugHny+XHqbqiflkzJOoP1IBIQ08oM502wOi
vVpsYUXZt7DjkwQyqawbEnhAiaQ5wWXIvnwnVP2+VYtURJynWA9HCF5BcIiot+rS
gZCWE8irY2iCMa5+OrSC/5KewPbRemqtM/kD4aAtReYNVqslDaYUGb0BPrM5cTaW
758r0Zk9Ln/bUPx6dHVDpprgiXuftBUj71JlYPSsTscSRBMJfd8j0KNR7Kq6XXEO
F/vPWQ536caAbiKiYrY8NcKlqXGXbw==
=aKO0
-----END PGP SIGNATURE-----

--k7nmJwZiENRHEtlY--
