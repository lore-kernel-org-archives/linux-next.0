Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533744;
	b=SBO7QQ/pBWlAxH8Ju0dRysrfKrrhC70uYdnnUOYAtM6r9GfuxJog1kxuh4ExEkNKPhsm
	 N9NqQYg9D+AOzi4Pcw/pTPknbVVEyesn3retIKM81bCojS4LOwaBUwd4QvEheQjj+WH9Z
	 7UPc7GBGM2aDqR2NaCigAWtAZe0CP0c2gIx07I17HddKTZXxaIBIl5Ie4TVq6vN/Lozkm
	 KEPc7xMDSQzaWK9UvzbxywWfQmmzRq5cl0fqpcTl1vccMf9NSP5YZauZCEMMSEP7y5haA
	 Og9C52X7efA9gKtUhcU+ogGJVRGAZWl8xC+PoZ26aoY/JykwyvVegEVk3yJ54/dgR9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533744;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=pITt0jAJhJgGc+5GscgBEuzJHxVCeUfkxDUlktCliDM=;
	b=O/DdmoDctA50bKmwe98lCSX6n3GlgFQLl+aUsof3a1NeOFO6MP4PbCtDEA1HSi24tXZm
	 4+Tj8GEqFNGOwLv6yh6ubJBg4JudV+bHGfvdDnE1FFdGHrXG7/7yet/yJe/hwRG0DLc9a
	 8gu8keffClZvVX6dPlXpX8HFtA4gOq2Ih1N9vgHQ4U6jXyRZ4KZxQE8OnEhbOEx771T/2
	 XchTgXQFwa2rttK5S5v8ZUim8RIiFawf8Mb/0Bt5zxZbatOgUnmphd3+ILEZAdm0vJQNX
	 90x05maGMj/v2/6q2nf186Bd6Qk01h9C+7OGme8G6qhHftOU8Viv2ja2nUAGnO38CaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2fSPo39;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8474606A31E;
	Tue, 24 Nov 2026 15:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2fSPo39
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC391F000D8;
	Tue, 24 Nov 2026 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533743;
	bh=pITt0jAJhJgGc+5GscgBEuzJHxVCeUfkxDUlktCliDM=;
	h=Date:From:To:Cc:Subject;
	b=L2fSPo39+j57jkfkqSvC1ilzYNtCtCB9Ktc/F2S/a/gbWpsHkvf7HNK9J3Zm4O2U7
	 uKW3PqKwy/16WCEkpR/OMPX+zaT3ynCPr07HHW4vu1/O6cOIJ3ZpVT8eo0KqKAZ5JC
	 jFKBuWE1gz5jDiBEgRLno3Rl8JZmYN//C4yGHha3z3HO7x3ogyP+RTsFLZjZwPn4Pa
	 VV3zn7ClOCke0/ghWT6cut7z5AH/bmR122+DqzZEe0ipJbpztzoBP0d/0YwNly4Ulm
	 1mc3t7UhtfmMb68Vu0H7EflwiwvIUh19wPi0+FXgF2MzKZDenaorCnxSMbY1M1n0Xt
	 p4/cXeQVARVMA==
Date: Tue, 24 Nov 2026 15:22:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <awWrqsgnnavR_Uq2@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WFdl5MNK9fW7/LdH"
Content-Disposition: inline


--WFdl5MNK9fW7/LdH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  drivers/bluetooth/hci_qca.c

between commits:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")
  7a4e97161014d ("Merge tag 'for-net-2026-11-17' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/bluetooth/bluetooth")

=66rom the origin tree and commits:

  a482935cee71d ("Bluetooth: hci_qca: Embed bt_power in struct qca_serdev")
  ca2e671a82f00 ("Bluetooth: hci_qca: Flatten struct qca_power into struct =
qca_serdev")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/bluetooth/hci_qca.c
index 158f294c18902,d51db761f5a6d..0000000000000
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@@ -2436,9 -2476,9 +2476,9 @@@ static int qca_serdev_probe(struct serd
  	struct hci_dev *hdev;
  	const struct qca_device_data *data;
  	int err;
- 	bool power_ctrl_enabled =3D true;
+ 	bool bt_en_available =3D true;
 =20
 -	qcadev =3D devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 +	qcadev =3D devm_kzalloc_obj(&serdev->dev, *qcadev);
  	if (!qcadev)
  		return -ENOMEM;
 =20

--WFdl5MNK9fW7/LdH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFq6kACgkQJNaLcl1U
h9CWdgf+N2q7YMxIs0hrRHSm0SK3ngRjMou8s5ho81qYxJ69mSbn5UwXhLJ2DNjg
5NxARsdIHV5eUt9hi6T0gCEVsxc7U3hrbAnFf37HlU3MA5nLXSC5lWTZ5WsuPooZ
kY93dbW5YqIxkaw9X9hmjnx1hufW5FpiF79DkfK4kdfNQ3bho/LGEAqKqEaSmKBQ
NyPLNYQ5yvTw5APqaVolHgLe9Sd+Q5vXsi617K67xNRlrPo27fgynEZUIFZLIftM
7HKmmNsE45VXWLAzkUbMnjL8zZbiiO6rA2pCefiZbqgXgrFvSytjnqKnU1OaC0ZX
M5wF+7bR9Ctv/UH7z8uUSiPfNWcsHQ==
=vGv1
-----END PGP SIGNATURE-----

--WFdl5MNK9fW7/LdH--
