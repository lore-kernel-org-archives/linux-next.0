Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C863DFC9D;
	Tue, 31 Mar 2026 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963014; cv=none; b=s3B9O3xW38tMPaZAXmaNKboZ7Z0ss7r7TJMgdUPCFjxf0+s4z9ApNQwZPkY7yCQzUUc2SLDvq6lg/deYu7V6kMw/9vxZ9roxZhtukTL9soKHBXF9b2Uzlau82mscaAIIcCT1gU1auCC3lDAF3O14LNgEvmbvMGQmeZw15wPqGzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963014; c=relaxed/simple;
	bh=xAELUR8yzHfq8+9E15aH21je6NaYTHDUow3uWHxRiPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CUkWd+zhcR8X1D2PI0zCflCLx7M7WkWVujTjqr3qk+AswgOZYHS5JVUEvY/cLOEIElfMuiy3pA1mrWv11rpPyaOZFRTO8TdXS6/2tXc+o6bYOkPTEB4T/MUw9UUvB+DddlGKyJZPks3afPIF5o0g8THt9/vM0LobSbOSTDJMrgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfIMfnA5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfIMfnA5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83519C2BC9E;
	Tue, 31 Mar 2026 13:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774963014;
	bh=xAELUR8yzHfq8+9E15aH21je6NaYTHDUow3uWHxRiPg=;
	h=Date:From:To:Cc:Subject:From;
	b=OfIMfnA5WDzucLvV12+ShdyLemJZb8XzooCe6FdQtjHAjsPkvLHkzOC/w9zRoioHA
	 n+pqPZ4CN+POcjRBe1jqV18imVkHbGqyeFNxY2dvdXSD1cXFR6CTT/YlMgOnBiGvBW
	 2VyRBqR/mxzvIgGkZ68rw03JkfTT/ICrExR5LtQ7yRXd/SI/paGx82t2lOZ+NuJlkd
	 W201FspN6GXKvf++4MpFric5Ka6eBct3U00vpLBHGZ4SXsN56fTGKRTJBJAKvvJis4
	 ng1vKAsPRPk/JtBOl/p3KKfFXujt28Q5nHCAz8yEZnHCIQRIViIX7kswuyrkCtmUJr
	 6FqSUsiLLvUVg==
Date: Tue, 31 Mar 2026 14:16:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: linux-next: manual merge of the pwrseq tree with the origin tree
Message-ID: <acvJOO6MwMCRh6qF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mBWywKitY8Fi6TMr"
Content-Disposition: inline


--mBWywKitY8Fi6TMr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pwrseq tree got a conflict in:

  drivers/power/sequencing/pwrseq-pcie-m2.c

between commit:

  5c3daa5301693 ("power: sequencing: pcie-m2: Fix device node reference lea=
k in probe")

=66rom the origin tree and commit:

  0d38285a12a28 ("power: sequencing: pcie-m2: Add support for PCIe M.2 Key =
E connectors")

=66rom the pwrseq tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/power/sequencing/pwrseq-pcie-m2.c
index dadb4aad9d5d4,a75ca4fda2eb3..0000000000000
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@@ -109,7 -386,8 +386,8 @@@ static int pwrseq_pcie_m2_probe(struct=20
  	if (!ctx)
  		return -ENOMEM;
 =20
- 	ctx->of_node =3D dev_of_node(dev);
 -	platform_set_drvdata(pdev, ctx);
+ 	ctx->of_node =3D of_node_get(dev->of_node);
++	platform_set_drvdata(pdev, ctx);
  	ctx->pdata =3D device_get_match_data(dev);
  	if (!ctx->pdata)
  		return dev_err_probe(dev, -ENODEV,

--mBWywKitY8Fi6TMr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnLyTcACgkQJNaLcl1U
h9AX8Qf7BFPkWKLBvqZxZ+lmtDtuIAogiykwIi94TDZsxIlTx5R/nP7Ojoh7GA1/
xyprRQyZKN+haCVnyep4DR0viDm4OZtQK8U7JvefFvBuVE3Eg6/eziZjdu1kaE5M
b9iA7iz8tBJP+d6V/kalOuo7ibUawMyuJHdq6/pe/0B2nasdif3Np6O22BgCbE9Y
7AzWZUCRY9685QoGl1743/Oa6C8NvMhh5ooNoYbaQ2gmLgPEfdvDqwzBnJyfWczi
YPXNsKzO3peEkJ5B452FA8z5kCbsm+TPuClO3Ees7Nu3EHzBTjbaZd2pgGvJi4wv
jZEnAMze+Ye9rEGxPn7tkDRi6Bg3kA==
=LUuS
-----END PGP SIGNATURE-----

--mBWywKitY8Fi6TMr--
