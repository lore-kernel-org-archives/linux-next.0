Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D97614AD20;
	Mon,  6 Jul 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344932; cv=none; b=BA3b2yK1jtxjOTDq6N0moMjs1No1FDjTSSDS+Bzqq/jVlrHWSc/xVt3nIEM2ZVixF7U7VyuK9mj+nqoDXK/1SykQPDcAVqSq2gpGM+5Mu/ye3ZTXUuVxSS9hqF3otXAPswXgEi9Dy7GCIQXG0H8yX2oscXy2iRyPENx+7gIJhaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344932; c=relaxed/simple;
	bh=sbpx0ASbb9FKtZQ7p9FV5Kpc0MpoO83PQoGiDzDoudc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eaB8p/DGnoaOvpbtUQ4MVIYcStlENyW+bcHT4jT55O3qx9RByoAwW08EG6cYUJPSGfiyQv1naOjMNcrYB//FkoHJp4Vr9bm6mLalPsAAmrI+KPa4S/6yP6umwXGuvLcjfiHK8+WdCpm/d4SncEOZANxkAl5RICHdNAa+xQ69JZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2YgK37P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2YgK37P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140881F000E9;
	Mon,  6 Jul 2026 13:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783344931;
	bh=R3YOmVlaqVT+OyQwpDR4mFmrggNdBNMULX06hsDU4WE=;
	h=Date:From:To:Cc:Subject;
	b=Z2YgK37POwbPYE1wED0RVxnCOGR5WOPrUlR65m3eIz5U1twNCdKrNod5PI24QjAKS
	 uFstw6FOmEws9kboVTfBe+fak8IrUhcGmMJl60n97YU5Hh5ck6BfWCtYmCQy1OJKdD
	 3kl7jZrsxqHxnvc0P9Ri0Ey36+/hol3Eh9ejO4Jejbf+C9XqB0xC5TpK97p0R9feac
	 JuK8dIUU/Q+0W8UvBBf/AAGzfVpw0lf4QzUMYolk41KL4GNJCLsPNl5r/zn9HIWjnm
	 F3yX5RcxgqOGDgW26xv0VS77HfmXPH0DFwTLJN1Sfqm9EK3dfFNY5vwNBV93WhFE3J
	 HEmQhWdhfSUyw==
Date: Mon, 6 Jul 2026 14:35:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Jan Kara <jack@suse.cz>, Kyle Zeng <kylebot@openai.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ext3 tree
Message-ID: <akuvHyqOUzdSTMnU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pcoHnwL8+3TXgVIg"
Content-Disposition: inline


--pcoHnwL8+3TXgVIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the ext3 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/fs/udf/inode.c:2302:37: error: use of undeclared
identifier 'sbi'
 2302 |         if (eloc->partitionReferenceNum >= sbi->s_partitions) {
      |                                            ^
/tmp/next/build/fs/udf/inode.c:2304:35: error: use of undeclared
identifier 'sbi'
 2304 |                           eloc->partitionReferenceNum, sbi->s_partitions);
      |                                                        ^

Caused by commit

  107eb175cbc81 (udf: validate extent partition references in udf_current_aext())

I have used the version from next-20260603 instead.

--pcoHnwL8+3TXgVIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpLrx4ACgkQJNaLcl1U
h9AvLQf+Oc6FLXQElcllUR0JZFM9mWAkWUDVKlc4RjkaxGgJhxKWFeZjWUDwukwE
HcstCnpw5GuchtaRi719F3MnM4XSX0r/3DcG66FWPuWAsvFZ54b+/EO3u/h6frfb
5CdBh714DLMHT7nvsfrRHGa7DydiL9/uMsAjrG7iBIm3JdsgDiF3AkTki+phtNoF
wLgb4UJ9/Y2fxwZo/dbZM1Y+l7pnpKG7bS/A5JPVrCRCLWv7xJKKpFEK/9w9Xy5m
h0daPC1KVr/GoMggRasCDXTHQjXG6/Q19CUeNHrWJyluWLgp7L/xTiGxX7Rd5qox
ogZr+mK6nWQzOPrDA+fbUCQynbZdfA==
=+Pjx
-----END PGP SIGNATURE-----

--pcoHnwL8+3TXgVIg--
