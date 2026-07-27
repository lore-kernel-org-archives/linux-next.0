Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5883E44EC;
	Mon, 27 Jul 2026 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157451; cv=none; b=tzJWvy5YsxLAcOYbpUtTsEB9Dht7UjyHQHfbaeUOxKvrGMlSoZdRYPe8cbV8S3eBwh8OPqM8ugFpx5eTNsAguDRVFS1V6ck2OI5n+ptLe7nXYuCVsQMlkBWI3IgjB5IhsUH16IrupVWUW7pxGRCr+HCE/E2OtBPHCuTwv6woCvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157451; c=relaxed/simple;
	bh=CiqK1dl1Z8juGewO99FH881sl57Mz8+bBOO294/k2yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mBSB175p98yH1m7+VlKbjGf0fFQNXbM46ZjACPd80p8NGTi8Fpv/dj6PUlgvTqJU53p1hT/iVTwUmk1bDs6/Y/DK4/XpF9hc7n48ITRdv2KTOGBGLNWVpU4tE4rRgD5FjDeqEkYnaIQdu8qk9wTDtiy3eavGqMKQTfnZY7C0QJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTlaUMkc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTlaUMkc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EFA1F000E9;
	Mon, 27 Jul 2026 13:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785157449;
	bh=7lfHl3ht4ApQA9q6j7Mas5d8fPuTek1pZb83qFdyPjI=;
	h=Date:From:To:Cc:Subject;
	b=CTlaUMkcIdHmt091emBWOLbAc9xlVqbH4FHONNGSMj9EGn2/Al3pqSWMi4QpKybRN
	 l8n/aTamqGk3tWrvQcxlK30rokGh7QRI2/ltf6fZb3CkKpqICua8XB38WcU0yX+U9x
	 ga8cWyUvIxWm3Ymu8pR7YzZTBDUv4hCw4dCepPPH412vUoN6yhLvgY41y+b+E784bc
	 FKSqLHR4jBuJAvo4hVGeiCTHSVKCIh+acEhjOooOLp8T1+OWGnieYW0dCP4RQAQIqb
	 hru1GVRJg3p2uHICFWVpzMQePc++IJy+gCC/bcgCWiK8fUwK0iURSnjdelC8gCmztX
	 QlZWNAhxAzi6w==
Date: Mon, 27 Jul 2026 14:04:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the qcom tree with the origin tree
Message-ID: <amdXRNozsf9fYUIM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MuNISFIhq6YYu6Mc"
Content-Disposition: inline


--MuNISFIhq6YYu6Mc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the qcom tree got a conflict in:

  drivers/clk/qcom/tcsrcc-glymur.c

between commit:

  995832b2cebe6 ("Replace <linux/mod_devicetable.h> by more specific <linux=
/device-id/*.h> (c files)")

=66rom the origin tree and commit:

  0753091abc4b4 ("clk: qcom: tcsrcc-glymur: Add regulator supplies and migr=
ate to clk_ref helper")

=66rom the qcom tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/clk/qcom/tcsrcc-glymur.c
index b44fccb795c6b,3388c1c3a2aaa..0000000000000
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@@ -4,7 -4,10 +4,9 @@@
   */
 =20
  #include <linux/clk-provider.h>
+ #include <linux/clk/qcom.h>
 -#include <linux/mod_devicetable.h>
  #include <linux/module.h>
+ #include <linux/of.h>
  #include <linux/platform_device.h>
  #include <linux/regmap.h>
 =20

--MuNISFIhq6YYu6Mc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnV0QACgkQJNaLcl1U
h9DOLgf+JbJP5J49QC5l9WUYnpvEbtkT0KvDDgQudiJqjEpuAAaVS4th3XtL+FIg
pHocJnoPCOhVMx+t+SpH1WUVJ9EZoXdoxPg73ihscA2azzE6iPCug4Fd1hCoF9AP
aHC4yNg/RSriG6H7fFc7tBM7HowosgmaaQLTmiK8B00Cw7jdvbgvUCJ0k691IsjR
8qtv2VHpgylqb1N4EPeLzUROLycx+/nUXdozxgzdOwk93OaaEgiTTyCXtt3scflv
f6cGfAS5h6MFVK4juGGx9xWRxscQxvQGQri/W65ZBjy+Wwb0IX1Pfs3xZReWUy8y
aYYArC8lum2t0bafqDRnKuIuBv5GPQ==
=Ivqz
-----END PGP SIGNATURE-----

--MuNISFIhq6YYu6Mc--
