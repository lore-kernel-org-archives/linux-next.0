Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442436;
	b=luY0rNCdgr0MzJlULwF4TEhRWFYbmFnVHCBQA3AvQsOpaU4jkeiEENo8ISrSULXVWy5R
	 KSEAWb1LtiUT55gOoW4TJ8r0l4C/todYsTVz+IwJUOoT0nsqGydiLFFd/pr9Fzb7+IURI
	 xOUNRZgHInoTMDV02usTv5incpVunEUcZgZHA2chUPYMeKZFTesLbaWRJHeecVLsqtE0P
	 VATjx/YPSdc/dB1xbjYjx7eef30d6q/Xa12Mgvz2su3RVcy4XhNiO3jsOYNrfCrjpiA24
	 lb2lD8MN3R1bshhE3j755R3qskVVewlpil8tUDMEGDj9YbWQe1WKgTsgB2dwBU457Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442436;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=D1n1gq7/HnJA1GP3BPoeVK1N3helvEZp1cKsKUYlpY4=;
	b=1YmWy/jrDq+GRbi66ohi+VredVFzvuRQu90FT1OfigLVKCxgg2WLmeh0DApGaBQG5NUY
	 5mZ8P/5msoY8RdK5wrioHne3KdynH8RPQ8PQlWVDkEfhr57ksx6tRBw7RTCl3y9S/ZBVr
	 /DKThwUYD7/1rhT8sAIU9l5b8YPJ59lT3fh84Xh0Z2lZs7EQupJFbOiB96D5T+o1td4EF
	 902/JpA/YLSGvV+NOLy6vWlW/ThN4D4b4XuMeYwbaMTR+0Lj4IVFWjFsFI+Qa1gKrWWBq
	 YeF5uKtnNWAByJOKvOkESpMDSRAQNTuiwLuzYcyG9wYBZd3xKTbv/MD5d1ZNDqXOZSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjviYaYu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E7F606A31A;
	Mon, 23 Nov 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VjviYaYu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7E71F000C0;
	Mon, 23 Nov 2026 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442436;
	bh=D1n1gq7/HnJA1GP3BPoeVK1N3helvEZp1cKsKUYlpY4=;
	h=Date:From:To:Cc:Subject;
	b=VjviYaYu7kw5IGqbKSleHpONzMNiqZgAhb8B87DbU2WtSKkrdDK5EPqNqpp38qnja
	 WcFxDIuehsiuYRc0765d7PwYMaOQL+MzNhnRBNoWH+Oc1QjnEUiqWXmnWVkGyggZOK
	 Ub+0v+vMaLWguQYyl+qYct3qU9YCiQN59oQGLaQy8s4kUOnIQCSUCS2eLrbKyDPSGz
	 zvq1G7cmVm8i3HmKQwCAncATifTpYQH4wfAdnhDvAUkZvxFTVYnmW25C2qK9dp1abx
	 +VWhcl1BVFP9EI68r64DA8De820SX1FXIirVi+P2v2iGfQ6tB2VIHmJKYLGDGQrGIq
	 oaIbr7AaND+bg==
Date: Mon, 23 Nov 2026 14:00:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Dmitry Ilvokhin <d@ilvokhin.com>, Ian Rogers <irogers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the perf tree with the mm-nonmm-unstable
 tree
Message-ID: <awRHAIi2TSeFOKpB@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="koDNqDwlmipyzb58"
Content-Disposition: inline


--koDNqDwlmipyzb58
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the perf tree got a conflict in:

  tools/include/linux/compiler.h

between commit:

  8bc0233d079e4 ("xarray: switch to __nonnull_args() macro")

=66rom the mm-nonmm-unstable tree and commit:

  bed0673e839c3 ("tools headers compiler: Synchronize compiler_types.h with=
 the kernel sources")

=66rom the perf tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/include/linux/compiler.h
index fad2c6131a80c,505fbb0080d06..0000000000000
--- a/tools/include/linux/compiler.h
+++ b/tools/include/linux/compiler.h
@@@ -68,15 -34,6 +34,10 @@@
  #define __naked __attribute__((__naked__))
  #endif
 =20
 +#ifndef __nonnull_args
 +#define __nonnull_args(x...) __attribute__((__nonnull__(x)))
 +#endif
 +
- /* Are two types/vars the same type (ignoring qualifiers)? */
- #ifndef __same_type
- # define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof=
(b))
- #endif
-=20
  /* Enforce static storage duration. */
  #define ASSERT_STATIC_STORAGE(name) \
  	static typeof(name) * const __always_unused \

--koDNqDwlmipyzb58
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsERv8ACgkQJNaLcl1U
h9BWNAf+L+6bfrcExSF4oANOHWsKy/h9BkNSTManzqGDzDgSkXtc9v21WpkZDWxy
MPX5WmwK6jT2hAWsKUeibmRf653CAizGF1GqJkk8qtAh3jhrLnfNabHzZAtei4fa
JL2CkDAt0u8n7pq9C5vfGvWdjH+lOoCxt/rZAuUFajhPGqD/UMMA0+0PRVoICqTU
DjFT/WoXnV89pTbsjM8QBh/jQTLKJshcaTIfAYeT3z9WK3GU/4CZKwkq34s4krRZ
Xmq6YeHDpCPhk7cNtN3pVefdCmlmFJSB7uWab9gkJlt9BqCMU6BTie3znfzQxsVD
6/EvAzf8M4YgBIdXnxgB7SpBY6y5Jw==
=q5kJ
-----END PGP SIGNATURE-----

--koDNqDwlmipyzb58--
