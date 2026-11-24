Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542987;
	b=X4NiWkiCrHMhMtB/6eptU/zLXOz+3orJ2IxH2mAl3N+W1eTDXs0XL4bCmbYYHszmf5SM
	 74l0hN2ir6fIzL/4bEUD3eAMk08ppz/d7kl/g9oe8JMJkykCdlGgHsVpz9pcK+dgERksn
	 ogtJt3TXsnIWB6p8jgDrEDxwXX04Nn0Mvk/HbCvjZbMCRPD1LXx0cE0+QFPINurCGvAeR
	 PDo3GtQXzYrST98Rs9c28K9FZCuDecm6o3fQTxKrEZ1Ob/EozkLR4iqPYr56i0P2VWRj1
	 Qk3AJbu/bVQ3l9lowMwsAxKi1mGwb5S6i8K0SpvJX6myLZiEA6WnUTvls3HLtLxxmbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542987;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=6mQ/VJFURdk1Q4vp5BqueoOJTw6Ujqne9pFP3A2l2Mc=;
	b=ME+ovajHMdNoJf0pLIp7U0yD0R+WwluLRh3Pr9Gf5TpdBQT+hOH9Jr8o/UZU7PVd4MQf
	 YHS6ku26yDuAMHvvBmlt6YYsHG+5GWwFaDK8Ym45Mqv0gvDmDrKVQnQfv6Gfo4QNFzH+o
	 cQDBwZ9ptJXOrgu5QNHZcOTT3OCq46I8scDvg1oLBaTp0IZ18+hmjdVJhyvjzNMXgF2HM
	 SPuTS/XlPLByDlds4boKzlwI/1fjWFfKHyY5cBaYsG033NT0wiTHkt+uMpCcINvJNgrSc
	 3zoFBs1xd7WNo9CyGy4TRHc5rFTOwKvQf2ClLTHgN+NpZ3cJcRIzhRCq39zx+0RHGGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P9q/OfKR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04759606A321;
	Tue, 24 Nov 2026 17:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9q/OfKR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520F31F000C6;
	Tue, 24 Nov 2026 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542986;
	bh=6mQ/VJFURdk1Q4vp5BqueoOJTw6Ujqne9pFP3A2l2Mc=;
	h=Date:From:To:Cc:Subject;
	b=P9q/OfKRq3R5yrdwUaZS2l+7GDqvGQgQJXKq9DxhePTHBQlmh3ZWeMTEYPhPrJlIT
	 zNK56GTvk0kiD12vgBa1vNRuaYK4+LToXDTaUxw6/V5qXyq4WXGdDLWCugHg9Rv5Mj
	 Q58nlAw1Szx3pF8eRwhArZL4PbhRX/RKA38wSeN4dSmYUd6fXV+bJCuxt7Zv2/XJsB
	 2CnZq8Euu6jwCKHVUShx3AgMGL1456K1FDt2Q1dZL91qJJbWTer1zK43BPA1UD5eXL
	 1eNVD05vTCKgew4PoySGS24OYbDeOUuuLSmJ7mcP0bl9T1VNHXUHU60cO0LmWH8Lba
	 5TLO8qmCWxhfw==
Date: Tue, 24 Nov 2026 17:56:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the usb tree with the devictree tree
Message-ID: <awXPxgFucDwZGns_@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="QQlFctUlpS8E6PzQ"
Content-Disposition: inline


--QQlFctUlpS8E6PzQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  Documentation/devicetree/bindings/usb/ti,usb8041.yaml

between commit:

  dfbc74a8d6565 ("dt-bindings: usb: ti,usb8041: Fold in TI USB8020B")

=66rom the devictree tree and commit:

  8823bbefac755 ("dt-bindings: usb: ti,usb8041: document the TUSB8040A hub")

=66rom the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/usb/ti,usb8041.yaml
index 74021d13a43ac,a7ce487090a2a..0000000000000
--- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@@ -17,8 -16,10 +17,12 @@@ allOf
  properties:
    compatible:
      enum:
 +      - usb451,8025
 +      - usb451,8027
+       - usb451,8040
+       - usb451,8041
+       - usb451,8042
+       - usb451,8043
        - usb451,8140
        - usb451,8142
        - usb451,8440

--QQlFctUlpS8E6PzQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFz8YACgkQJNaLcl1U
h9CQ9Qf8DFd5QE6pmeCGvovoI9NLEaK+7iOWwjju+Dye6KzyMxBfTaOxb93oLz1i
VW32O+ZhiT3Fk21skLIbtTUs1vOrJlkItJCy3wzPP/c7l7Ghmr+VpcDJd1xhJbSb
CA2a4i3LmspObhnDNa23LdYuf0JsaJ5m7Z5g5Q0p584JknSG8CX3OisD+A6bNV76
JGunIWsn+D75Wm1He4wacP9kcHQJ75aZIAmFjcqUhuPSX9Sd/jWJuMjQ7MHDRNVZ
sMQ9RmQv/gZwbUwUS5MS9vIe6IdzsA07Syq/vjgGRVhpJtGDYmnJD9Y1pqJylSOZ
fYMB42SQo5myID8synP+rxhuE2n3JQ==
=1sDR
-----END PGP SIGNATURE-----

--QQlFctUlpS8E6PzQ--
