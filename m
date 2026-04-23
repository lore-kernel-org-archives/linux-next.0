Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7B340A76;
	Thu, 23 Apr 2026 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943388; cv=none; b=m2Y6E2L5kYOBeNQNvym3XAbeWZ/KU0TMleTBYaEqvnPCcPsfJsZjyPoH7x3fvGj9uWH+qbcLiZiyl/hCchNM2TxRJpcfJU9a2qLUOSuN4xbUliwMZRvJKDd7Jdfg5ESJAeDnL5Wv+7rF606hgL9cgpTuDBLOfgrrEl1C4xwfV+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943388; c=relaxed/simple;
	bh=EH+5S+KF9a1f2qHCHnsY3Dr2XToLWyywPR/bmEKRWLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HYdVhNqwJgyvE0SDvY6JGTIjAO3EFkRLu91jkvhq69J/jdCiy7qHMfU8qinqBxx5uJhE+4WJxsBb5R70Y2Sxmr8bvja1Oh2ZwSPtTrp6TsG0XFLjQctyuivnZFVTzMBADWZ6n/7Am3UEpTnl9jEmK2hZ2DE/18ZRrwv2IFvbf6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/TpuPGQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/TpuPGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C1FC2BCAF;
	Thu, 23 Apr 2026 11:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776943388;
	bh=EH+5S+KF9a1f2qHCHnsY3Dr2XToLWyywPR/bmEKRWLs=;
	h=Date:From:To:Cc:Subject:From;
	b=s/TpuPGQyL/+tfkf96npk1esZ99lvKHWC3jo2RcNTaxECch2x3lgH22YN9ysYla64
	 vztI6wBCaZuxVzZOf/z5M4gj4SEQubd6qM3wwEnhbKJEYnMCEBpGJidYs8Ti2aRPRu
	 bQVg1Q8hyuqka7+MOnqMTprG4mNn0eq4oQZtV9RxOUJW0Bu3KxBVfk9lop877cXOjU
	 ZP9nmUJrC0pCa/QKl/7Vih8j6qokPeH+YxtSST2g4e6gY7lyN0QxbZgu2m1Hox9uli
	 2/c1iTpEPFAd2OgEfQHjfNpakrJtPU99+Sq0k3Eeah9kQm1+xEmq3q+5nisA2eWj9g
	 0Rq0U+C6/0Z9Q==
Date: Thu, 23 Apr 2026 12:23:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the tip tree
Message-ID: <aeoBGEX5FAXfl9Nc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DG40BpUAeppJZCeS"
Content-Disposition: inline


--DG40BpUAeppJZCeS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  8e3705911af25 ("x86/mm: Revert INVLPGB optimization for set_memory code")

Fixes tag

  Fixes: 86e6815b316ec ("x86/mm: Change cpa_flush() to call flush_kernel_range()

has these problem(s):

  - Subject has leading but no trailing quotes

--DG40BpUAeppJZCeS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnqARcACgkQJNaLcl1U
h9Dzmgf6AtDVseAf4ZxdR0Az54WisITgOprA+3CRrDALTF+CdRlV5wIK1XHQn2ZY
TvQ+bNx7QiWIvDoI1yDbfy/5Y2hp7eIPx+IRaHx3d1sBWtR765jRAxoHiRVzvYn+
w+dYF/O7RM9V+oHpqNTDeMaSpchpZ847lBf5jMRWdiB/Zbb+7KJWD/f6TAUJ3ZEM
3DjrQs1cHaooTI91bArg2Kc1lVdWllcEBB6o67/67Qwjr0PORsOXlRG/PpplpZxk
67XJwiEL678XfVuQOSVm/8Oq7FtfDQ7r8O4duPAmdJ1873RO9YImV48l9r3Z7moa
91G9tcyrCaRCCWHpZEEPY3CquuP/Dw==
=wsGX
-----END PGP SIGNATURE-----

--DG40BpUAeppJZCeS--
