Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DACA364EA5;
	Thu, 21 May 2026 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377462; cv=none; b=atJYeVyjUrnLvOE2FuflrLsIFGqIklRMeHrTtEOY6OB1EApCeTx76mTKflA6J2d0a9SUaPZhPfgyWWOrXtXMgGQ0ULSuhCppWtDtP23sCSUcK1lTN5MT835wccKcbmz70NeV5KV6/VhswdEtatpVHE5mCEK7oMANa3OdbVV4BN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377462; c=relaxed/simple;
	bh=wW5Al39PXgbw8MpSDatc86aRj47fDN6E7YSMi55N1f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tv4E7Qz/keQiX/wdnlgflJYZwL0ZkRPx/Vnrdi/4A+Be3LhpRMF0MAhl4AAZbb+CkpLMbZ92+Ab6Bo94T598hu0KV+dvuPZv3Qjh+B7BFdV0+3zdohufm5iz7q6SvE54XhafzeiodHMXVi2QW/8PdDjmdWrt8wUsXHEs9LlZkqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBBWOdzE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBBWOdzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7811F000E9;
	Thu, 21 May 2026 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377461;
	bh=goyuBRbxBIA/yTAjHJ3xlbBnHx+2mCqej4lSP/pO2os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VBBWOdzEjgFGM8hh5CoECjp3myj5hqYNp4Tp+cNruGz3HKUh/KJtuRme/HPktfBoO
	 +wvjYoTFqcrojAP9Dw9US42zkHMeEqk+cN1M5XRfdt5l4lAcjJlo004HN938qTDBQq
	 OUsuNhxvcnEnev5SiAgKfi0tr6TwX53SfBezyL6y9e/AAtFTU7aQYd0rJCzZmeYIkV
	 fg0r3+r1bRIMekyetwj5JFBDaIs+8LLmH1f1JmcQiOXz105/5JHfjSLqJSuZSlfDDI
	 9vcerGvmsc78rljTecHKv4KeHVmROTGe2u3vjvEDWOB9/J3L7Nu2/GU+iiYlb1Br3h
	 CxPCqB8YpPuKA==
Date: Thu, 21 May 2026 16:30:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the perf tree with the origin tree
Message-ID: <e08366fa-5fda-4534-8545-5d446734387f@sirena.org.uk>
References: <ag7cF9XqINQyrq6f@sirena.org.uk>
 <31bfcd67-40b7-4dc2-aa88-a4839347f005@leemhuis.info>
 <CAP-5=fVH=fETWYO=VKuA+aC6=qjyqEmku6JeJhB=q=Nns+rMEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H7Biboy9ufJA2dRr"
Content-Disposition: inline
In-Reply-To: <CAP-5=fVH=fETWYO=VKuA+aC6=qjyqEmku6JeJhB=q=Nns+rMEQ@mail.gmail.com>
X-Cookie: No shirt, no shoes, no service.


--H7Biboy9ufJA2dRr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 08:04:11AM -0700, Ian Rogers wrote:
> On Thu, May 21, 2026 at 7:55=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis=
=2Einfo> wrote:
> > On 5/21/26 12:19, Mark Brown wrote:

> > > between commit:

> > >   552636b9317c8 ("perf trace: Add beautifier script for fsmount flags=
")

> > > from the origin tree and commits:

> > >   32969ef6e3e19 ("perf build: Pre-generate BPF skeleton tooling durin=
g umbrella prepare phase")

> I believe this commit has issues with "perf trace: Add beautifier
> script for fsmount flags":
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git/c=
ommit/?h=3Dperf-tools&id=3D552636b9317c8a843dd4496d77e56976ab48c76b
> This change went to the perf-tools tree and then to linux/master,
> while "perf build: Pre-generate BPF skeleton tooling during umbrella
> prepare phase" has gone to perf-tools-next and then to linux-next.
> I'll look into a fix.

Yes, that's exactly the conflict I identified above - the lack of
coordination there was pretty surprising TBH, and also the fact that
552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")
went in after -rc1.

--H7Biboy9ufJA2dRr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoPJTAACgkQJNaLcl1U
h9Dinwf9Eqpz+CfDmvpAc+xhf0fA6j25h5ztITtjgvZvE5bq3z8lHQ69u8tGhp5D
hhUYpyH4JapwYGzZELAMNfFF/isH7fAL2bGTsl+LOIHs7SvqoMUBnk19Ft4isxeA
ONbL4M/fsH1h92ToPmAkEyP/EABhX7a8/SKRt5xFWG/flT+87bRoIP1EeS1ZEj6P
8O7rLiRW7ez+h2cvPLBbJkXOjJRb7y0Wk+xartYDW4QX9pqFqUCBSy/xHTiFFszv
Bu2orrajXvGkzj194/Z4IjxKo82/PZitoAGYxqwjO6obNNrggBAqQDBT2F2Bs5TU
lFMnk6M1Dl2dORM9G4HV7xy4OWZ35w==
=W7j9
-----END PGP SIGNATURE-----

--H7Biboy9ufJA2dRr--
