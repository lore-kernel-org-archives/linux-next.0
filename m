Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519800;
	b=cvLXnNPyoMGnkyIwdlfvpunNp1Js+ktFqRLTLuwAkivLktRum1LsuQrrXDF8mdvbw53V
	 5t0mp28kPDm2m55FG1os6ZNkVV0CeXIUrL8Xkjrb3E73uc5JjitXGi0bkDhPsQrA8glGY
	 n4OvvQaJGwfZy+slQF4vdX9sxJAfIiqwwiJUKNUglQjdAGPTZ2AUA1Int1+N+EelIc9Yr
	 U26m8xj95XQDPVG9mIHuuZHpicoytitDVuIGuiaeIqTQqGY0hxIk+o2MvKtD6nzDooSlg
	 1zVHjIA32H3OLqiYemQZgNwtrfFwojWLPaqLNIZbPvcwfhqZBlgsEFoOpkHILyU/lVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519800;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=+2TzqJe2iWe6KgGgUFz5AW2M/B80cBuYbtLn+z1nhTM=;
	b=tUE15fQPrEZrxPLCe7Vd3coGbbFENYM5ricgPKB1nt5a3c/A2wRey/pPujD8p8c9BP8z
	 fq20cJ5aF2k79cf4282si+PQCfu5TCLKJgd92vZpypDBgt9zhTs1XqEG77cAT21hRvWB7
	 OKhXGCaniRv+zVj4cR18KXiuFF1sRU2Yx1Xf9g159VDuZNX5q5ym4ugu1IibxgbwV2P6A
	 N/k4IqXnC23a2v1owrSdGSdG6bW/R/RP4YSMF5YwNNk9sUQMzRlouIiSlz/HrgZMRzT6i
	 XcpcU1cH9jqnG2wGYXiyqbsAWLZMzEMFCCw0gd+/1P6vKKW52tVFNE+txayZRw/wz2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XDungGCa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5310E606A31E;
	Tue, 24 Nov 2026 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XDungGCa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED961F000D1;
	Tue, 24 Nov 2026 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519799;
	bh=+2TzqJe2iWe6KgGgUFz5AW2M/B80cBuYbtLn+z1nhTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XDungGCakIafShTK3Aha9p8lU1N7qJo/tFYfuYZZmWQWJfVebp789sUG89nKqehxW
	 /j5J9Qz5z3Fw89Fb5qeAr5fJdDDmeHZ5xkMoBEBIXIGRecwx7NEzTgfgbe9TlAjZbL
	 i+msm3tJcNqstWsC4YKrDCIrLIyoNFfbdpcTR7ZmghV3su9/aMuKa4PeK5DWzIwR1/
	 6uRkLFbW1qunIYVQeo3jXLr/cdY8PqOELQCVhM7R4fNg8NU5/RmmmpLaLozb1CRafY
	 6elNsuI4//uri35JyH3MBzDVsbzGxu6i82+uLovkI7PzBtwesxniWwgMQcoROSoZfV
	 UxnLA07N5teuA==
Date: Tue, 24 Nov 2026 11:29:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-ID: <16b64ef5-9a33-4ca8-b60d-96852c2979bd@sirena.org.uk>
References: <avx9_c_HWPAl9i1Q@sirena.org.uk>
 <20261117091650.fc2f9558e84f76a5cdbfe7b4@linux-foundation.org>
 <20261123212636.1204307-1-sashal@kernel.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q85SQ3K7Taq+ZUj6"
Content-Disposition: inline
In-Reply-To: <20261123212636.1204307-1-sashal@kernel.org>
X-Cookie: Real Users never use the Help key.


--q85SQ3K7Taq+ZUj6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2026 at 04:26:36PM -0500, Sasha Levin wrote:

> Andrew's two patches are gone from mm-nonmm-unstable, but every next
> tag since next-20261118 still has their read_profile(). The fs-next
> merge applies "profile: Fix up merge" and "profile: More merge fixup",
> and those put it back on top of the iov_iter conversion.

> Without the two fixups, the merge leaves read_profile() as it is in
> 79011a80f064 ("proc: give kcore, kmsg, the kpage files and profile their
> own file_operations").

Now dropped.

--q85SQ3K7Taq+ZUj6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFdTMACgkQJNaLcl1U
h9ChyQf+JwozgQuU6NWLtwkeSTWjQ81onmOXrsXFSVlZAyTd88VSVaMUZoOpshDu
Fu8JQ9HCTq7Jnm8+1ujuWAcsJWztxSCDvYPWhY2CB5e9x4CKMiA2/ZZo/82r+gua
MalzXt1KR6OHIf1Mr0ZJH4efIVqdVkqP1HXRungf0mqwy9DdA7D2FNLaybJSPtin
reWERTOk5jNHCy2vwxpugJpk2f7GxhouKCLJZqV7A2TOScbZbRtAHAQ29eO4q+Rf
BQziHaxKd4UdswvleoJI9cvX8XPHka7Adx4vssiJJbqXM5Rf+LYm/2b8+ZnkoSu0
hhD7a38+x7BX//RSCMk61TZdg4qThA==
=6WxF
-----END PGP SIGNATURE-----

--q85SQ3K7Taq+ZUj6--
