Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26AD38B7C3;
	Wed,  8 Jul 2026 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508648; cv=none; b=felakNhmfILvkSBLR82LfytTLpOD3vO+ZajqAHMpfa34zMvtVO36ckW5HG8RmlMGRwbZGZp1fkFBl9A8acCvEEN+/ORpMiz64Vr6gVJS6LRWvMn793KUtEpkNjvjgmIexxb56iRE6yOgZ+38g9x/BD/JDUndLlR4xQ5SHoxd0b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508648; c=relaxed/simple;
	bh=DvQLC/532d2s5RokFPy9seK0fhQkhdaaij3SmZ53BZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L0ibO1e6wsrItd9kyrmWZm1l8GVdAfLp8DgYbmMV1wnBJLj7RCMR/q10zEa7tzw51RPxfypXl1adJCmjy+PpKWn/24vaGpGn35mgqv5q0gwMm8jGhy3cQwnVIohqtYceAuCk1elewQM+QtsVRTpGQv+Hx6dNh6CGlifecS4lSPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIKq3aQ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIKq3aQ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8BB1F000E9;
	Wed,  8 Jul 2026 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783508645;
	bh=eNKSGzB7poAFiPHIpDdTiONeFMJrL169oBnZvPso0Do=;
	h=Date:From:To:Cc:Subject;
	b=cIKq3aQ07EDt/K7TBVPly/Bf3xnxbCE9n7IFXFoAWIi0tIL1N+CQA3B8tAiikmBR3
	 J8N+KfDV+j7uErDDKxD4Zh31i7FT3ep3EYNorWzisOFyd9a2QD2KpOBC0dVm127LRL
	 IFG3kkfnB75yiBho6Ck/nv6Fv2vlx86GgUfnAKRXEcTMSSy+Ic3sjL+Ryqm91iFVm6
	 9MgRGxPrbvolQOTo80E9mkoKim2ocuwJJcLsiH2ofmagpzV8exu9hoWuOCb1z70q2c
	 Y6uPmpku4VylZ3gU6wGGF4pj2Ve7HL/2JpQbJwnHxBHrWj/fNa/tNNZUrGSgoQ1h4i
	 OWaFpDVrWk3xA==
Date: Wed, 8 Jul 2026 12:04:01 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the landlock tree
Message-ID: <ak4uoarwzlAQcirh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gkg+LsOI8MOezR0J"
Content-Disposition: inline


--Gkg+LsOI8MOezR0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  12d39e0ef753e ("landlock: Document fs.resolve_unix audit blocker")

is missing a Signed-off-by from its committer

--Gkg+LsOI8MOezR0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOLqEACgkQJNaLcl1U
h9BqpAf/Z6o6e9+YSu/fwM0zvvxqG8fFfOASiEtEpdqr3TgSqWJPxPyuBPHfaOhv
JR0NQq0c4dwu2VoaupeN0YivuXjAgi9bfYkXrWFPPJnaadzyfs3AL02QtVk2+Fl+
q+tD6V3U2yfHY+/RlkkVYsLLBJ5lmjT8NTo4JLYv7tiVg3tWHmJut3NF6I6p3FPE
kLof5KwbF1PTlMmg2fwITV3CKY7sux0RJMs2mZHbQ/WlljVLtmOCiHxzWGUwrwJ6
lPCr4ovjiQAKQqVGwfdi4uKjPYQEkQeD5jWl1KUfqzp9Mj+z0wrzMGzEdCuBoXp/
oJ5YPzOuwO/kulIoGFg9o6ijuXjymQ==
=GUey
-----END PGP SIGNATURE-----

--Gkg+LsOI8MOezR0J--
