Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADF8342CBA;
	Fri, 20 Feb 2026 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771595280; cv=none; b=iPrJVPvMtENC8quhD3YGs2CRr9ziiPVdEkg2KI5sOBRVfC0V5DAcbQOdHIjAPcWjMEXx8OrcN0OKUqt5lSD0LBGbd09icxM15kHKgqecqW7j8Cys0tw0IVQJXCIu83/DNlF+sA8pPGg6ntDR6V+xNiXSZ3o2Pb2YySVF6uget5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771595280; c=relaxed/simple;
	bh=4I4+qfrkLWVhNxlDwL0Diy5TBUQ2jUVc4VB83gddAcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urVP1YbJA76J/Xcj8Qw7z5viGOxElnYWzmxjp/Qisi6V+TnmZFR5ODtC4gO+IaKK91sgW/Mqh6wb7hvHf5z9URYZpWpwB8Pb+liHEer+I1H+53NoOuN4wu6LtU3lMt5E6YZm1PvHCOGrY1wMSAbm0Kl33XCBG4yrhXacJerU0cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBd9cu6u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBd9cu6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E43C116C6;
	Fri, 20 Feb 2026 13:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771595280;
	bh=4I4+qfrkLWVhNxlDwL0Diy5TBUQ2jUVc4VB83gddAcs=;
	h=Date:From:To:Cc:Subject:From;
	b=UBd9cu6ulcbCwmlhOAKbPal16jjUVW51sJ8+bTTL08KB6KNqffQlrhLjFIjjpgPOD
	 j5V54BQSAZ2sHnk6kTxHhAb0AztuTTmH+veCbIgSwr+VNmq1KWYeoZsc91D0KJJRwB
	 rfTHzSnIhjJ35kojHS8d5RcageS9pTOxBJaiciAJq9pHiCinZAATWt2/OsF2XwPw30
	 hVg+HoGqCXQ5516gmTl19gZuKx4t/c7s19KjWn9ft/wQqKkxo5qULiU9HTPSqio4P1
	 JU58mP6vtQLfZrQI/2JIld3i318mFHDi4NHqiQ/35r2kdwa5PV2eAyhI5Q9tjNzJhn
	 jSyZ07bcdqlWA==
Date: Fri, 20 Feb 2026 13:47:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the mm-nonmm-unstable tree
Message-ID: <aZhmDGF4Z75dPduE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/t04U225aI44Z80X"
Content-Disposition: inline


--/t04U225aI44Z80X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  ece626c304380 ("proc: fix pointer error dereference")

Fixes tag

  Fixes: 61a28784028e6 ("proc: Remove the hard coded inode numbers")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--/t04U225aI44Z80X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmYZgsACgkQJNaLcl1U
h9DSEQf7BWLi8rJvMyR5d1YsJBUEUudJkm6Wf2kHDXG+r61tBwzNXQZdMohz2H12
ZqSlKGa/61CZdIwM+UmDb51sYmYG2ASzfIBk9FfBMNt5mMU4QH1+saugpAFQvq6K
QQUn1hnAhn1qULaOLh5cc6A3rkz5XFwmPy6hBJxglCGapSG77sf5G5z6Dy4NDXiZ
FQIsXtbGRFwib35H5VJWRczuvhVPAEpiMwKBGtJiXC3OThebljnPxwFIWpzZxfr4
7Hyq6Bq2sgczpy1uVGrJETn8k2X/AE83BRtbgpBJS82EzAaOvVT3dONpZ5pW74tP
4vOwqFabVImhysRRb5OFCnO88VKi2g==
=pj/v
-----END PGP SIGNATURE-----

--/t04U225aI44Z80X--
