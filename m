Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21B38F92F;
	Wed,  4 Feb 2026 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205306; cv=none; b=U9w4jk+nL3YlkGBEqNUrGHBJTQIXqjen+419YGyyT1GLNVYuVRdwkT4aJwYe7P5jfvgGzGRzRl4KqZIFNVygFDV73yD3qEa4ozz9CesbG9PSRNGN5M9P3As1ICDJrCfMGmzKWjxlrae/vcLIg/kPVjvqT0sA2B0y1jcBMYq/8lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205306; c=relaxed/simple;
	bh=sNf9gdSWwfSjk1cpPwZfBsXxyjohBlpdpw16QI06Lxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nf3/nuhCUMfZsM1bKLTQdB+q/POZLVtAFBYNmd+pA+H2er3Ry4uq4FlpS4T288XoNCYug4eZR658keePgFeg3Fbihp/idMfekxj92AjDLe0gy9W+9QH57uLajUnMpvKN3TObmB0Lc3hV/96QmdXKKWfHFb4wPCco/mSoli8bN8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRVhjBGA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRVhjBGA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663F0C16AAE;
	Wed,  4 Feb 2026 11:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770205306;
	bh=sNf9gdSWwfSjk1cpPwZfBsXxyjohBlpdpw16QI06Lxw=;
	h=Date:From:To:Cc:Subject:From;
	b=sRVhjBGA5ke9ncGQvo5x9JOlarbErF63sunGEs53Pxg1ChDK+DdiUuK0fYZL0q9yQ
	 uZEUgaSZcrGibufJCzYa1HnlaSM3BGcHsCyY2UTe7+fOCB6t1O80awTJ3CnlbR33Ue
	 uEs/uiR/qxtNgaz7qul1s9iUWkoN9Mx3bOamjayHs77nmXOpawUyF+sYo/GeCeQaT3
	 OGRycRn0Ph96hCYjDVY1p7WckFjGojTPBPf9hb2l+aVwEATVL4C6TWzcurVD4q2LOX
	 UHZcWgr+PYdF23kG81y8ukI1AEvbsnpJ02hdzNcjX5oduZdI/u/QwoEbfUyiSWncCw
	 mckDeeWbGJvJQ==
Date: Wed, 4 Feb 2026 11:41:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the nvdimm tree
Message-ID: <aYMwdieykr_r13tn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sv+rBWL6cZmyn9AZ"
Content-Disposition: inline


--Sv+rBWL6cZmyn9AZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  c4ae8ec088db0 ("nvdimm: virtio_pmem: serialize flush requests")

is missing a Signed-off-by from its committer

--Sv+rBWL6cZmyn9AZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDMHUACgkQJNaLcl1U
h9D+7Af9FcM3l7vTfNGn+FLB0LOTf63o1K5UhbbBWfvtolqenkl1QxbQZOXYmo+/
BzjhLipHivwD3DF9J1GzVahAUSqW4KxL0RYcHgJaDJ1vS+Ruz9KM4UIDLvZbDkmf
0vOEhA5NUsjr5SB2HE6/WCCVowzj4vKEjyI81mfp3zkChRhRVrrnRqTD6oRoa8Nd
2vQFeNg/bHu0Xlt1e4PE3I9WjUU4G+3TLfkaNgAZ277gKVcWFrLm3NZuiFayZFG9
y75W+ErG/MSj0vdyBya59NhORyzbT0nhSPXdVKEHADReUd0HbKs81UZ7L8gObEtd
YD1gfyGTF0IL1+yYSNpzvurLGbt9yQ==
=74hR
-----END PGP SIGNATURE-----

--Sv+rBWL6cZmyn9AZ--
