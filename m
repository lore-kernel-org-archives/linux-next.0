Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15A4470EB8;
	Wed, 29 Jul 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328251; cv=none; b=R44oT/XzIY6yomQvI+o6frYSVQS9ZlilYfiRo0fikU/Q6kWhElHvxjbURQfzkahDw0ii5yKgW5plNdtiYHMmO2ueik3pTf2/jL/sDDgEaJNMRc/Mdh9dwAP4boqycNM8cQNqxb55gaB+DwrDI+X8G1+8HCJ9ezh7DueU5Q9do2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328251; c=relaxed/simple;
	bh=+Esbw10enjRDSbI8bA0Uq2brZsqDmHgWUSdVFlmvmiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bmrh3dCZFwNP6sAQWyIH/J/7vTfL2LDBackwAXzdXsGowSk+hkdoobkFb7gt5HdSyCwf8j+05W77caRLeuMBGagaq/u3enS75v3aC+12fu+8PpDvdaduex+UtytoLMC4qllat2dI8XEXv5V2Au1LBcSg3w7hQjUY+oCE4oBSehY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mg+fZuqS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mg+fZuqS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819D41F000E9;
	Wed, 29 Jul 2026 12:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785328243;
	bh=mAerYH5sMfuAQyTJOIrtdtB6v1xAkhChCpkbSSjtYeU=;
	h=Date:From:To:Cc:Subject;
	b=mg+fZuqSE1LegJ1PSjurmZD9j/yvyt6PU277PVHXFjM4Cwyaziq2VDmGL2e/lvh0n
	 RI3LdiMUWPgbICYkoaj4Trn/HDUHKGXMyjRXUOJASmZI0xTLPURNX1wOT0vACsEJ/o
	 jp6r9yI2zSk8WigGGfajzm6SJ6AN/q1OqQ++2iOv60bz7eWlBCkbE0fab0K+qNjN1A
	 fUbUFekYppbKPXtZbQ8kDXNNR0y/oaRCJMt8BsbRykebLmMjtVkmz0d1HAYeeRi9W8
	 EuRwlTKA/S4wZeHZtOdDkb9FDxvfKqnscN5MbV2mCLacsfHLdSH2uz9QX5R9kSnZuy
	 b+PinXUNQfkUA==
Date: Wed, 29 Jul 2026 13:30:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mediatek tree
Message-ID: <amnycDwBm9e1BLVQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9ZMmzB5JCZMI9lxf"
Content-Disposition: inline


--9ZMmzB5JCZMI9lxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mediatek tree, today's linux-next build
(arm64 defconfig) failed like this:

Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1010.22-33 Unexpected 'CLK_MFG_G3D'
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1011.15-26 Unexpected 'CLK_MFG_MEM'
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1012.15-26 Unexpected 'CLK_MFG_AXI'
FATAL ERROR: Syntax error parsing input tree
make[4]: *** [/tmp/next/build/scripts/Makefile.dtbs:140: arch/arm64/boot/dts/mediatek/mt8173-elm.dtb] Error 1
make[4]: *** Waiting for unfinished jobs....
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1010.22-33 Unexpected 'CLK_MFG_G3D'
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1011.15-26 Unexpected 'CLK_MFG_MEM'
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1012.15-26 Unexpected 'CLK_MFG_AXI'
FATAL ERROR: Syntax error parsing input tree
make[4]: *** [/tmp/next/build/scripts/Makefile.dtbs:140: arch/arm64/boot/dts/mediatek/mt8173-evb.dtb] Error 1
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1010.22-33 Unexpected 'CLK_MFG_G3D'
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1011.15-26 Unexpected 'CLK_MFG_MEM'
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1012.15-26 Unexpected 'CLK_MFG_AXI'
FATAL ERROR: Syntax error parsing input tree
make[4]: *** [/tmp/next/build/scripts/Makefile.dtbs:140: arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb] Error 1
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1010.22-33 Unexpected 'CLK_MFG_G3D'
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1011.15-26 Unexpected 'CLK_MFG_MEM'
Lexical error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8173.dtsi:1012.15-26 Unexpected 'CLK_MFG_AXI'
FATAL ERROR: Syntax error parsing input tree

Caused by commit

   75bfd9e7cdae0 (arm64: dts: mediatek: mt8173: Add GPU device nodes)

I have used the tree from next-20260728 instead.

--9ZMmzB5JCZMI9lxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpp8m8ACgkQJNaLcl1U
h9B6Kwf8DuWfrQ6asYEFMap3gbrIS/7y7tI9O7TqMwcq9gtJ6TSQHB2ER/us23Pv
MW51o0KqHLZiqVNOc5nzE45DU0vOmj6NwAntp61JrxS4cLW/H/eXNDvna3sO8CsZ
gKI2giV3nFaprDIvXotIPVL/vmXLrWbNVD3mOpq4KTbqxZoiF3WKmpE3obU3DLMJ
hSnUPoyKDgdexc4V9T8ZVz5Vlx0Jw1+P42XzDnxdl22yHpQccFlvvs8bQqi/zL4N
S0UYi2M0koZzPbEVzT1IpLbeY5Ui1DIIoP93/SfnMcnYgCQwRWKRUQyfE3Yr/RE9
eET0YzK3JjHPtyfF6SEG6vh0PQeVvw==
=vGrq
-----END PGP SIGNATURE-----

--9ZMmzB5JCZMI9lxf--
