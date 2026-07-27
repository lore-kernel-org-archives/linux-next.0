Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE48341D133;
	Mon, 27 Jul 2026 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164662; cv=none; b=XoeIbiUV6uj+Xbfz8MSF1LnBHUaPnvAn1Gaw/0N7EfPf/Fhb+kehHz5kTQLX2ZVqR4lQeJcNsHQDET3hLpBi86hru6qrxO1kLiOYXh5CSWMzn10HMO6/+2dMmHB8l09+vIr+VD2i6idGvoQoAaD78Q2R4+jkHRcsE1Wi4f+BlEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164662; c=relaxed/simple;
	bh=V0kQOBJ2guddhpI3sVI3evZtk2d29goFZglcn3Rde6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaPv3N5mBmlp41yPB3TG5S9VdFBDJ4QDlBc1RmPuxPDfs1Rj755IEMOxOoL0VwZ0wdWM3IyUA76lvEggJ7VNAqC4CU2yH3KS9F6eeJ3TVQw4IOW4CYsV6AES2LIzPxKSYnWgTkZVxEf/gQoD4mmGj6QVo32w6JiY5oP8fUiUXaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELhLEBBa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELhLEBBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604C71F000E9;
	Mon, 27 Jul 2026 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785164661;
	bh=iQ28vErBlb3gn1KyvgK6XuBoHQ4oQ3AHCzSSxXAavFg=;
	h=Date:From:To:Cc:Subject;
	b=ELhLEBBa+c3hP9txCO0VK0lOLFYjg2MsP1EIvb2gTIBcGU7/73BbufpsNpGk0+hYM
	 DJZsC1AT3ri0yxAC+6FIVzsAGU6gcyOay0mdxwoquURqzSq8KfksLeMncytcwjmrUN
	 6X5lFw1htzSgthpqiVu4S/iZ239na/Y6WyajZMs02densfhjJPeKeu0X+oO3n+qNmP
	 c8UK3v8nrRX53HWbRBlNTHkVN+RtRWOmKVCIuJDpOLwFWtx0OaAjF/Y4lE+iM4bNZG
	 WzCsiHB/ya1g80vDIrN+SbJ6MSNPXkm3hu2aQTnsnQKuL4LjqvF+prTJD72EyOezqp
	 s31s3lF7mkM3Q==
Date: Mon, 27 Jul 2026 16:04:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Pan Chuang <panchuang@vivo.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the thunderbolt tree
Message-ID: <amdzcQ97eSeOg9C_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cGXcwMiPcZTOEkNj"
Content-Disposition: inline


--cGXcwMiPcZTOEkNj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the thunderbolt tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/thunderbolt/pci.c:115:17: error: unused variable 'dev' [-Werror,-Wunused-variable]
  115 |         struct device *dev = &pdev->dev;
      |                        ^~~
1 error generated.  make[5]: ***

Caused by commit

   eef9f6d8c36f7 (thunderbolt: Remove redundant dev_err_probe())

I have used the tree from next-20260726 instead.

--cGXcwMiPcZTOEkNj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnc3EACgkQJNaLcl1U
h9DwWwf/RqwWA6abcsPyTsABm2nN8XfWl2/2zqRFW9BNgjlUgTMO5qu4Tu2ru3q2
I2vOvTrBc+ChgBTnd/ufShK+gk607pHRhvVwa8jCFKkUDlZ0w5q80qH9BwR7FTd/
AZpIOmx/5yFc/fFWPw4Is+wk52qL0+fPxFiiSHJD0m55LHBP1KdKs+PFRHs6bDS9
KKgXmmrJYlml5b545mUEmwOpc5ashAXSd9Ci8h0bDX1+RbEXAJhCGuiMGtlBLA8B
NNFmgtGYGx+JWcm/UquwjGb2PD9vxUOPDRNB+9UfLW3nwgrHZOT98aC9dbrRK2sC
2xQ4ljeDUL+HVZvjx3CYiVlEoyhM2Q==
=SjZ6
-----END PGP SIGNATURE-----

--cGXcwMiPcZTOEkNj--
