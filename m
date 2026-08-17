Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61E73FAE1B;
	Mon, 17 Aug 2026 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969348; cv=none; b=szHgF47Gxl0hGgnFhuEwxCaL7Vo2hMWKRWHozywljiJapTd3GjMA4P60d2sDea+xxxXCBtC5gtAn4iHF2j/qxDlqIm2j9MyViTyxCfDms7vv+sX+HV0vksVKTygwlO83GeyEMJtBcc/b50FtjBbMA4x2+RHQJNQbM5qxVmMMjKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969348; c=relaxed/simple;
	bh=BUaTFFcTpU52ZrZ1zwApq4rgKy6f7OyVd03i3MG8jtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DyANiYLuu0yBaTlPe/NhOFWtorJewztgaVY7NxHeAXBRAtT7vi2Ga64lms7xcX6NyDUBXUQwVRtpXcBnj/OeSO3h7SDVgPouBK/WoNPceWvLgPl2RA4jAxQosMCr/CS9nD3mdMWhiD0WFBJpSHwBIG8GTpXVhq8FqgrxAysFEuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hn6KJrMt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hn6KJrMt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888A71F000E9;
	Mon, 17 Aug 2026 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786969347;
	bh=iUSMjzCpdi8VJ49g/7FnSxKKfDVNDcKtDS+Rt5YCeqI=;
	h=Date:From:To:Cc:Subject;
	b=Hn6KJrMtEnmObrwFTzcQei6QorjVHLUurpRwvCy2WQZidKjOwYoljh25Bt/91zP+1
	 gYIjC4J5iPckmCpYNiHU9N0h1r7/p1iJ/ZCG5MP2akdbn3g4Ks682zwwNqNaBDHd/I
	 8qrLZ2mIfcVwJ0Stt2DAVCzBomC56AWGbDEsd/qSjrUGwfD6yOZnKVpRfUwjkVpYxy
	 68+b4nRQmd70uz2FDnWTI4UK1mGJ16HjZC0nwZ/ardFovqjH7i68XEOn9W4ymti13V
	 cYIi0xg2/0qiVdc4nnX2TSMJ6Kkq/jbRZHquH8wF9AZAllrf+zvwDckEYRlsPaHPHT
	 9xl+yk5OAviPQ==
Date: Mon, 17 Aug 2026 13:22:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the risc-v-fixes tree
Message-ID: <aoL9ALPE0zLSKEU4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kcfG+ScB7uDTOTNl"
Content-Disposition: inline


--kcfG+ScB7uDTOTNl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  8d9d4fd2a15ff ("riscv: patch: skip fixmap mapping when kernel text is already writable")

is missing a Signed-off-by from its author

--kcfG+ScB7uDTOTNl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqC/P8ACgkQJNaLcl1U
h9CEPwgAhciEyBLGuS5oP2rHpMKBe0QoZZ3S261iGvokhctf/jZcg7eTFlOULxb9
9Y8Q9MjOoLd+0JRs/iJ/3nCVnkoCwBGAhqOnC1ZyDq8+EFKWBrye38/saZTUIfNh
174JKXjmaZiTDhIKBbjomuxhSwmk5xSaoSiiIKDmWq+aDI/BwFB4hcUv5BWp6rpU
y+CbVMSikHm0DqbGhw3MDNpTu5fc9qvopRTXufXkzu/9eBD4GPEvjcKTEmhMb90G
SLVR3gKZ8LRSGnRXXUf6klL3mMYp/8qRDHXR3/Qx38ZGpdwwq9orx7b1/S897J+D
ng73oAHdIrDJaQPfCvTLjZ4bOh0utQ==
=vwUZ
-----END PGP SIGNATURE-----

--kcfG+ScB7uDTOTNl--
