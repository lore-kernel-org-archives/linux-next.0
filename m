Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FFE3FD140;
	Tue,  7 Jul 2026 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426320; cv=none; b=mwcfbbMvjrnIwfwiOyA3XaVGITY8pOq+LnPEESfVaW3X85Y4MxI5Qeoc89Zp5my3NWACILLKXeLhLIYAiTKrq8b82IMOD9WgXQF/qKb9JnszS0Hq/No9HMn+4gfgfQl2D8RhDsiUxoyK2AahNVSJI/WDNs4DZpa9KXA3/g24kRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426320; c=relaxed/simple;
	bh=EjaahBQ+wOjK/sAI31Sn7whfySTfMsWlcSRy0LbcPHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9B6mODSbkLv5vo6UtHSLwZZ0y4HFdARfcoFg1mmW3wGJNc+MmA7/4QxrYPZS5Goj0LlyaXBKV8nz/XSua9HZGvN4paI95IPoR/gQ5g1HI4s/9ZL7cSe+MF7pZwX23unZ0pIeZDmCrpMNMijtK/lkfEoszJ0B8ZhjUGB7v47AIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDEqqNm4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDEqqNm4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1FA1F000E9;
	Tue,  7 Jul 2026 12:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783426318;
	bh=gaJaIbUYOTFZkJu+U2YUsp6kajsFPAMQqL+puFuNJJc=;
	h=Date:From:To:Cc:Subject;
	b=dDEqqNm4Pnv9o7+7HBrB/WOvSuJgsA1FWyPt+sW22bLP6WobosPPRygr00wTH7Law
	 bi+3lrqDKM9K1la1anqo/0aMoWkuzVeWPcGg3zXmv3EoOHzSQQTLNhAdwrYRMTBERf
	 25ou9KVS5ZTtpXwKehgi4wFJmoEz1JjtOPqW37mGuYM4ayxwBtQnqxNDm0qM0aJ7FQ
	 gKIGF6cTFEr3hzjBKsYSBCPw4GPWaDKfcleIs99gAa+ivkbSp5oxt3AeeONGRcWT3+
	 Qt0isyQ2PDurUPCUewbmaKPBO8GrXW4DsIJfiFhrYOXOb4VuHh8ndqJUXDev2KgZfE
	 mSak2qDs9eFnA==
Date: Tue, 7 Jul 2026 13:11:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the kvm-arm-fixes tree
Message-ID: <akztC7H2IsEKaq4i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5fie88BGLD/dBViL"
Content-Disposition: inline


--5fie88BGLD/dBViL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the kvm-arm-fixes tree, today's linux-next build
(arm64 defconfig) started generating warnings:

In file included from /tmp/next/build/include/linux/limits.h:7,
                 from /tmp/next/build/include/linux/overflow.h:6,
                 from /tmp/next/build/include/linux/bits.h:32,
                 from /tmp/next/build/arch/arm64/include/asm/kvm_pgtable.h:10,
                 from /tmp/next/build/arch/arm64/kvm/hyp/pgtable.c:11:
/tmp/next/build/arch/arm64/kvm/hyp/pgtable.c: In function 'kvm_pgtable_stage2_relax_perms':
/tmp/next/build/include/vdso/limits.h:8:25: warning: overflow in conversion from 'int' to 's8' {aka 'signed char'} changes value from '2147483647' to '-1' [-Woverflow]
    8 | #define INT_MAX         ((int)(~0U >> 1))
      |                         ^
/tmp/next/build/arch/arm64/include/asm/tlbflush.h:131:33: note: in expansion of macro 'INT_MAX'
  131 | #define TLBI_TTL_UNKNOWN        INT_MAX
      |                                 ^~~~~~~
/tmp/next/build/arch/arm64/kvm/hyp/pgtable.c:1361:20: note: in expansion of macro 'TLBI_TTL_UNKNOWN'
 1361 |         s8 level = TLBI_TTL_UNKNOWN;
      |                    ^~~~~~~~~~~~~~~~
In file included from /tmp/next/build/include/linux/limits.h:7,
                 from /tmp/next/build/include/linux/overflow.h:6,
                 from /tmp/next/build/include/linux/bits.h:32,
                 from /tmp/next/build/arch/arm64/include/asm/kvm_pgtable.h:10,
                 from /tmp/next/build/arch/arm64/kvm/hyp/nvhe/../pgtable.c:11:
/tmp/next/build/arch/arm64/kvm/hyp/nvhe/../pgtable.c: In function 'kvm_pgtable_stage2_relax_perms':
/tmp/next/build/include/vdso/limits.h:8:25: warning: overflow in conversion from 'int' to 's8' {aka 'signed char'} changes value from '2147483647' to '-1' [-Woverflow]
    8 | #define INT_MAX         ((int)(~0U >> 1))
      |                         ^
/tmp/next/build/arch/arm64/include/asm/tlbflush.h:131:33: note: in expansion of macro 'INT_MAX'
  131 | #define TLBI_TTL_UNKNOWN        INT_MAX
      |                                 ^~~~~~~
/tmp/next/build/arch/arm64/kvm/hyp/nvhe/../pgtable.c:1361:20: note: in expansion of macro 'TLBI_TTL_UNKNOWN'
 1361 |         s8 level = TLBI_TTL_UNKNOWN;
      |                    ^~~~~~~~~~~~~~~~


Caused by commit

   100baf0184896 (KVM: arm64: Ensure level is always initialized when relaxing perms)

I imagine this will cause an allyesconfig build failure when I get to
that due to -Werror.

--5fie88BGLD/dBViL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpM7QoACgkQJNaLcl1U
h9BFsQf/Vvwdl7G1JFJquzIQ3Gg7RrpblakVefGlVoxebktiHIJpOyJi15bQT196
DCyWnYC3H8SGujWGTcTdIgo+dPkKq+etyPtLwylQJD4MeQQbiCpUuqRXybYNEywC
/XUTViGgBfuP/tzpmvlsC8YIiCi33nZ0XXkyq6sAnsH6Ptn724nuZXQGIJEFDDt8
Ri07LrbzRJH+kBZKjrzrUOI3UIFYpFv58CH7eeKQjS6MEcKS5RfIGYR02EBcmSqB
FTyjJPkkWhkKKyOCZNi2X+kyLexuhfeIBoi7ai4o1lYej6J5xZsAmQnevnqazSIX
Dzzj+4SjKaW3n0d2EdYIbn0hHR4pIA==
=/l0Q
-----END PGP SIGNATURE-----

--5fie88BGLD/dBViL--
