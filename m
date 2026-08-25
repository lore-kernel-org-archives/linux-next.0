Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FB24582D2;
	Tue, 25 Aug 2026 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663349; cv=none; b=W6ZDQixG8yT1ssmtcf05nsd5Ii0RyEuZngR7pQiXcPrnhuX3QTgTtJpDI7nkNKApQLAvscawS0mk6rCz8xl/UU84WVgjGOcHSk37fOex8XNtkYggIYDjBUBfBfQhRuCSYuL5mybK1HNKvu2HRRNMjKlNX6ci3nNaCUUeDw5cqeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663349; c=relaxed/simple;
	bh=6gwVpp8Vvt33aY8BrPZrX/BXvFdUkttaTC5rEYLOrz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjjD1mZalTXrGf+vnYzkD0BXHsetD+HaftlgqFuWj12JV1exErTxV+KMOfNUFrqXo2UMhanClguEROa5ru7dd9LPM+RWyyBlDAkmcwi7ILgoaQyWnOxRZ6X1/H7pevtnH7YscUQ43xGw2uX4xdr3mpB4qCf/wiev1NXiWVqLI5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcFcOEI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcFcOEI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27BD1F00A3A;
	Tue, 25 Aug 2026 13:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787663347;
	bh=p1m1Kya6rJxTgd/MndXlyfVMrjMTqJPGsqS0NkUNej0=;
	h=Date:From:To:Cc:Subject;
	b=QcFcOEI8HArTBadDsa+1dnZi0rcHELeUU6nWEHkJH6tjw212+jBSgfKybnwwXlXXj
	 P7ZnR86Lm8ocgP0pGajfy8J7gnKTI/6eQQhW1stsqotNZH6DEDpPrKMTV82zZOpS5H
	 5ILH743l9TI31R+uLpm+EvGdTt+r3+n4CHYnDzpL/cN16La7jeZKFz9P62+nrxq8e+
	 TmPaJfT4UieQxgQSKeYAxCV+dFQLj41wbIxPrmJbvJJx9ykeC+0z/1csiIBgEOqJmT
	 NftPnR+Pt4og+t6dZxnYHphNJ14T4/fhDfwZ4vcFc7tvnCUiqHMFK9FDz0Liq/BCHT
	 XawMC3OpbMurw==
Date: Tue, 25 Aug 2026 14:09:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Pauli Virtanen <pav@iki.fi>, Radek Podgorny <radek@podgorny.cz>
Subject: linux-next: manual merge of the bluetooth tree with the master tree
Message-ID: <ao2T73snYdj5OUsq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4IvUI059YNwQifbb"
Content-Disposition: inline


--4IvUI059YNwQifbb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/hci_sync.c

between commit:

  cb19774faa57c ("Bluetooth: hci_sync: Clear HCI_CMD_PENDING when dropping =
the last request")

=66rom the master tree and commits:

  ed516e3f1aa61 ("Bluetooth: hci_sync: Clear HCI_CMD_PENDING when dropping =
the last request")
  2fe8aa99af557 ("Bluetooth: hci_sync: Factor common cleanup code into a he=
lper")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined net/bluetooth/hci_sync.c
index ffd7b37e74018,24eeb76f72074..0000000000000
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@@ -5358,6 -5358,30 +5358,30 @@@ static int hci_dev_init_sync(struct hci
  	return ret;
  }
 =20
+ static void hci_dev_drop_last_cmd_req_and_close(struct hci_dev *hdev)
+ {
+ 	/* Drop last sent command */
+ 	if (hdev->sent_cmd) {
+ 		cancel_delayed_work_sync(&hdev->cmd_timer);
+ 		kfree_skb(hdev->sent_cmd);
+ 		hdev->sent_cmd =3D NULL;
+ 	}
+=20
+ 	/* Drop last request */
+ 	if (hdev->req_skb) {
+ 		kfree_skb(hdev->req_skb);
+ 		hdev->req_skb =3D NULL;
+ 		hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
+ 	}
+=20
+ 	clear_bit(HCI_RUNNING, &hdev->flags);
+ 	hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
+=20
+ 	/* After this point our queues are empty and no tasks are scheduled. */
+ 	hdev->close(hdev);
+ 	hdev->flags &=3D BIT(HCI_RAW);
+ }
+=20
  int hci_dev_open_sync(struct hci_dev *hdev)
  {
  	int ret;
@@@ -5444,23 -5468,7 +5468,7 @@@
  		if (hdev->flush)
  			hdev->flush(hdev);
 =20
- 		if (hdev->sent_cmd) {
- 			cancel_delayed_work_sync(&hdev->cmd_timer);
- 			kfree_skb(hdev->sent_cmd);
- 			hdev->sent_cmd =3D NULL;
- 		}
-=20
- 		if (hdev->req_skb) {
- 			kfree_skb(hdev->req_skb);
- 			hdev->req_skb =3D NULL;
- 			hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
- 		}
-=20
- 		clear_bit(HCI_RUNNING, &hdev->flags);
- 		hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
-=20
- 		hdev->close(hdev);
- 		hdev->flags &=3D BIT(HCI_RAW);
+ 		hci_dev_drop_last_cmd_req_and_close(hdev);
  	}
 =20
  done:
@@@ -5627,28 -5635,10 +5635,10 @@@ int hci_dev_close_sync(struct hci_dev *
  	skb_queue_purge(&hdev->cmd_q);
  	skb_queue_purge(&hdev->raw_q);
 =20
- 	/* Drop last sent command */
- 	if (hdev->sent_cmd) {
- 		cancel_delayed_work_sync(&hdev->cmd_timer);
- 		kfree_skb(hdev->sent_cmd);
- 		hdev->sent_cmd =3D NULL;
- 	}
-=20
- 	/* Drop last request */
- 	if (hdev->req_skb) {
- 		kfree_skb(hdev->req_skb);
- 		hdev->req_skb =3D NULL;
- 		hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
- 	}
-=20
- 	clear_bit(HCI_RUNNING, &hdev->flags);
- 	hci_sock_dev_event(hdev, HCI_DEV_CLOSE);
-=20
- 	/* After this point our queues are empty and no tasks are scheduled. */
- 	hdev->close(hdev);
+ 	/* Drop last sent command, last request and close */
+ 	hci_dev_drop_last_cmd_req_and_close(hdev);
 =20
  	/* Clear flags */
- 	hdev->flags &=3D BIT(HCI_RAW);
  	hci_dev_clear_volatile_flags(hdev);
  	hci_dev_clear_flag(hdev, HCI_CMD_DRAIN_WORKQUEUE);
 =20

--4IvUI059YNwQifbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqNk+4ACgkQJNaLcl1U
h9ACrgf/R9Vo96QOE+prrNTXRN05LxPEyxzZ5+ii6Fgae/8ETJPJeEFYS7mggA0x
kV7O4Ki0iCfclfutZ4lq/Sso++q4o+bJE73894QmlsJrXr2Uq/JheTT+6dS09fwM
xiTun26afEH/SZTu+bEk3lYenF73W76BAEPm/2uvg09rFbjzK7bOdxAr5YWcn7AB
hrrzznOG+PYp62ah2kX6FGGc8B1ywSqcic+Zh/xTA04YGtqpG7cjLpUru6dIwpuz
RYg1SOR8+ZZKipOqt5AarjH+gI5hpBzybTBSV1HrAFKYWIaSexOnswK12ZAKRWQL
bYdPxfpwOf5yB5UUeYRTYxUn+StaFA==
=/9hN
-----END PGP SIGNATURE-----

--4IvUI059YNwQifbb--
