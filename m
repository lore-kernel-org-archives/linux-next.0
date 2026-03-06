Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D415D3A901C;
	Fri,  6 Mar 2026 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806196; cv=none; b=EpT3Bm64PspDolDYDVt5SQTD1AfW+Nhw5LGOxqwe1aACDDKTanDdtquRBnOBUl/byhh7JgrRivT/DWJX/x7ONxFlVcp0ElsECSyx8vSV3PhrO42gZ4t+nks8oQdGGOIULU6rsed57HaNgHUudzfODE8kXI3TPd6eqzx0/a8Mzm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806196; c=relaxed/simple;
	bh=VIOqD51JU3arGYgG3kmhzG+v3vV+BJOpVAC9j6+aeUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cY3Zgil9St7zVSBTh8rhU/af24PybiZKNiiNJaR/pHrX308yBlOco9l0r1++I03cEAjCIqXPn+e7VXE1zcrexkG/9CbqPyFUbNp4YzRIJEDzfAx2wN5mvcqT7nPh0vTgn2OamYaTuqQSx5AgdW7edxiK48T+trtSz5xxqScCxJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XR0L4uVs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XR0L4uVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0902C2BCB0;
	Fri,  6 Mar 2026 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772806196;
	bh=VIOqD51JU3arGYgG3kmhzG+v3vV+BJOpVAC9j6+aeUY=;
	h=Date:From:To:Cc:Subject:From;
	b=XR0L4uVsWJTI1PsboGlI1xJu54yoskcW6RKO0FDBpOjKTR/0xouEeOVsnsb2dC4Lj
	 +FgowI4sLCyw/h9mjFezJdhjfiSOaQolSktEORsLVoUz6MkLdnG2dgXDTidTRSaNrR
	 0zfUosehjpOYmw4xPDkLsAPEoMpXM9iUiAW5sAhnwH8aOpZL6LOpyfjXsEL07qTQ3T
	 OXYMZRm9zF/Gn0zanR5PxZSYqzjumFOlAa3yyh5f3H6QUglGOl9+KLSfaAJ+ugoHcU
	 yBkTm+xgah6famiLIRZ1CjCah9IlpEPXCSe7SW5EHGIAozwFT9nD3ftu1fPCWQ5z9J
	 0Z3/bEiBz5bPg==
Date: Fri, 6 Mar 2026 14:09:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <aargMJFh-37NAsbc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IQNwqNuXbv4/M+cj"
Content-Disposition: inline


--IQNwqNuXbv4/M+cj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c: In function 'iwl_dbgfs_sram_read':
/tmp/next/build/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c:135:15: error: implicit declaration of function 'simple_copy_to_iter'; did you mean '_copy_to_iter'? [-Wimplicit-function-declaration]
  135 |         ret = simple_copy_to_iter(buf, &iocb->ki_pos, pos, to);
      |               ^~~~~~~~~~~~~~~~~~~
      |               _copy_to_iter
make[9]: *** [/tmp/next/build/scripts/Makefile.build:289

Caused by commit

  4f2ea80dc6c44 (fixup! treewide: fix remaining read/write iterator conversion issues)

I suspect I ought to be applying a merge fixup however since the block
tree obviously isn't intended to be in the state it's in anyway I've
merged the version from 20260305 for now instead.

--IQNwqNuXbv4/M+cj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmq4DAACgkQJNaLcl1U
h9BfIwf+IHChtxF6IqDcpNpVgpNDo6o10M0kRc1EnzKnWNFeITWmyO/2ZCdM5aXQ
o45Pi1CXJl9FBA5ciKRkOhFpgqmykkuX942aw83PHF4T2CckvdYnuUcIPOQlI65V
01OValaHabpGCsukWg1PxT3Qd5bChW+hnG9JmWrolkHkf0zWg7Pvz9Z3A+MEELtV
+ipzqim7jS4qwynDNHPsH2yt23WGYcYO5PkfneBoi7fK+u0riHtCqIWtAmdVbgBL
0I5PAdSo2V3UwmSPy1L65tzKMN+fRQyjqQaGzSrje3yXotV6GPDDDmPFqBZ3IcpZ
ywQA4K2vMJMQ+SPElMPluy50t99fQw==
=PJ/B
-----END PGP SIGNATURE-----

--IQNwqNuXbv4/M+cj--
