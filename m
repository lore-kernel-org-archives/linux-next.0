Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A413451BA;
	Wed,  3 Jun 2026 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495335; cv=none; b=dOopzYAvYpL2LTtT7I0vaVd5Xk5GW2ZzCBxDiNK1U+drXb8GAjnArPZdqnleyKfpzriES76lKetwOnD9WZg8gf9kzyBh89/++csVuXUbWDbGwmNVatSg0SpRXOzwR3yc5EF1XmWJNzXo6anxkLK7IyPbVAQK1FFmLdwQO0YNJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495335; c=relaxed/simple;
	bh=5UtyuFb1un7nLqFGRsm5/vcbHmVlrm3aTo2EKGu7HAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fm47nTfJ4ylNTJnV5natm7+TEUEErmf63+rrANGPMHykKnrt3QAWKmAIMnH0p3YYIHC22PIyoi9a8NTOnStPqNAFuysuxBzlbzrEZUm3u1qdZXSdigNITTAVjn94kEEyTV0MWwi9FZlRfoSo/2edKVZW+rdjyTS8LOoIKQWvcvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1femxNC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1femxNC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4027C1F00893;
	Wed,  3 Jun 2026 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780495332;
	bh=NLqQEYnsOy1KTZkdSHxa76IzyFDIn4JMbrFbDWuxQ1w=;
	h=Date:From:To:Cc:Subject;
	b=n1femxNCN+p2DxVWHE1foDRO8lGad8Dr3dN8KjYQomZu0oCjZtNeXcTcvRt0hY3vv
	 KdqQOHKCjaj7IO3RdEnAOwrDmRI3MtG5b+x1YpvojUakG601guB119JH/sIA6DGIvy
	 wH0Pr7WJhTt4kbgUBJKTNhye5FvNzPkdwaYHjwH9j5eOQDnQ1TC3BKNemsHibVx/Tm
	 DMSpyxLbAzoOH3kfQsEYHyTaYYnil/RackKnoiqC8vWEsCix8+YtUf7rKO/enij++K
	 4xrUBZKj87/cRuX04n1AQsgKgxKX2DF+RoAEhA9RtKg4aGu1vmwlplLAxNSxH1TqLs
	 ycqw4TJfs4aaQ==
Date: Wed, 3 Jun 2026 15:02:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>,
	Gustavo Sousa <gustavo.sousa@intel.com>,
	Violet Monti <violet.monti@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-xe tree
Message-ID: <aiAz4DmtngY0r6Cx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X0VTc4FdUhzyzYWn"
Content-Disposition: inline


--X0VTc4FdUhzyzYWn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-xe tree, today's linux-next build (x86_64
allmodconfig) failed.  Unfortunately I fat fingered things and deleted
the logs, assuming the issue remains I'll report proprely tomorrow.  I'm
fairly sure the issue was due to:

  5ff004fdc7377 (drm/xe/rtp: Add struct types for RTP tables)

with some of the fields in rtp_to_sr_cases[] haiving non-const values.
Sorry about the lack of clarity here.

I have merged the version from next-20260602 instead.

--X0VTc4FdUhzyzYWn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmogM98ACgkQJNaLcl1U
h9Dhjgf8Df7AekcOql2wtT1oSszq+Sjcrb6PDIy1uaIrvRt2FG0wbWiWh9gfwpXA
8MVnoc8+/Yh+PFtos9w2HQkm7MvK/pDHGuqle1g2OvwXpBfDrtKJdZsoIedpn1KP
bvMLTHkePq3kKeXOichARvn+EACMdIczLWRzRUv5xCh6hh9VcBy1I5jHwW8kscB3
sdxZqASDZWnEKZ5lmY5WaSB91wASZSB7YkDUlOJ1TojfQ79DWrKa5L5e2Cc/4BFa
8zJgwrxS+m5JHRbqN7tpG3RnQtv+QLOvQf/hScumLqZlcvtV9VR1zJr6cW5NoVzw
gf3uOtqkZTIagid0/8DEw3Z3VfFSZQ==
=t84i
-----END PGP SIGNATURE-----

--X0VTc4FdUhzyzYWn--
