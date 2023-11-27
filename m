Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YnoCtEnL"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93D8131;
	Sun, 26 Nov 2023 20:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701059158;
	bh=wbDb2gtqwgNbPAGLBIC77NECRZ79k8MnxVX2RwmFoYA=;
	h=Date:From:To:Cc:Subject:From;
	b=YnoCtEnL78ePiqDY1/mZlngrsBDMM6Y9iV2SRH1gv3GPwTDVOcKeOAU9M7YVbTBY2
	 9cvx5TDH4tm7tBIhEERidz8fZ3VhVzVSwVf3UprDEzCqI9qeIwPeNedEsJv4YUyFx/
	 xTEgz+SbT5mc6+XgHXRkkoEmC1x0PYc6YfdtPRbfUG0Y4U8HN/3U3d4EWUGJjDFGDE
	 yQ1FmWgTFfL9imPzDEpd0we2NqfPilPminTpF1qPY4ykeE5KDzdphGSwo9m33o/4V3
	 DSgncfhsHjyVbV+G0vrKatNbgxXG4xsIHh+nDGflliATzcm9EgEHIDi1Bk65HYqFMt
	 8s3IFll8nTZlg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sdsw60sTbz4x5m;
	Mon, 27 Nov 2023 15:25:58 +1100 (AEDT)
Date: Mon, 27 Nov 2023 15:25:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Tim Harvey <tharvey@gateworks.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the imx-mxs tree
Message-ID: <20231127152556.73769a73@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/muhioyNUBe3FlBKfMl5PYwZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/muhioyNUBe3FlBKfMl5PYwZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cb3c29e7d263 ("arm64: dts: imx8mp-venice-gw74xx: remove unecessary propre=
ties in tpm node")

Fixes tag

  Fixes: commit 531936b218d8 ("arm64: dts: imx8mp-venice-gw74xx: update to =
revB PCB")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/muhioyNUBe3FlBKfMl5PYwZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVkGlQACgkQAVBC80lX
0GxJPgf+O52gXrzV4KVa5Dch+Tilzm5oG29Xwnm0HCHevZLoxxwWfczrElmgSlVN
Sk96o6uZW54UcDYSyyUlKGpYua/XB9XyewdOaS5GwbUvK4ehyp5NU3AN4IwAuiNk
OjUIWXOHkCdBvibjo6kUCqf8xOt0DL7UGvbkhbxX3NodI8Ud3L0Ts6fbxgjhLJlr
R2bnnALOFt05Ryg90ioXH4k/F1wHuClGHF0jz39GypSVuo1hARztRYhIsllsMQW6
7Ld/evjDi9TMP7047XCUR2NZY6YCBj4byVY+dXxJw0DGybSlEIubwjQVKtAgZr6j
uk7hoC12D+qDWQyYDv18lJo8zM5xuQ==
=ioul
-----END PGP SIGNATURE-----

--Sig_/muhioyNUBe3FlBKfMl5PYwZ--
