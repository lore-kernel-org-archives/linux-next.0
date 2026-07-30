Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E182E6116;
	Thu, 30 Jul 2026 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417266; cv=none; b=IXDcxn0cNLBOgu+/v5s/MzW24yNy0YheJlWCaScURX2yh042D+3xfUcSYZr9xlA2zZZGWyw+3cr19zWt6UdSsTjO+sEQG6jw1v0wnjckX9gCqxZNaVm5OHXizGPiG9sDzyYCi5XNp872mutjz6OnkEElHIjQ4VWXQC1kL8kLodE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417266; c=relaxed/simple;
	bh=XTwyidK3+9h21bIvjitRJB+bHryghBlexz2QRRE2/lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YW64BTMor+CIKHP31Ig3EB2iNP9+X2rfhyf26861Xhm8qK5ml+vrbUmjiQEfkZFhUrJEX0M/XW2h6JBCxKGqDqIcpAU/fkt93HDKAp9ft2N0bP/krKv25XagchAj9Q/kJGqFDEEQaJH3d3CeV8O0D5N7gRHruPykm0sGPYjVor4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Taz1kpds; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Taz1kpds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15AA1F000E9;
	Thu, 30 Jul 2026 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785417265;
	bh=vM06txpIAlxq14jpmcKr9pebLGWip6qkw2IPtAPsPdU=;
	h=Date:From:To:Cc:Subject;
	b=Taz1kpdsXqVIz61OiuIJtU7kqd1sVibw5kow+4k832dSuqbv+FsJb0teXHQukyby+
	 3AR6iZY7e2VpTPVucWZ9sALCC6BObypvRGkUPrN5Uavhspcq3aWZTo3bLwnf7QKIsy
	 ULAW11sInPHwzqnXbz/Ywb96fseoHLcFWMfLdEPaT5MqjRnUgeVO3vc3sYvtiXrJ/6
	 /KgcN6AoTF1jnHPefmHoo3SFs1EqVPcgnFU2pWqaAcgETeH0r0/kNM+PEGmgsLBXH0
	 Lu+LFLAe3H35kJkvcJCUxSxasAdh3l242C7+Jft9quJipqeYhkkwGFwEjiJU9eob4q
	 /sHDOtDVbxuBA==
Date: Thu, 30 Jul 2026 14:14:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mediatek tree with the arm-soc tree
Message-ID: <amtOLXbCzi02cXlu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zV1sqQPc72kL+3rO"
Content-Disposition: inline


--zV1sqQPc72kL+3rO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mediatek tree got a conflict in:

  drivers/soc/mediatek/mt8167-mmsys.h

between commit:

  2fa28edca0f4f ("soc: mediatek: mtk-mmsys: Rework routes to specify compon=
ent ID")

=66rom the arm-soc tree and commit:

  bd3cbc42aa8cb ("soc: mediatek: mtk-mmsys: Rework routes to specify compon=
ent ID")

=66rom the mediatek tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Actuallly instead of this I took the mediatek tree side of things as
there was a build break resulting.  This all doesn't seem terribly
joined up...

diff --combined drivers/soc/mediatek/mt8167-mmsys.h
index 001379373507a,d579feee4212f..0000000000000
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@@ -10,29 -10,24 +10,24 @@@
  #define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
 =20
  #define MT8167_DITHER_MOUT_EN_RDMA0			0x1
- #define MT8167_DITHER_MOUT_EN_MASK			0x7
-=20
  #define MT8167_RDMA0_SOUT_DSI0				0x2
- #define MT8167_RDMA0_SOUT_MASK				0x3
-=20
  #define MT8167_DSI0_SEL_IN_RDMA0			0x1
- #define MT8167_DSI0_SEL_IN_MASK				0x3
 =20
  static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] =3D {
  	MMSYS_ROUTE(OVL, 0, COLOR, 0,
  		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
  		    OVL0_MOUT_EN_COLOR0),
  	MMSYS_ROUTE(DITHER, 0, RDMA, 0,
 -		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_R=
DMA0,
 +		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_M=
ASK,
  		    MT8167_DITHER_MOUT_EN_RDMA0),
  	MMSYS_ROUTE(OVL, 0, COLOR, 0,
  		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
  		    COLOR0_SEL_IN_OVL0),
  	MMSYS_ROUTE(RDMA, 0, DSI, 0,
 -		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_RDMA0,
 +		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
  		    MT8167_DSI0_SEL_IN_RDMA0),
  	MMSYS_ROUTE(RDMA, 0, DSI, 0,
 -		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_DS=
I0,
 +		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MA=
SK,
  		    MT8167_RDMA0_SOUT_DSI0),
  };
 =20

--zV1sqQPc72kL+3rO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprTiwACgkQJNaLcl1U
h9Dzjgf+PpwVzOv9ni/IcZrrWb4GtBE2/A/7IVg43P4RH2okXABiW0lTyewmxNid
SpfoarpfdSN6jXeBs9CEK0dJt18dpxRvtRCxRfhgOUko+7dkRNsQdnAEQv0amFm2
gg60vvylezqmygREaK3tOCVLq5b3DBi1pEwHv8D9JoLfQC4oTCBsQTB7ViKxQlv1
QafHFo3BmzO+3R+DvqFx9mRa5/cF3ipVbsFdjaiY/vxJoiQaZuvx5oE9XZiafiao
Oovt+N5XVKi1okn9Djld/VpsN2gvTS1J6AUP3V5dI0T6V8eQZjSHrWvYLby+wSJi
um2iidh9Oug3kWoHr9n/o1o9FuXMPw==
=5hRZ
-----END PGP SIGNATURE-----

--zV1sqQPc72kL+3rO--
