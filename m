Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A42648C3E9;
	Fri, 21 Aug 2026 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313424; cv=none; b=gi5UfWdkTSEPihORL7m8oKDl+IWHmHEPAWvdNaX6VVw+EVK8ynQHUOe2R071qrt9tybIZmy9yXoFE7+ldjoSBxfSUrCimAI6KRAxFx91Swe6S/oPNsDUWMw4TCYk6LN8GtDbmeTP1V4UZIie7CBoB5j+e5VM8AYSELvFSqvzpDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313424; c=relaxed/simple;
	bh=CaVgVQX4Q/PLC0B3YZ/SOQl7U0bGw7zMxuuR4lq6dAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZm+m1qHhDlC1PLT1Q3viTsZtm0HS5a7P3ma3K00aYyePcjjszLS5K0w2tSk6eUpxG3IhngZiZxNbEmWqJkwr+VWDmmbPiUU9pDmJGF3cJgxCrzq+Qc066h+9b9jg6d2LzPDoAAh09g4SdJbRXGYp0557tvQpYtFA6HMwWyQLE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjqYSUAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjqYSUAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C531F000E9;
	Fri, 21 Aug 2026 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787313419;
	bh=ZXKkDNpqx5ppotm0JpKC+fnOTTmzDjtYEDp3fs2OWko=;
	h=Date:From:To:Cc:Subject;
	b=LjqYSUASYwXgcwQE1LEzvU7CWBmWNN0FiVovLDn2isbBsDD4JW0l08DwlaH+QvcVE
	 ffVQuJ7AVEt2fLDS1+7b61SErk4dSO5rb7yVPL2UeaQGqUOZyhJerG0PfQn6as7rM0
	 unw5ydsm9t1meMNsTxBEi4rZB5goTIZvMMsMIKBOJjuLG1WwYpJi6KCe0Q76bvfOMF
	 475X18Mv+qXTLqKBR4kuQxEhlZqb89IE2etJ47QCmgpG0rLKfz0sosvFxwmxe/Hcb4
	 bNo7iBatrejcXjY28tYdBTe90Mq4H2QnDVU4k3OTQ9JFySHTHVfw8RbovHUh8O5sYM
	 3DPjIVbDrc4qA==
Date: Fri, 21 Aug 2026 12:56:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the risc-v-fixes tree
Message-ID: <aog9BzBzb-2Yfgyz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o27yrH6hDtkCjnPh"
Content-Disposition: inline


--o27yrH6hDtkCjnPh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  3c98c44748385 ("riscv: patch: skip fixmap mapping when kernel text is already writable")

is missing a Signed-off-by from its author

--o27yrH6hDtkCjnPh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIPQYACgkQJNaLcl1U
h9D1+Qf8D6jR593vOtJg+Jgv8RwqFkuLWmbDtp79Jp+CqQIXlPUhjDTf8FZdot18
PZQcT8FdOTApY1Ig0n3b0m2ItdAaLRcoUrk3P2/ovDGT6JetMAyw1nmHO3tm3mNl
b9u24a1Nfs/sM6ToHHMERQVctnEMVHTiTzuQTOseQPbXO2ryr0YRvxCrU76e1e/X
FrpdDs3Ml/UUGc50+q/x999oFwKNsSmGuWbN4glmBCqjuk1d02Lsu5GIcDHR7Kw4
VypvXycfDtcYqdUozUka4zYQoowQOSC41pT4z4pgGG8RJgxFoiAPKLdeBEwL1iQt
WtIhKnj/ZWkZt0ULqyUF98nheRWoQQ==
=6kYW
-----END PGP SIGNATURE-----

--o27yrH6hDtkCjnPh--
