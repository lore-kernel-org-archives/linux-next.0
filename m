Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DCF368296;
	Fri, 12 Jun 2026 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271592; cv=none; b=obG02zh3VCvffXLbQLWTnoG3zM4kvoNx/ea10lteX9pM6jNGzTFUWVOxl8+JP//lD219U+xXREwF510XKoct0BYrN9ZzTOmL4d8OrWDBfQFLDXNt4RTomSf87scVPG5lpt5+HI9JpW1uR6iKzTTErBi6tI09wcbuGlOWTJ1R8VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271592; c=relaxed/simple;
	bh=887efUGdHvmg/Z/kqvJC3mFGFOeQbbn/5Uiie7Mci2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBMdny6qu32E6LbKrWm4VtPztX9bQUEVyw0bkR32jFlMGdyroDfvx1UKp9rc2HCpAfo5WPKj8U7Lhbemu72iQZ5YsDCJnoS1W7xXe7Lnm179YHzsC9avinxKhtrLhS/NMcAXIt9mfj+pBClB+1bPkNwdh5UWUuY597Xh5Y6Ec9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNNSYKDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNNSYKDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14DA1F000E9;
	Fri, 12 Jun 2026 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271591;
	bh=/o39XUO7NI2UC1nn73/PtLoAd49HZGxYYsKMJ108y7A=;
	h=Date:From:To:Cc:Subject;
	b=YNNSYKDCScpSEgvLNFw0VqewHLHFNT0wBHJLnkNeoMd5CzLY7Nr8lV37HGSi4gfAa
	 wm3tANCA4ThPI+4NC6DT26X27pvnixCBn/Uyw9CKRdJpOLlorafZzsVuYugtdteK5h
	 YEYfCa3bpRrt1AmhdLv8OiFQqygFtco2Y1HNyLWfe+SehAYefq2RtJYAhoYAJJRadc
	 4o6h7kmW9ukToC0sQ1UZylEKl9diH5l1+i7QesprGJnAWiUTLRBj1Cb/eUtoAw4d+O
	 VmToLkC8CNOCxVsbj3Y7lKnbLjsSntjLtpzoVyRqrb6PtDwz7E9SOLFKc0FwLS7+SF
	 X7LztKsA5QBug==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 28B921AC58C5; Fri, 12 Jun 2026 14:39:46 +0100 (BST)
Date: Fri, 12 Jun 2026 14:39:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the pmdomain tree
Message-ID: <aiwMIgx5k5ackX33@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HNuk5Of9ayQ3UUUx"
Content-Disposition: inline


--HNuk5Of9ayQ3UUUx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  7dbcc2b682501a ("pmdomains: core: fix unused variable warning with !PM_GENERIC_DOMAINS_OF")

Fixes tag

  Fixes: 92b69eff8012 ("pmdomain: fix early domain registration")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--HNuk5Of9ayQ3UUUx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosDB4ACgkQJNaLcl1U
h9AgZAf+NyT37Fk2bKrqu++EdAF3qAZyI7vuiSHee+g6BMeU8eA3z9rU9/Vf/uRa
z66caZuMCYjal04f+EH9qbSTJ3wjKGjui4RIADxzRpxmF7sg/OC/rclk6QRGplkB
++ZxLFTsALwoUbK4FT1fqnAfNHzx3jaQcA/2dCrSyw0frQcNu6Oc3V4qso3Migp2
IkWhMIbI5RBduyqkcGawVGHPhopzxeHkkXI085Ibqjc9v/NilEfp9m0padttKgae
43DHW311SuCYsSmfkRMI73zQUkREuAa9debYsjW3Ug2Z7bm635c4ty8OxGHulpSL
+2tydpdfZfHU3+lP3a1tpdB40/qDkg==
=++Om
-----END PGP SIGNATURE-----

--HNuk5Of9ayQ3UUUx--
