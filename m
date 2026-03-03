Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0CD2248BE;
	Tue,  3 Mar 2026 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772546067; cv=none; b=Q+i0zLCBB2S3myy2Z+dRU5KEVP1Gvl5id935vAMfgfW/+nXWW4r/JlBVM3THUbDQ8RHOD5BkomLQOz7efMbssUwKJmHCLYh9Iag88loBHdJwuGuTGAgu/hw6cmI2Ai4giQOFc4dv/+buwgpLq4xwXO8vsXwiRDMWFIQWFfCl5To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772546067; c=relaxed/simple;
	bh=1NODxje0D/j/29RDBlh2gMbDbN260od9xl1YUB+KqoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POYT+g+5uYLbJUKT88O0jC4MA5ecSgK3xhTJRKeJicUc19i3FmE/858XDl1/ivIkdSr3SOIDTIFDSQ4nbPo0uGMIxlg7Mdf3xkiYVLeJWpQHjWphePsWXaKFeB5vT+NK0JsJKr41KvkIm3rgj5Ni7t6r+u0mgWmUOMBliOXNafY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIWjRj2O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIWjRj2O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FD5C116C6;
	Tue,  3 Mar 2026 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772546066;
	bh=1NODxje0D/j/29RDBlh2gMbDbN260od9xl1YUB+KqoM=;
	h=Date:From:To:Cc:Subject:From;
	b=QIWjRj2OejaNGaGd1y0IlNqr+DRRRdgP6mpR5PLNePO+1F0lpePblF+5WpiboH8Im
	 wolEJS+ZBbPlit3Q3Lu1/WJZ8WV8UqYZwu92SaNb5agq3IGq+rUMCMeeskp6m9WZC8
	 ioNKTCmWmfHeoPevskH5NU8ndt1w28tYMbV6z6qWHD63exd1nvIFFo8iRgu/Tnm3HO
	 ZxcDSCtIlPgWx2IMSwWmK1tZeylRFE0XGqvO0tW66m/1dZHQ7A7d/h56UgM8CN5zvZ
	 NA+N/gmV/8G3efJusrwtcwtyNn8zoul13o+Am8yAMHBDxDoSr6VxTyi7j0o97ZVvuK
	 NPNLCvg7v4t0w==
Date: Tue, 3 Mar 2026 13:54:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sre@kernel.org>, Andrew Davis <afd@ti.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the battery tree
Message-ID: <aaboD-MS-2BbfEty@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FEgp4xam7WxRlXQe"
Content-Disposition: inline


--FEgp4xam7WxRlXQe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the battery tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

/tmp/next/build/drivers/power/reset/keystone-reset.c: In function 'rsctrl_probe':
/tmp/next/build/drivers/power/reset/keystone-reset.c:137:13: error: assignment to 'int' from 'struct sys_off_handler *' makes integer from pointer without a cast [-Wint-conversion]
  137 |         ret = register_sys_off_handler(SYS_OFF_MODE_RESTART, 128,
      |             ^


Caused by commit

  a065176301754 (power: reset: keystone: Use register_sys_off_handler(SYS_OFF_MODE_RESTART))

I have used the tree from next-20260302 instead.

--FEgp4xam7WxRlXQe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmm6A4ACgkQJNaLcl1U
h9A/iwf9EGkMyFHeu/bcEBaBkuQuu5gzmWEol5ELMGFM6bm16Nqm1/So5LRDFUCL
Ct2ug3yvNOqe3PRAx6tg1CYNLFnuZjQAAlCgEPUyeYstiPOuOoWzNIzmJvuveBO0
lL6YGlsm2gk84jk12Rtuj0EnsuzHJHdqMMmnrMgBJ0ov2VYvt9kxBtkFkbhoTM4m
TgwL17EGYV8sE/DaGu9zIltx3uVOGGsLN/O/AqyH3JXwfvv4BKOqvGyoYgesAqEy
k0JvQ8lSnWs/ZXhl3xN6NQse1VBAUrr5Es8xFjL4iDlnu/vMlxlGj5UBoj8Zd5Ps
LXu8YmZAb8/8NzDnCqjVfgdy30d/XQ==
=abAo
-----END PGP SIGNATURE-----

--FEgp4xam7WxRlXQe--
