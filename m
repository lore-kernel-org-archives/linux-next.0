Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE034DCF3;
	Mon, 25 May 2026 12:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713871; cv=none; b=bRGK9oU8NZlk+ZpEa6VkgDmOnirAgkguxQkHNk3fYScanN6iWXSkdq2Vj5WBDaBsbHMM0ukfxOUX9Ck09aMw6WPFDhX3+QQ/PLo+Q84rzTzg+5ukSww9pqnwakAwKJ7id+ZTI/NhdJV8nKc/Odr7PYiyxP+qvFNxZTNvGoofSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713871; c=relaxed/simple;
	bh=+xXxVyzgkAz+9xZE3yBoAzvHrYtroVldeUN0S6tydb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RyvdqPyKzkZdVVZevQa+++KAw+lS7ZlefFI6XOfoBupTBJul1dT4MT8zqeat4rVwN9jK7bK5Tif3x9HBxdqJfbdaQ1kYI26ftCBILe51B7RBvK83FrmEUtSQB6iJh1KofSPMreaT31eGFHM3IMqRphst1Im/gjUTWCdI9tn0zT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCIroOxr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCIroOxr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD521F000E9;
	Mon, 25 May 2026 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779713870;
	bh=KBKtnQLouRvRyrEUdzdWfqEmANcEFzKhpzmwRUz0m+c=;
	h=Date:From:To:Cc:Subject;
	b=dCIroOxrFWxfCm8svb/GDnWlOCYBdxWCzuXq+j2d3CZNBqyhzPHpLrzQ2OKebg+58
	 74LENKYYWpfQ4qlsHiWQHK2Xa9JF1N0urfDsOKaKjT8Mgds3xixBfTY8L0kHTtaq5Q
	 HorsCYCokd4CphETaEBb29lTmPmnetZ34u3WGyCeZ8LCSzdqcl6awYT5bZgbNxSY1j
	 zBVAcxZoMvA4L2fLu+kc4CbLD/E92QmOPiRv3I6UGEPZ7SGmhTHtsmrQhBHlmwRL8f
	 cb16w/PJS1s4Fe07Ar80KHwh4TlN1SsnV8VIOZqQsZi1xgyGgxZdSNWzDcRyG3iejx
	 wwcd+vmd8zlYA==
Date: Mon, 25 May 2026 13:57:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the nfsd tree
Message-ID: <ahRHShZFjI8AsT8G@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GeDQLoFAPeaL9Mi4"
Content-Disposition: inline


--GeDQLoFAPeaL9Mi4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the nfsd tree, today's linux-next build (arm64 allnoconfig)
failed like this:

ld: Unexpected GOT/PLT entries detected!
ld: Unexpected run-time procedure linkages detected!
ld: fs/xattr.o: in function `simple_xattr_obj_hashfn':
xattr.c:(.text+0x2f0): undefined reference to `xxh32'
ld: xattr.c:(.text+0x300): undefined reference to `xxh32'
ld: fs/xattr.o: in function `simple_xattr_hashfn':
xattr.c:(.text+0x340): undefined reference to `xxh32'
ld: xattr.c:(.text+0x350): undefined reference to `xxh32'
ld: fs/xattr.o: in function `simple_xattr_get':
xattr.c:(.text+0x2374): undefined reference to `xxh32'
ld: fs/xattr.o:xattr.c:(.text+0x2384): more undefined references to `xxh32' follow

I didn't figure out exactly which commit did this but I'm guessing it's
one of these from the vfs-brauner tree that you've pulled in:

  1cd9d2387c05a (simple_xattr: change interface to pass struct simple_xattrs **)
  12e9e3cd03b5a (simpe_xattr: use per-sb cache)

I have used the version from next-20260522 instead.

--GeDQLoFAPeaL9Mi4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUR0kACgkQJNaLcl1U
h9BZ0gf/Xjfa01OGeLADxRE3s3Mq8X9WJx3x6nzjVD+qz6UNajRPWAD/BPE8CpST
K85HXusQuAePcrNIH8c0qT1R9QgXPAolOEGJyk74hnjsj1l3RM9TU6FXu819tGUv
R1aggg2DeuGnsrWyaMwcBnH9743DTrTK84YFGceHfQXi9NreLbY2gTKav8j5C/WY
aPvyAbbVOSpZ2dN9rLLgf5+Cz0N8XcjpEOcfA2pvOeXG3fm5vLVdBQmX5waxsIk0
YV9dxZkMPcJZ8aLuxxb9pahZd+UkvPNzLUNDVSIK1jZEKYJ0S23grwgHrODN6gI4
7gf4+u9rMu7PsLG8AC3p0NeT/gt3qw==
=2cfx
-----END PGP SIGNATURE-----

--GeDQLoFAPeaL9Mi4--
