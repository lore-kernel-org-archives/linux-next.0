Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95BB3FE347;
	Mon, 29 Jun 2026 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732111; cv=none; b=ZcPCdW0b0wMZc4dFYtzIZnq9DT9ANze4jIw9lMGx13/isKNMAK9ZoUM8zBrBsI1uLqUEM0V26DqMV+rCypugi2V7y8+Zn+QNwPUsq4DLu82/Mg+7ptFWDOZ0/AlK39TOwTqr2LS3EsDscTAbr24bMneqNizIRXY7IO2iuzedotc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732111; c=relaxed/simple;
	bh=FPTR1qRGBVrMqBmsL50tqZfOOMjtYP8TuuAY0jvwtF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZJdSowYq3StIUYrP81UiJ1u1ckxpEzvbaGOL4+yTXAHrGiKTSp9gbOdRvotk5EDbtapYr00EBB3LJGIzbCqWdMXmRfF7Rp3l4kIBpLUC8fQDcKenQD4vUKogG8tJY76sxi2V6QlXn28GoeXD3wRbVS7yxBkjMzs+p6SOLKXjmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Usjon5ur; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Usjon5ur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE2B1F000E9;
	Mon, 29 Jun 2026 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782732110;
	bh=GRrKGQlLJhlCzHRx0P/2z8VJn6OVNgI3beKSNM7whuQ=;
	h=Date:From:To:Cc:Subject;
	b=Usjon5urDGwC/WhWW6q2AzxjwNkC5/GbJ9KnXRwtepHdf/k/Z43QcIf2DQCszuwS6
	 iXcCNqxLId+DUXgdHWJ2UcSwITbu0oJSNIFLYNNHJtmcRPxsTHP8zH+WzDqsd+Kvr+
	 zYUoOg0Wo40v2pl8mnEhXBmFOuexEBFcWyJOdH1MBc8tGwF6/CXce7KRb7rs2qJXDJ
	 yGRiLwc32k0t0PJpRPNMfYp2YdiUcVyliLcwLK/z91WmJhvixAifwYuWWydSi8fSPy
	 Pqp+qLgmmqOEiVGOdXyU/dtPGrvGj+veU/LXBZ7mF811vU/1vppWWQxC3EOkUwf5Lz
	 EyS2oeUcr5HIA==
Date: Mon, 29 Jun 2026 12:21:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the mm-unstable tree
Message-ID: <akJVS7BzSdn-Gazx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BS9KYxJ6LQDCBtAk"
Content-Disposition: inline


--BS9KYxJ6LQDCBtAk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  2f0a90124d661 ("mm: page_ext: add count limit to page_ext_iter_next to prevent invalid PFN access")

Fixes tag

  Fixes: 9039b9096ea2 ("mm: page_owner: use new iteration API")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--BS9KYxJ6LQDCBtAk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCVUoACgkQJNaLcl1U
h9C5Rwf+NOAjoIU6lPIzw+2UG3X2Fk/86v929F/kRNwYrH17WRC2LVL0MIqWC+CP
NAa7gpaEkOwqpFn4sgR04DSbKCAuNk88XM8Rt4MZZIa0IH9eeSqmYz7qwKb7WBh4
jBwXJo5zgPrC1sT2erdv25GlhSYOB46Ue6D7gpPAZAlekQRykUsu0rL+K3HTeoSi
fKyrsxJpoIV3E4vcN4UBRrHFJBBts1pRM0bvmvCxLG66XZ/JMc9zoUWAzPWHO0v2
DVQFMZ+5kDlwiioZggbi0SSUqfC2mp4BSnTe+S0hSFQ/cDQbvv1ZVz490UpeffoE
/Yya0XwLq1nEmu8UcwgwdNZRyEMG7Q==
=7/GB
-----END PGP SIGNATURE-----

--BS9KYxJ6LQDCBtAk--
