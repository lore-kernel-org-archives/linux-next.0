Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDCD3F8ED8;
	Tue, 26 May 2026 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803505; cv=none; b=dRaAOOMTQos47c8JM8RKUr1WCnzqR32MiTchOHAYasInJ9rSUIO3WrSDX37Amwsytzm9j+eW3qjqYwurzG8GIMSW8KY2ThequEtATdnk/ycwkNmkjn86bc9rszey1w9hB//ckWt4Oi1S7ls8jl607K1ARGPKfBRyVR5SSNRDl0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803505; c=relaxed/simple;
	bh=SwU2E1zcFuReTT27wE+nRCLwRnL46Ubnb9ASQBOtRik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5ECHFQeoI03bIjDyqvKO90hNCqx9mfdnDe4bXFlBKH7+hKTQNTI9w2CFBT9VtXYV8c00McxCLnsy/zoJAjW5M30NtRXITOGZHJDZTAdzcO4iQ5E20xjYt0KlFxmSSg4lCjNnVN1HvYh0PKrlBAYfbPS+WRPzcFnvct5TrQbbvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5kXQbIZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5kXQbIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00681F000E9;
	Tue, 26 May 2026 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779803504;
	bh=5wGA/RmIhtUeD4cg88UQGLWDy1hcq+eWk0aL5eMdtGQ=;
	h=Date:From:To:Cc:Subject;
	b=e5kXQbIZlVGXn+KeYIMpM6Jm+VKKQUjhJ7SLhi+oU4+hoEnsFP6KJbspFYkSQeufM
	 gI65K13dcvmM5+sekOwqiJEMCQZTFYWFfrjVIuxJAVDZTir0Dvn+PLTTvBelnZzJ4g
	 uvV8wDozH4FVPoLVMBM70GLdmNw/YPKnErlN4U3/Fx0ba15sFV3AUmEewBpbiRHR4+
	 2+8gPdNTdRX5CutCIbN5muhD+bJhyO4Z3R03s6B4RDvAcjMMQ5Mm8fvmvcBNj4WX0v
	 onemGLW2P5BI6/8cUDv40ARKoZocfZEYy+ohe8gjEFxWoozaim1Ht8qsmZOWSbK1Df
	 OCqv0oQUTNLtg==
Date: Tue, 26 May 2026 14:51:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sched-ext tree
Message-ID: <ahWlbaHoXGo5icZj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6aOfT049msFHI6DT"
Content-Disposition: inline


--6aOfT049msFHI6DT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the sched-ext tree, today's linux-next build (arm_multi_v7
defconfig) failed like this:

/tmp/next/build/kernel/bpf/core.c:3379:13: error: redefinition of
'bpf_arena_handle_page_fault'
 3379 | __weak bool bpf_arena_handle_page_fault(unsigned long addr, bool is_write,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/include/linux/bpf.h:9,
                 from /tmp/next/build/include/linux/filter.h:9,
                 from /tmp/next/build/kernel/bpf/core.c:21:
/tmp/next/build/include/linux/bpf_defs.h:12:20: note: previous definition
of 'bpf_arena_handle_page_fault' with type 'bool(long unsigned int,
bool, long unsigned int)' {aka '_Bool(long unsigned int, _Bool, long
unsigned int)'}
   12 | static inline bool bpf_arena_handle_page_fault(unsigned long addr, bool is_write,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  dc11a4dba2464 (bpf: Recover arena kernel faults with scratch page)

I have used the version from next-20260525 instead.

--6aOfT049msFHI6DT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVpWwACgkQJNaLcl1U
h9BxOAf9GO5VXq7Sbz2kLVqsTR27Bff+Te2rT9O6B2oGu4yqpnNaT7z+g6286RoC
e6zOF4uCvmjq5IpVknss4QT6NzfsMJWisZiX1DECQLSdUQmuEy+nxlMUWhLutU82
R5EHvdPEG3vv5x+4DkRYQg1kPAMjhxN2r+ATwj7Ird703IS5iXDAoWT9DWk4WMmF
aAq99jf/CvMY1rFy8EHyeEplObUaHM4NSLgZJvJFU2UNmDEdPCoXLxCtFSo8O6ST
wFwMu/RnNUJOLN+/1Uxtb0wBLeb55MPDCgDFt2RLrsmZhR8ZvnU6ZIjL4iLs9FSx
FH7gkoxkVAdc3hAB2ze7AkfCF9E5/A==
=oGsv
-----END PGP SIGNATURE-----

--6aOfT049msFHI6DT--
