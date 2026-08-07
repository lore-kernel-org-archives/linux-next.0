Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21F5378D87;
	Fri,  7 Aug 2026 16:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118957; cv=none; b=AAmSSO9irlOxbkjVkaGqk/cpsSuFL/Pm+FuelwudXRRJOmD4r6orRx+0bOQskln2G7B9WLq5bTJNRMnuij6x0xzc9CFjt/76M8lI3era9phhQX6bMbbSpTC3VDgJxBUBfqZ7BIsjSGT7HQEXQMXyNeUIgNQOQnMi4+apdEk/LkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118957; c=relaxed/simple;
	bh=+7NZQhMvHFGCkgxPB9PZncWw+3/JjGh1+3FpCeyDccs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oHKJcPvLmrW/PofQaBZJeh5KFSYWcVVxCVAVR4A4K9JCaF2PGgQ5tMrXOJdIhtVQauGL4FLQGXfZrr7Z7zR9644/zmopwTdiNrHp1lpZoTPC2Tkc3nxY/YnkIu5d4X7K250AnRXR4tKgUQs1Gv2qhOTQrxurIn3ImZjf4seCFzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9CVQ72a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9CVQ72a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FCA1F000E9;
	Fri,  7 Aug 2026 16:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786118956;
	bh=lZImYV+sIfUsqZG4gTWULE6ZJI00opd0m5dzEPrG2KQ=;
	h=Date:From:To:Cc:Subject;
	b=h9CVQ72aXS9ZM7cE7ff1R7gpUtlYo2YgYVveMTmYfthxkDwKhr6fOb5WmbbBrzSiv
	 Q0abop+9rkVb7IDe/v4QM7vM+Tx6x2YC1GpM+tvP/ty2HrfALQIPpmccSr8Uf0WFRW
	 2KmL41GSmJzve0x9+7BhiqeRAz/TfkcIDUskYYV01EbvU3EL4fES2zZkfpFVe3HK8N
	 aSvZzyYHiSZBVzPMbMqywZfSG9Dz+L/jKX+gu1ULaNn0FIwcffU1QkSujXbUIa5I/b
	 b1s3P+jwwqMNVNag5ie4wvFJZXHVeK/ux9xXlOMidLA5EywcN9g9EXfrCsLCaFjUUP
	 Ukbs6M/k7uKaw==
Date: Fri, 7 Aug 2026 17:09:13 +0100
From: Mark Brown <broonie@kernel.org>
To: John Johansen <john.johansen@canonical.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the apparmor tree
Message-ID: <anYDKXW7kHsWByqu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8DN1uSFCdZz4wETv"
Content-Disposition: inline


--8DN1uSFCdZz4wETv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the apparmor tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/security/apparmor/net.c:320:41: error: address of 'needput' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
  320 |         end_current_label_crit_section(label, &needput);
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         ^~~~~~~
1 error generated.

Caused by commit

   bbb153c86dafa (apparmor: optimize current_label_crit_section() with needput)

I have used the tree from next-20260806 instead.

--8DN1uSFCdZz4wETv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp2AygACgkQJNaLcl1U
h9AwqQf/WSLgeC4W+0SsJV3ZnAzhDTm//eiFk66fL2mHk+gITVssPHfli/1a9VBd
9RuCmN5l71C1cL4l9ddhAmnKEPdPRN/3xwUhGw9noGzc80nJ4j/KOZEkaxL9s0EG
ZnlmMQZdyl/N3UW9rYKQBSDaCur9NBeViInYuNKV448N9g7fP+hBYgIOUc2UApRR
AZY7cYH4hGWoaFirDycV5WNosp41PZSrPnZ2EpxeElv+M+NL32fQLmKKk86hB33Y
PdJEMdKscwmiJCb/O7mQyBc5s1MqINXAvW0UD3zv0YpDd+Ef6a2ZKqzq65DkQ52M
JB6azUy3Ww+v2H8Haoa0YtGrpNjfeQ==
=xXoy
-----END PGP SIGNATURE-----

--8DN1uSFCdZz4wETv--
