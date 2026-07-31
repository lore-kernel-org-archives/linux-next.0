Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1404399FE;
	Fri, 31 Jul 2026 15:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510641; cv=none; b=iZT7ewqNvftCcYIqY/tyAOdjZIpaKjubdfHN75BTVjuNjPygv3YB3IeNJ2OgLc4dHW4o8GWOH2Tr1cYk68XUdpV79rfEhh+diMTkXFY/ho4VON3Re+CS3qhxItE5B0ArW9B3iVROBPqvfcLt1XdFSfTk02ESQqCOyw/misJtKSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510641; c=relaxed/simple;
	bh=/kZpU8GJHs60VShx7irBTEbrFogMpUXDGFORwuqP3ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2btGQOESGhbCEDCKIhGbgTolvSNJy5AViba87Sgxt0U0pi6G1OMAeyn7dtCLCzUSouq0dTaTAwORniKZgbn2QU2w36I8VAVd4CLbr6lYtnWI8CgYVwwQF5N4w7iR1vWxH2+o1+kFsz8kh9+VevGNDOWQE8sFd6b9QbhyERlD6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/cfXIRQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/cfXIRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71D71F000E9;
	Fri, 31 Jul 2026 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785510633;
	bh=EkHSaLWYmeatIBSNS50mal1zGPAQBxwDntkp9TSLaFc=;
	h=Date:From:To:Cc:Subject;
	b=c/cfXIRQPWOUNOe1E95cwGUhswJfo32IaENpnxOco9PCWaMWiAgwsA4UbYOlIrbNt
	 WReP/zvDHA+Xb0qrQPyLyITihDKfoIBHVRKqpucKjmJrE0YVogMvZd7GFBuTrJYA3n
	 Ha39hQq3/7NZ2E5u9mwt+pekk9v+WJIoZvCS7w36ORisf/JyT9qqo/f+zDzmDorBlJ
	 6lUvLR6pas4/JAjug4bFcQWUGqPK1NDmtuzsrBw2ruAetAICtGbr+vj91tdH1ycP+3
	 Yp66sROJRAY7WlQfWdf0+rQaX6cxa+v8GpGScOTZ2vjLY7sI/+BAjtP3xuQwieJMd1
	 BisyYKsApRxQw==
Date: Fri, 31 Jul 2026 16:10:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Alexander Koskovich <akoskovich@pm.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: linux-next: manual merge of the nvmem tree with the char-misc tree
Message-ID: <amy65RkyQOShgG9z@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zGco7J0VWJ7uILnu"
Content-Disposition: inline


--zGco7J0VWJ7uILnu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvmem tree got a conflict in:

  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml

between commits:

  1123dc1ae35f8 ("dt-bindings: nvmem: qfprom: Add glymur compatible")
  ec4b806d0c7e6 ("dt-bindings: nvmem: qfprom: qcom: Add Hawi compatible")
  ef558843eff49 ("dt-bindings: nvmem: qfprom: Add Milos compatible")
  31a75f07b9e90 ("dt-bindings: nvmem: qcom,qfprom: Add Shikra compatible")

=66rom the char-misc tree and commits:

  c33862c0a3a9a ("dt-bindings: nvmem: qfprom: Add glymur compatible")
  c896d1c34f2bb ("dt-bindings: nvmem: qfprom: qcom: Add Hawi compatible")
  9f902e68cfe33 ("dt-bindings: nvmem: qfprom: Add Milos compatible")
  ac0a5d17aa3cc ("dt-bindings: nvmem: qcom,qfprom: Add Shikra compatible")
  a0366c432e838 ("dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650 compati=
ble")
  314ac2403ac96 ("dt-bindings: nvmem: qfprom: Add compatible for Qualcomm M=
aili")

=66rom the nvmem tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 8134ddb54e130,566304ed4c786..0000000000000
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@@ -22,13 -22,16 +22,16 @@@ properties
            - qcom,glymur-qfprom
            - qcom,hawi-qfprom
            - qcom,ipq5018-qfprom
+           - qcom,ipq5210-qfprom
            - qcom,ipq5332-qfprom
            - qcom,ipq5424-qfprom
            - qcom,ipq6018-qfprom
            - qcom,ipq8064-qfprom
            - qcom,ipq8074-qfprom
            - qcom,ipq9574-qfprom
+           - qcom,ipq9650-qfprom
            - qcom,kaanapali-qfprom
+           - qcom,maili-qfprom
            - qcom,milos-qfprom
            - qcom,msm8226-qfprom
            - qcom,msm8916-qfprom

--zGco7J0VWJ7uILnu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpsuuQACgkQJNaLcl1U
h9CgFgf/Rti/JrfKEk7O8wGsJ00qfzIn2GmH3U8Wr+N3IB1kuYNdPLqOn3iKws7i
zDdPe2meSvetdxw31C0FwKVQX59ZBUz/9/9s3+A01nAreoui1JAfLFQPUs39hv2E
OOZ97UZ+5rGbdMguxLFq6PWKDstoeJLuIheHgOUNSkqWC3sEzzpnYL3YYbrWrhjE
Hv3bjsGGjzzOqfsjTXwXypa4kxYqaPqdqZCYsIdMNRHG+3oV71qEq+HKFC5e4MJS
43p/qkuU9E52at9atZSVdcwBVe/iAyHDCuTwo4nFLE56CwDVXrLRAD3MXI7z6ixy
hl9q/y1nZvQxe8IDON1Ysk5Jo6s8mQ==
=XPEQ
-----END PGP SIGNATURE-----

--zGco7J0VWJ7uILnu--
