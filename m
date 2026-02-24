Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE32369990;
	Tue, 24 Feb 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930429; cv=none; b=YVffQUl71erewmyeb4Ddi+QJXbRtR3IRhJXjqWAO0Sly8wFd9W+GwRhlCHZkAxE26oPRv8ULjXR385nkKkeiDvOlEP1i10LkZz136HBJ7ir5SuwBVvgDN/HiUJfCJOtERRsFq1q/xFCfa63kFFUavMqSuJqNXJf0IkuDQCdEE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930429; c=relaxed/simple;
	bh=UDuqIt/Q1vkN/KlGimiJ34H4r04zjCy6kSE72WWG6lA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WI/FfeaOEpz1MaAB/d6SlTl/CDsHz4DKDne6uFEwjXHy3oMK0YTHKZRALbMeG3tvYsMAAAg/Fskb4QSw63q6qj98lWryGzpB04wn2MXp+n9kHVEu+vWNTRM2k8OnPUnt2cJKKJ9TONjckh5/DjrPJvl2v2gc9v++l9V0Nz7xo8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgLM36xe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgLM36xe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A400EC116D0;
	Tue, 24 Feb 2026 10:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930429;
	bh=UDuqIt/Q1vkN/KlGimiJ34H4r04zjCy6kSE72WWG6lA=;
	h=Date:From:To:Cc:Subject:From;
	b=OgLM36xeYufiAzBeFxdjIE5GVBtYkXy/FMefO2q/XaHuI0TIbhttwXczGXA0naL4o
	 H4PXab8GnJLYS9RldSNP+7FNPZkiIUR6gDowpGOxxKg4j/WT1MlbuczFVJea0LiNRH
	 DWaoaElGi71AbjlNxm3StXWoE/Mi2MYG4/JZTAGB8z3E1WWd7HjNYUjzNPECMtp6QY
	 J17th5w6o7f7s1nnvwCYWPSHMDN/4q5zGm5cd2HDUzILVpVHfpA/DF52S//FAA59Tj
	 ifw2jAs4pvailOh8M+Rt/Co2lIiL+yw9QjkEp6AwAt9gSXOvPZZZlxoadDJVF8S0zf
	 LEDEc7Xc+T90w==
Date: Tue, 24 Feb 2026 10:53:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the tip tree
Message-ID: <aZ2DOE3Tt7wCSL6-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i8JdMP0EkQpvldai"
Content-Disposition: inline


--i8JdMP0EkQpvldai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  486ff5ad49bc5 ("perf/core: Fix invalid wait context in ctx_sched_in()")

Fixes tag

  Fixes: f4b07fd62d4d ("perf/core: Use POLLHUP for a pinned event in error")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--i8JdMP0EkQpvldai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmdgzgACgkQJNaLcl1U
h9D4agf/ainFEuJjbIrLCPdvWTz0tOJ49eGGR+Qp9kF7DECWsD/na9Xmwk98G1HY
di2fLEZLnmuGHqcbPHtIFtI8+DHGgOJqXEhl8Z04Zp0A4ZxgsF1LwURr03PN7dp2
b5Ba7e9fxiAlICJORbQwfays+vte78I0NxMULgLF6DChmHK4nuZK1BBKt/mXoogw
mNM5WR2ZvoUKqxNQHFAhftn42iv/pDoAMOBrl8r73DSICcua8B0IoH7hmBKTT4SO
t4KE+A6dh3QpEtxldbkU8RL1uSOtw4XGqojDiVXYBs0Dmz7TZViBO0WiGxejHy1i
ddVyRbUo4q5/fpTmA/CkLWWDi7VDlg==
=H8As
-----END PGP SIGNATURE-----

--i8JdMP0EkQpvldai--
