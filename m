Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79D32DA76A;
	Fri, 31 Jul 2026 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508410; cv=none; b=j9alYUdG9rALA5DpKDsSEw6IF/ca1LC9nFpw3L9mg0pcd/ESwLVlW0mfQt/2XoK96OEFapiWTyPQ4SQ0A8u4BXSYDjQ2BwU80sYOZY81aunRfP+B6dID9E2B3THLh06DvhgwOL3D3n53e0ywxWxukQla3BnoCMkwL8cTobQ7fVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508410; c=relaxed/simple;
	bh=2FU0jx+XR8bbqUiSaDb9efCB0uAZ1eM2bIRttFMTnQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOaGKKpMejH7l32RUxw6oUoEEd3xM1OUD6e0RJiqNZd7PxAQUrveBuuTh6KvREhhB2pUscqxH8up8gTLT8ghYT0p34xNMSv4503C47AiG6LhhcpYp+NNo1m2wUVtf0qGiaiubc1T9xDYrQeHqt3C36TtQ4AT8yYyhC2vowefAVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OX+fD/9s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OX+fD/9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DC21F000E9;
	Fri, 31 Jul 2026 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785508408;
	bh=CtjtRF9Tkl8Fgd23W4w7Sdfm2KIhWvg0Hv4W5MGL260=;
	h=Date:From:To:Cc:Subject;
	b=OX+fD/9sXcpnfAlQY3920IhPSsPplay5nOklEE0kQoSindZmbfZHFPq8Q+Nm29/1Y
	 yoOl6pQ3qvciO7HtVP2FTizYkgsbGQGnxnQi+dVyg2IF9g1ym01W2E8quUlc4C9bsv
	 YDz3OYeaMgGskAtnv9E0F+vMzWQoWry94I2H6lDuleBKJgu2r80mt7Zkfti/RIYSXr
	 9sZZa2lbXq4JPciacO0bAfo/ed3F/+5gfB2sM5k8dUdpIyBxhcDRmkDmEZ4PUyedju
	 qKVlobmI3uYItioW9utk0S8+Z6pvNA9TocG+UAAxlAbRClj3DQc/MvLCWy8mvx5Kqx
	 +GTWp4rM8rUiw==
Date: Fri, 31 Jul 2026 15:33:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: linux-next: manual merge of the spi tree with the qcom tree
Message-ID: <amyyNARbOkvSTh-j@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cMDge7clruHt2Gqv"
Content-Disposition: inline


--cMDge7clruHt2Gqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the spi tree got a conflict in:

  include/linux/soc/qcom/geni-se.h

between commit:

  522bfb4f33c09 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate fir=
mware size")

=66rom the qcom tree and commit:

  f40e7ab049f4b ("soc: qcom: geni-se: trace: Add trace event support for GE=
NI SE registers dump")

=66rom the spi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/soc/qcom/geni-se.h
index 0991ef7ec0928,8c08c19173749..0000000000000
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@@ -115,16 -120,42 +120,43 @@@ struct geni_se=20
  #define SE_GENI_IOS			0x908
  #define SE_GENI_M_GP_LENGTH		0x910
  #define SE_GENI_S_GP_LENGTH		0x914
+ /* TX DMA registers */
+ #define SE_DMA_TX_PTR_L			0xc30
+ #define SE_DMA_TX_PTR_H			0xc34
+ #define SE_DMA_TX_ATTR			0xc38
+ #define SE_DMA_TX_LEN			0xc3c
  #define SE_DMA_TX_IRQ_STAT		0xc40
  #define SE_DMA_TX_IRQ_CLR		0xc44
+ #define SE_DMA_TX_IRQ_EN		0xc48
+ #define SE_DMA_TX_IRQ_EN_SET		0xc4c
+ #define SE_DMA_TX_IRQ_EN_CLR		0xc50
+ #define SE_DMA_TX_LEN_IN		0xc54
  #define SE_DMA_TX_FSM_RST		0xc58
+ #define SE_DMA_TX_MAX_BURST		0xc5c
+ /* RX DMA registers */
+ #define SE_DMA_RX_PTR_L			0xd30
+ #define SE_DMA_RX_PTR_H			0xd34
+ #define SE_DMA_RX_ATTR			0xd38
+ #define SE_DMA_RX_LEN			0xd3c
  #define SE_DMA_RX_IRQ_STAT		0xd40
  #define SE_DMA_RX_IRQ_CLR		0xd44
+ #define SE_DMA_RX_IRQ_EN		0xd48
+ #define SE_DMA_RX_IRQ_EN_SET		0xd4c
+ #define SE_DMA_RX_IRQ_EN_CLR		0xd50
  #define SE_DMA_RX_LEN_IN		0xd54
  #define SE_DMA_RX_FSM_RST		0xd58
+ #define SE_DMA_RX_MAX_BURST		0xd5c
+ /* DMA general / debug registers */
+ #define SE_GSI_EVENT_EN			0xe18
+ #define SE_IRQ_EN			0xe1c
+ #define DMA_IF_EN_RO			0xe20
  #define SE_HW_PARAM_0			0xe24
  #define SE_HW_PARAM_1			0xe28
 +#define SE_HW_PARAM_2			0xe2c
+ #define DMA_GENERAL_CFG			0xe30
+ #define SE_DMA_QSB_TRANS_CFG		0xe38
+ #define SE_DMA_DEBUG_REG0		0xe40
+ #define SE_DMA_IF_EN			0x2004
 =20
  /* GENI_FORCE_DEFAULT_REG fields */
  #define FORCE_DEFAULT	BIT(0)

--cMDge7clruHt2Gqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpssjMACgkQJNaLcl1U
h9Cy5gf/aBmanaDR4wX5zDO7zfqZTAbGcoZ6xynk8Tc9MHFUv09ruz16OxFvpKLy
pwkK06AkYoL+TInD+NuVjY1PU7qEijrl8FLU5phDBfuf8zDbho6fDA9ZhrCxQNYy
E6C3PMdtcUxcp0dMW1325NPTj1WiCwcKa6mhl0MJWalWuKqSvGb9OJNSoD9rQRDk
RX5AjvxhZ9PwNi2eAVd30Y7kZ3wV2htGi6J59OwMy0srqxYr2lFWXKTFhp/lLIRc
1h/qLdzarg+gy2IPa2pYWtZAp97iNDUfhlCp1E2j5iILSKiHXzzZHF33POJAmEnE
0IQ7kbY4Bc4OGFy60aFI2fUoNZ4IAw==
=1vsX
-----END PGP SIGNATURE-----

--cMDge7clruHt2Gqv--
