Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6B364935;
	Mon, 18 May 2026 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123806; cv=none; b=rHYb3DLXh0/GkIpKJbYgYJSMkNRhmS/qjKbb41C0rlAqJ8J0XrghQaRCbp5egDFclMeioty3eWYYbEhCV71GqtqyeRH7EPaH8F0fFYewPmMEi2pDL4BVRisgrhnMRuEIcl2iAIQ7dza9vLarHzI/HgQNen+IxXUWQgvNG9C1v/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123806; c=relaxed/simple;
	bh=LJnJmJKnLAXsJj2YNh/I/Q86BMpar7Vn1/tqSrlEIS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCPkSV4EVaK/AKuU0F45Zj6c7vNliJixbn/lPPpr1ki+GIEN121eTFWfGvu7KHBz2gMhUtwkCFYMR/dlg5+kiOfiHdwAcnNjI9x3PBJPqPzmZbMbQ7M+RwRoySNJdAO1ZCy52VQscoye9sDgJISLKiDRsqjmwy6LGR5jatrsTds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUf5fnaf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUf5fnaf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2271C2BCB7;
	Mon, 18 May 2026 17:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779123806;
	bh=LJnJmJKnLAXsJj2YNh/I/Q86BMpar7Vn1/tqSrlEIS8=;
	h=Date:From:To:Cc:Subject:From;
	b=UUf5fnafAnV4OpVBtKM+CN14epG6OfeA8UHDlTWMyt3w9qahmytmgwORLoss3hQcy
	 48VDFz2+kw78tHCtEYjCt6PdeACHe5xCAuXmqvwe7LjJIGpotoQP6IGNX6EMpAO6+4
	 g8bpZUhFsmxigBUEskk6C62qQynuRfig14fnkd/eNCND7ytzAoVN8aWLl1TJku/uEe
	 UTuxGZysrVNoJ7D3dw0Ui756XYQ7CEQ1ims4xqiTirRKfk0e2mjUQF/mSm6rhccYxm
	 WDGOJx9MVfmPHj2feAXQnbgyBgsp3M1LsAnXgqVgAwrF+QHQrj+DAynxgJS3H+fvtI
	 n64BTPltfXcKg==
Date: Mon, 18 May 2026 18:03:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: -next status as at v7.1-rc4
Message-ID: <4d59bf02-2587-4d77-b555-7e6af39f1b6c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u6y0UI+lA0ikffPf"
Content-Disposition: inline
X-Cookie: She sells cshs by the cshore.


--u6y0UI+lA0ikffPf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Things are a little rough right now, the week of no -next and some
coverage differences haven't helped - it's a good job Thierry was able
to cover for the first two weeks I was away.

Trees being held at old versions:

  mm-nonmm-unstable	next-20260424	(KUnit breakage on arm64, only
					 seen today probably only seen
					 now due to me running on
                                         hardware not emulation)

We also have a nasty build failure in the vfs-brauner tree due to it
containing two semantically conflicting openat() flag additions
triggering a compile time assert, were it not for conflicts with other
vfs stuff which are addressed in the current merge I'd be holding that
at an old version too.  As it is there are issues with my fixup so I'll
probably take another run at merging an old version tomorrow.

Trees with commits reverted for the final merge:

  mm-hotfixes
  origin

Trees with signoff problems:

  bitmap	(missing committer)
  fs-next	(missing author)
  rdma		(missing committer)
  vfs-brauner	(missing author)

Non-merge commits relative to Linus' tree: 5467
 6387 files changed, 358135 insertions(+), 121907 deletions(-)

Top trees adding commits to -next:

  1009	drm
  391	net-next
  249	mm-unstable
  173	iio
  172	v4l-dvb

Thaks,
Mark

--u6y0UI+lA0ikffPf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLRlkACgkQJNaLcl1U
h9AY0QgAgK4Z7bje/iX50wtKTL68UzaJzOHZZMQlkrdo76ZtP3yh+PEPkPT7QEoe
Ewctie4f3wdRjYnurvA0XeBdvFWMINZR5YeGJFnfgXUo0m8hjCFsytXP61SeBrVp
VIHaI+A7cI4Aarjca7t/HWl9EXGYcWEZplWiz2YWrQei1vRr9kAv/RR9p4fucmjX
eqNrmrDB6sXBCYQOWBs1nIBv2Wyot8OH1kN8RBGaQdh8lLmPOFL2pDuXDB6twL18
fp7ZLYht9180QLeleK9ntsPFKSeZONfY1bt8KA34wRFTCSsByKDLitdtX2kp1FOR
bf3KVS0Oq6KyXTOGM3lC5+6H95QwKQ==
=wiiq
-----END PGP SIGNATURE-----

--u6y0UI+lA0ikffPf--
