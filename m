Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615906;
	b=O7FHnadoFx3NDgghmFZIILIWFh/92VE/qzG1wu2ivJvfCDk6B6v+Rj3F6uU66vnwtffX
	 x8UDaMzQ/g/C/qE3C6v91rfy+md/YIJ2M3O6vc/ENAMg6k2JjOFYfVNjIsf7tzb+Pse1y
	 waTfXlEESNWsz6uPjMvR6HxoNb22xJBbbCmvYiXOxjPD8+VlOJ2wD8kuZdBWGOY8+kh/o
	 kL9ByiPaXaKuY3kZ8rqCt5Gq4BdxXgDTBsRpTQ0OR/HF14wAbQMSXRKUJQ5rOGVV66Wns
	 fK76N4OTggSwRlyBLlBO3ZCB9pPAQAUEh82+yLZyQ/jc2U5oW/l3YxnN3hzuLV63Xeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615906;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=voAmyK3xGKjnYf8b1IajwUrvOirJBuocdyXe15JCLes=;
	b=194O6i3G3lbWd1V5IfnqLjbRWevj+sE51YNCqLzmVie7jC+r3o6mo/AxEWNA5SmzuQOG
	 oITrCtuL3/xHdU+RU6F7MWb5A6ZTUJSnJ6pSiLarED6dVKGhsq9jvb9fzgYF+rT0Ig/hD
	 9IIHckCIYruMCyyhhVwTbtxXwcRa6+igIiptSEXD8CVSWvHRfmhlptcOefCMOjBau4sAE
	 R7jThPeeFB6ynHX6vvsIe8R0Opq/YzAqLa0Yrf6HNUBE/mSXMrH80woJQpxG0lfDBbx5K
	 yJs0txpQVxTTDn+jG3YxdcDBsLjfbsdVJET+dN6Vm6h/QJ31g6opLfzLOQB8SFZPJSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0OCgAY7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DBC606A326;
	Wed, 25 Nov 2026 14:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0OCgAY7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8721F000C0;
	Wed, 25 Nov 2026 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615906;
	bh=voAmyK3xGKjnYf8b1IajwUrvOirJBuocdyXe15JCLes=;
	h=Date:From:To:Cc:Subject;
	b=P0OCgAY7GMVum1ahIh0WEvd6Gg+PbnAik79UfUv2u6qpkE7LOUSkh3lDXBRFmXnlG
	 FG5GgF0k4XB0CwwLjNWvwOuGqJTOcUYXFF41E6z1ArzYlHZF0kMJi58DDtp1O9vfB/
	 g4UHwijeg10VmctaUJY4UUw88l8S65r0uaDyZ2417rCRPVbv7ylToDy1GowOEXZoP2
	 0T/S44p1Oxf5qM034HMYhGdMiDrs+iV3BzpAZlk01ftqsk6yiJkHFWvQjuaRBEaxCD
	 losacn2I3AdCrxDp7CO3v7axLt/5yxetsJJb/iQ1/Y9km0OfvNAvxzdYSQOFuiLZF1
	 gWExIHuf4JgNg==
Date: Wed, 25 Nov 2026 14:11:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbsn2-Ok2XKoBKX@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="q3XhdOUxE+elhhhe"
Content-Disposition: inline


--q3XhdOUxE+elhhhe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  961de0bf47142 ("arm64: dts: imx952: fix gpio clocks")

Fixes tag

  Fixes: b516a4dd6a1f ("arm64: dts: Add initial device tree for i.MX952")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--q3XhdOUxE+elhhhe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7J4ACgkQJNaLcl1U
h9BraAf9FOhC1N5Iq/AmIKw1n4m5H9YNO4wnXE72oH1ae7i7hz0/PmHN8x5agL6/
HPP6XsN0MRT1tUey88RknQMYgInsjxZmyHOPr4icLkO3KT+ETqcVwqUgH/XlHEvf
OpU4ZqWVeuuvtfWQy1diECSXxuCGr6pZxZHG97nrjxXizCCuj/eHxzXIO2pz83+d
M8e0YsuRP6D3KHZzokVfNZevAJAMai9TOpPhzpQqE9o4E7VBIFXp8reof1UB2n/F
dR6U01h56iKCTyaIIzCTnCal3uA9zSeunSsH7a8I1yMVtl6x7p7lGzXDn94Z9BWu
PJlnGOLu/9/SRVM1j9r8Z/xDDKAH3g==
=WGlA
-----END PGP SIGNATURE-----

--q3XhdOUxE+elhhhe--
