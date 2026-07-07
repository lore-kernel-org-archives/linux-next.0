Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D74410D20;
	Tue,  7 Jul 2026 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429118; cv=none; b=odAQn7a5bJquO4zBCQSKKilNPARXkTeV5b8g8Z5MtiQDU0SUq1jNhFb1RWAiW03fquAP7BBLQzEoAsGms81/LUwa5AMyvQnRzKx4M6EpYR+f/uQkV+zBhPny5spjlyCECUVE91rwujeyr4I1zDmbxXgt7f2khYPTSbQfGpboXFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429118; c=relaxed/simple;
	bh=Mt0IsgqNK+fRBvrqiWJ/Fktvx+Bh4Um90VSdMqhLHFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJorQVJHwaGJBc9YOaM6cbF24GOWM8JmMDfYQAskYlKW9lYjCNPfufmzwmpTuEtTAzMyfAmMAdBZ5f2NLx7rytys3HGly0+fptrTrQeiVP9ySRX0hmnMbgB4Y49k763kp3ZXjnFBD3b/YxYwHo45r77zCWF4qfxRdl4i8Kfz0C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQu0NQcv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQu0NQcv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973DF1F000E9;
	Tue,  7 Jul 2026 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783429117;
	bh=rgSqYybarv/bgpc3er8FQrtWGNeqhwsmW7C4wBzrItw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQu0NQcvJ/nH97SzV0FghNwZ4h36X1o8DmR+3gb7pnmK65iX6fFb4aSUVv9k5wdnB
	 J4Pgt0u27EWky1i2vhKWpOqd59bxmO8Qr9SyegKuxYxKxFsSl0pNAUoHdAVrnpc6Ci
	 yo4IVK9z5sKAVrSabBAsH2zwIjfnRB63yTQesyIMeasJy2caF8ONqf36XJ8OKPy5zq
	 IKUMs+Hhm060E3yivtlYc8VdJTlzYie/tZR+DzCfSCcSuRwE1aQEY/sEOKSCUmaJEK
	 aVIBJIuo82PD2dyvhAYiThwsZXRvMhnX6VCXMd0hgWbsndABPre82lp9uGC/fU2Wuv
	 M/LV6FiSt55Fw==
Date: Tue, 7 Jul 2026 13:58:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Build failure in the final build
Message-ID: <00d8bde5-d05a-4295-909d-21d73973015a@sirena.org.uk>
References: <akztC7H2IsEKaq4i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zdqeeX5lXEnUCXjX"
Content-Disposition: inline
In-Reply-To: <akztC7H2IsEKaq4i@sirena.org.uk>
X-Cookie: Walk softly and carry a megawatt laser.


--zdqeeX5lXEnUCXjX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2026 at 01:11:55PM +0100, Mark Brown wrote:

> After merging the kvm-arm-fixes tree, today's linux-next build
> (arm64 defconfig) started generating warnings:

> In file included from /tmp/next/build/include/linux/limits.h:7,
>                  from /tmp/next/build/include/linux/overflow.h:6,
>                  from /tmp/next/build/include/linux/bits.h:32,
>                  from /tmp/next/build/arch/arm64/include/asm/kvm_pgtable.h:10,
>                  from /tmp/next/build/arch/arm64/kvm/hyp/pgtable.c:11:
> /tmp/next/build/arch/arm64/kvm/hyp/pgtable.c: In function 'kvm_pgtable_stage2_relax_perms':
> /tmp/next/build/include/vdso/limits.h:8:25: warning: overflow in conversion from 'int' to 's8' {aka 'signed char'} changes value from '2147483647' to '-1' [-Woverflow]
>     8 | #define INT_MAX         ((int)(~0U >> 1))
>       |                         ^
> /tmp/next/build/arch/arm64/include/asm/tlbflush.h:131:33: note: in expansion of macro 'INT_MAX'
>   131 | #define TLBI_TTL_UNKNOWN        INT_MAX
>       |                                 ^~~~~~~
> /tmp/next/build/arch/arm64/kvm/hyp/pgtable.c:1361:20: note: in expansion of macro 'TLBI_TTL_UNKNOWN'
>  1361 |         s8 level = TLBI_TTL_UNKNOWN;
>       |                    ^~~~~~~~~~~~~~~~
> In file included from /tmp/next/build/include/linux/limits.h:7,
>                  from /tmp/next/build/include/linux/overflow.h:6,
>                  from /tmp/next/build/include/linux/bits.h:32,
>                  from /tmp/next/build/arch/arm64/include/asm/kvm_pgtable.h:10,
>                  from /tmp/next/build/arch/arm64/kvm/hyp/nvhe/../pgtable.c:11:
> /tmp/next/build/arch/arm64/kvm/hyp/nvhe/../pgtable.c: In function 'kvm_pgtable_stage2_relax_perms':
> /tmp/next/build/include/vdso/limits.h:8:25: warning: overflow in conversion from 'int' to 's8' {aka 'signed char'} changes value from '2147483647' to '-1' [-Woverflow]
>     8 | #define INT_MAX         ((int)(~0U >> 1))
>       |                         ^
> /tmp/next/build/arch/arm64/include/asm/tlbflush.h:131:33: note: in expansion of macro 'INT_MAX'
>   131 | #define TLBI_TTL_UNKNOWN        INT_MAX
>       |                                 ^~~~~~~
> /tmp/next/build/arch/arm64/kvm/hyp/nvhe/../pgtable.c:1361:20: note: in expansion of macro 'TLBI_TTL_UNKNOWN'
>  1361 |         s8 level = TLBI_TTL_UNKNOWN;
>       |                    ^~~~~~~~~~~~~~~~

> Caused by commit

>    100baf0184896 (KVM: arm64: Ensure level is always initialized when relaxing perms)

> I imagine this will cause an allyesconfig build failure when I get to
> that due to -Werror.

Confirmed, nothing later in the merge fixed the warning so -Werror
triggered breaking arm64 allyesconfig.

--zdqeeX5lXEnUCXjX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpM9/kACgkQJNaLcl1U
h9A9aAgAgVA4maPqnpzpACb1cLYd69k8UIH7ElGOZLjrItzTWpAvQsVU6NCDaso5
N+XKYuidnvkApaPY3JqF/8nuXssHodRdIcLOZP63jCpXvdMzEAWpsujfxTj8TQrM
HRAEn3hO+1Wyryx313LhhrLzPtHYbhQ7g4/a6rpgbg08U4QtRvykuoN8IDPHq9M5
8I+IAGBObW9EpPJoOJHU3RWFmkmXKwwwrzTgJq+xLGaiVat12iygZ1LdqsYDfRmd
TnNsvdWxr53RPrMPb5w5PFlMAGMay1Pk/WN9udxqHrDMfdga9RPs8bVzlDq6l+3T
8ZmXVm8UGM9c180oOphXFXSZR+faUA==
=aW1j
-----END PGP SIGNATURE-----

--zdqeeX5lXEnUCXjX--
