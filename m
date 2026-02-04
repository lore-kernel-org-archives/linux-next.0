Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860BD21C9E5;
	Wed,  4 Feb 2026 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770213146; cv=none; b=gzDFccmZqO6RpsxRP/7ATiJ9daMv/n/CuCiqY1oMdLv73XYpXK8v8JBnu5tciKZqZRcGABTux+AMQM5PNWHlTy4KATxOHBj6m/NNTd4SuyQdbX+WryJYqbjeqhDwYeAgjJBWA6ADjFZfIYdH0e493yrqFoZ9/aYkXIlysbqiz4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770213146; c=relaxed/simple;
	bh=FYvUcoSI5sMPE5a2xVpFPIXfMU52725HfqsffvhY8F8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4HRYTGSq2qA7Cw4/a3gp9i3LS68LRWPjEwxeL1frF5sxtdVa5tNYCX7jWhzPkscukn9pUNXa9DdRJAloJgSITpapmoQlHNMRyUYQMtFa//8UMDPwrp8AdSZxME9SJPasc8Aw96U2A7zq+MRPE7WMHnAvw1TjudXefwKAlVZecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMprKnMY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMprKnMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4F6C4CEF7;
	Wed,  4 Feb 2026 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770213146;
	bh=FYvUcoSI5sMPE5a2xVpFPIXfMU52725HfqsffvhY8F8=;
	h=Date:From:To:Cc:Subject:From;
	b=qMprKnMYcvjz0eBBuGewiagej4j72/7mzdIsn4m8YaPjdXA+I47YPCvfKmv43mGwo
	 vHhicLZV4mbbsNKbHoOatt9Lt86aq2UK+LCavq8x7H+tPn5pAbkZIc3a5shdRLTTS/
	 hndILJYJlK2S8FYiCvyCLqt9Npj3/bVhkT2G9hjVMOiXVF/hZmpzY/in4JzEHLSk0q
	 OJQPRMxMviZXaNo8e69zjld4QRabafJc0Wd2gIbxBbEoz6U0MVLjBbdO8lckOp5Roz
	 B0lyffjFp7Vbwpcd74QmHKH1wZLbbqheHKv8jh5B7HKBYJqwnaIgqfHu8+sUlfPZJp
	 mGlzw7CZzHgjw==
Date: Wed, 4 Feb 2026 13:52:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <aYNPFdTRx4WDKlTV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KG4MEBVYT1/4qJTh"
Content-Disposition: inline


--KG4MEBVYT1/4qJTh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/thermal/qcom/lmh.c

between commit:

  80883ce8b1fd2 ("thermal/drivers/qcom/lmh: Remove spurious IRQF_ONESHOT")

=66rom the pm tree and commit:

  781b391557a74 ("thermal/qcom/lmh: Replace IRQF_ONESHOT with IRQF_NO_THREA=
D")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/thermal/qcom/lmh.c
index b6b7f1193c441,3d072b7a4a6dd..0000000000000
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@@ -220,7 -220,8 +220,7 @@@ static int lmh_probe(struct platform_de
  	/* Disable the irq and let cpufreq enable it when ready to handle the in=
terrupt */
  	irq_set_status_flags(lmh_data->irq, IRQ_NOAUTOEN);
  	ret =3D devm_request_irq(dev, lmh_data->irq, lmh_handle_irq,
 -			       IRQF_NO_THREAD | IRQF_NO_SUSPEND,
 -			       "lmh-irq", lmh_data);
 +			       IRQF_NO_SUSPEND, "lmh-irq", lmh_data);
  	if (ret) {
  		dev_err(dev, "Error %d registering irq %x\n", ret, lmh_data->irq);
  		irq_domain_remove(lmh_data->domain);

--KG4MEBVYT1/4qJTh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDTxQACgkQJNaLcl1U
h9A2Qwf/bDc3w/838LISATt6ti4B33RP+Vk7VnabfPxPKrCc+wDDf4uCxoTEDi93
LVTW3Th0n0FBTCfBy7mlwDKUIIkhXLFJnhkI5cBN57wuiEh2BRg7031XIeIhI8lW
5cKMdTV8MgfUaHl4H8UhU5VxV/3SEsjlbqlSJgBXt8eVsW5I7zgP7g09i8frTqP4
qEjgHI82qHPcPZe6qkPX6OUwfqHVPXeOndl+A43c1Dmj/U4dftrUjBQWWOOp6hH2
mvUBBty9/MFQrj3M6KLAhOhnVsb2ovqki2Hi0o9ddwr3oqfapParDBwCmVmD5drn
Hm3dZXS1yfSVcGShD4Lr+FG5dA2WNg==
=cdGU
-----END PGP SIGNATURE-----

--KG4MEBVYT1/4qJTh--
