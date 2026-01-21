Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8CD347FC8;
	Wed, 21 Jan 2026 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015660; cv=none; b=AEOcDQGNzzUMiqPMpPeFfjAw5gjhEBIHeuOcrcdy86hztqDgQ3bLl+ZOlxqkQ+VQAhjQLwMgJCmHnmMZDEYVsh55Sl7uXLg4M81M2FMiZFOCA2z3sSG9Y0DfStrNT++OYp0v8iuGRR6u/axhw0BbII983PXyh+f22c6G7zpNYR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015660; c=relaxed/simple;
	bh=7S94bWr7yIV3JOyksz9V23Gu431FX9Twp2nvWSf1kVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nIp3l8fbY64ata/JSNxUW1CknXG0XlaxC7FcAQ+PtfmKNLMO02sxNZR/kA5BcJ1N4hVVqhE4xgmeOEKVi88/qbNby/6q3wKdKC9uiQSkl/T1FFeRjjYTqc9gqZjr3ahcltzrqVK108QBJFAOc1fDrYuAPTDuIBBg5ONDjP7ZIvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBrKa1fS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBrKa1fS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5891BC4CEF1;
	Wed, 21 Jan 2026 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769015660;
	bh=7S94bWr7yIV3JOyksz9V23Gu431FX9Twp2nvWSf1kVs=;
	h=Date:From:To:Cc:Subject:From;
	b=VBrKa1fSHPDw+NNd1Z7GlEKULTkLDW1Bzp0TeD5+SgfWrkktMFVgARkED7d8V7H8P
	 NL5UXSNIlTz9MhCfCivy579FfFFi0nVksIJmEmXRua2B8dulgePRqC7g3bZ2hG3y4E
	 XOYE4nV0yS5nk4pr4/bf8ijKSTmlyz4DwHoTti6oUKqHN4ubUtVj80ys/gPcXrKK4w
	 Hq+MJPuN7VY7UKJmk0HxSP0JsOw0GGJj0yDgXkBS06DsEoWrwnS7va3rwdttpvVv98
	 Vgcs6sm8smKWPugASftgV/xNywR9yinkVWXr8GIDYbcMJyTY2J64vutRwIs6R77sCb
	 zjdYgLNm948Ng==
Date: Wed, 21 Jan 2026 17:14:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Beata Michalska <beata.michalska@arm.com>,
	Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Rob Herring <robh@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the final build
Message-ID: <aXEJZ88g0Ng2dIQ4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxhvHtXapW/R6oKM"
Content-Disposition: inline


--pxhvHtXapW/R6oKM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After the final merge today's linux-next build (arm64 allyesconfig)
failed like this, the same issue will be present in mainline:

error: field `device` is never read
  --> /tmp/next/build/drivers/gpu/drm/tyr/driver.rs:37:5
   |
36 | pub(crate) struct TyrDriver {
   |                   --------- field in this struct
37 |     device: ARef<TyrDevice>,
   |     ^^^^^^
   |
   = note: `-D dead-code` implied by `-D warnings`
   = help: to override `-D warnings` add `#[allow(dead_code)]`

error: fields `mali` and `sram` are never read
   --> /tmp/next/build/drivers/gpu/drm/tyr/driver.rs:196:5
    |
195 | struct Regulators {
    |        ---------- fields in this struct
196 |     mali: Regulator<regulator::Enabled>,
    |     ^^^^
197 |     sram: Regulator<regulator::Enabled>,
    |     ^^^^

error: aborting due to 2 previous errors

Caused by commit

   cf4fd52e32360 (rust: drm: Introduce the Tyr driver for Arm Mali GPUs)

I am continuing to mark the driver as BROKEN.

--pxhvHtXapW/R6oKM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlxCWYACgkQJNaLcl1U
h9ASiAf+IFf3fqifaJ8ug4x6S72xXjmLJGev2QiN50Q+rGZuqqF2noVd2SPxGECj
J+WGWE0C4xt/D3+DvKXqvQah89e/tGPcLopMhxQSqGRG0SDx2MKcU+q1gtMIFjp6
TDGD5H8lxfU1sdQdvFg5jAKkUHo6PKnA6yhdY9Yo3lHz32JGGvfTk/lMdRbC+bsY
oT2zarWRpbRfE5xWlFE7CRaoWuSWjsQL5ZLEgl3tG5fGHAbHLfJZHDDss4GHUjYl
2cWh5P4VD/Rarv26OjRB3UcSK9ZSHdnnI3pE01GTyNAn1G2W3eGrRyOe0lDEnAK0
qZ3DHIp6/LGRnM37JXu44P2RyMDnBw==
=ZmrP
-----END PGP SIGNATURE-----

--pxhvHtXapW/R6oKM--
