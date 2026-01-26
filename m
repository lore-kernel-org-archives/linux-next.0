Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE152EB845;
	Mon, 26 Jan 2026 21:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769463769; cv=none; b=Jgw60F9btuPdtZnjjoMl89oBwsAUF9Ia29NKnS3d1ZrH0JgjE6ZpGIsEEQAihOkyVFrosFIiV54UOlvkM+nIv+6/BJy808H+attIjSStICxtky9dbafTGZwPtFB2Sdbgu4FQ8UA02JT/jg2m4xcoktCU5QSAB4xxAQhTWrMjTyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769463769; c=relaxed/simple;
	bh=0XwfaN7TNermJJdxAEMUL0E5D5F9kfb9ovrqjHdruEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b4rP+6apGG+HvyUnxIfz8YeX2TsZzV51ZQM/leFgd3s/lvBkDbB54jqO4gKw7nolI1tOl21AIs8UDpB63MLl6FbZFxY0ylxAtEJkVctDlfPk0uZ2S56Phzt21gpN/R3uFjk6YXy6wz1UpXt+9it7AyHNMAF/CkzeV23M6rOEUuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqadrNKV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqadrNKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1F5C116C6;
	Mon, 26 Jan 2026 21:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769463768;
	bh=0XwfaN7TNermJJdxAEMUL0E5D5F9kfb9ovrqjHdruEg=;
	h=Date:From:To:Cc:Subject:From;
	b=jqadrNKVWnvbsz0APuZWRDVAIxb+Y2V57g2v8bO2ep+taLYr6yW8DDshejKjxuYCq
	 6uUPsh3OhGR2NzLALnQQdgWlP7zhK79z7IitegI8KYDqHn388cqoC/1K74z0B6nMra
	 hDEDSfqUp4NG/IcQAY+5kv5aT1T2hG6K7dgxZdYg5GA1yWum17LL3YjYMmCwFKJ7r1
	 fBM9vjMv5TVhxP4SR9J2XRXXPG+6pHi4fmNulaxZA182eR4Rur24AcDvWsuEJo7oCl
	 nRgIiKI2Chq7qw2nA1jO/U5DHuTGfPn/HQDNALwPgTTgJF2/OuVmODOfDVYhNn5BuA
	 DAEO6No36R7qg==
Date: Mon, 26 Jan 2026 21:42:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mailbox tree with the qcom tree
Message-ID: <aXff1Fr89fqs5CEO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eUgEMA620yunzck5"
Content-Disposition: inline


--eUgEMA620yunzck5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mailbox tree got a conflict in:

  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml

between commits:

  65ce09d2f164a ("dt-bindings: mailbox: qcom: Document SM8750 CPUCP mailbox=
 controller")
  58e69e8f9c9a4 ("dt-bindings: mailbox: qcom: Add CPUCP mailbox controller =
bindings for Kaanapali")

=66rom the qcom tree and commit:

  d96ebba37b7d0 ("dt-bindings: mailbox: qcom: Add CPUCP mailbox controller =
bindings for Kaanapali")

=66rom the mailbox tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 90bfde66cc4a6,9e91247c521a1..0000000000000
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml

--eUgEMA620yunzck5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml339MACgkQJNaLcl1U
h9Bnqwf+IS1XhXRs1CUKOSdnSGIzApH2mNFPgSq3a/1uZNzqs3duPIlziSeynwGP
Lo0RG454kQZbrNZM9V0UQIbHB8HYqTxVDw6+AKhtlsU6k2NnoOI84HroT/fortGb
aVIjP/uqLrnST3pG08cVBqAMtUB6BPooFghWMZ+c6n5DxeTGM16sCNWUc8Fmj/xr
0nMja7HsjUuyOQdjO8NOqDtfXR2Dz4Ef/hiH2xYPzBASYoDOD3GZypoO5QdlYvgw
Nkf38jD4n7wckeF83ZSTVc2xKJVspyKJVWvJRY6q7oROxGEGdUlJhur+AJnhRfsJ
HYD9JTOJ9Pc6urVrK1zZxE8WKL+fIA==
=vDm0
-----END PGP SIGNATURE-----

--eUgEMA620yunzck5--
