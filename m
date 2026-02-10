Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA6133342C;
	Tue, 10 Feb 2026 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757692; cv=none; b=Rb6huUXXaTyqUlpCIdphkpu1ywY9F8GYs1M2LrZUt9rqyWQXY+6qKWhk5YVIPgEpAQUzm3g2n4u2OpPlq0207TonUyLp5OuDLz73uyrt7XwO51uOwwWJueMLUChPH393K8a8ow9nBy5Pfz5y8WvibmSUZy0rM3MZNIXho+tEHYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757692; c=relaxed/simple;
	bh=OblPFK1ZQykEJX8DgG0pIy1d4Voo7x64TN7Y5KELcvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b5eMg14Ued3awczNPGX5R4HAOO5YPm10QsnTrMeD5qmaaHgN3ce1hOzeppvwvfCgsT6rcaZ6Iwh56iWkXjCvjCPpSzFggaK805WTyDUkJV8o7MQsUHcQfleH0rCUWAGpkhBU9+nAAHPFPdGoSLyq+Cym2bY3d9i1rOwKq5WlH9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIdXy7jj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIdXy7jj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69D4C116C6;
	Tue, 10 Feb 2026 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770757691;
	bh=OblPFK1ZQykEJX8DgG0pIy1d4Voo7x64TN7Y5KELcvs=;
	h=Date:From:To:Cc:Subject:From;
	b=jIdXy7jj0KaIGqbIrmL3EHSGDUs24+Lqvaf2N6ho7am+wVR5GYngvUd1U8vsHjA/R
	 jGLpcHIGs0XPNOJwlO5+XAqgl5f2NnBy1Wtqn5OB8kemZWRvAlTpu5/sPhhk1TO/Wy
	 cCtkYi/3z2v8Jfm90EpsnENlixuoTDWL4CrHKnaxwOoU5SIYfrH4kuHfjFd9bqLG6c
	 AtUowyaorxh83fdTo0NHK/vAZ2xicY4Cz69HumpiTLchX+qtmpCfhJImXNRM8skDE4
	 Bdadp5i4KUYHLy7KaKuKODrOK+g/KGckE1Y7tI64qxqU4JzwdKyp98r7/kIWXMziJd
	 fffrHBUt+n6iw==
Date: Tue, 10 Feb 2026 21:08:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Brian Nguyen <brian3.nguyen@intel.com>,
	Shuicheng Lin <shuicheng.lin@intel.com>,
	Ashutosh Dixit <ashutosh.dixit@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>,
	Dave Airlie <airlied@redhat.com>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <aYueNunEXamKtZad@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VA1StljnN5CWdLYi"
Content-Disposition: inline


--VA1StljnN5CWdLYi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/gpu/drm/xe/xe_survivability_mode.c: In function 'xe=
_survivability_mode_fini':
/tmp/next/build/drivers/gpu/drm/xe/xe_survivability_mode.c:241:17: error: i=
mplicit declaration of function 'xe_nvm_fini'; did you mean 'xe_nvm_init'? =
[-Wimplicit-function-declaration]
  241 |                 xe_nvm_fini(xe);
      |                 ^~~~~~~~~~~
      |                 xe_nvm_init


Caused by the absence of commit

  11035eab1b7d8 (drm/xe/nvm: Manage nvm aux cleanup with devres)

=66rom the drm-xe tree.  I have ignored this for today, the relevant
commits also seem to have been in the drm tree yesterday.

--VA1StljnN5CWdLYi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmLnjYACgkQJNaLcl1U
h9DwzAf/RKul8XCpqU6sZ62Vdo7F/pPn9rGiPfnWd2bDRbHHgxkHxgEp9UDrCjo0
AgfYF9J+q9L24ny4Fy1PiN7mt2MT5L8zAfoMQCTQi5TmqPt52ICeJvkq6TtxyF/E
P8KFerg4n6KvfY3o8c5IS6JmrYQ6pCTnmBFwUS4jhjAEuzlB+8q8G7wFfWKol4sP
JQ+zeSI4cnhYUqF5GX/sKEuYsTMSDtQ0s07kmdE9OckEAys0TYAc7JDgvp9xCp1R
Q0aOBpkqWl/eWeQMYerDqqa1rWPJK/oUN2i79kWkeFey4+80P5ecdSgKtyz2/XuV
WDiy/OyB25GgYcEFnuf+EHg2qKaDZQ==
=Aosx
-----END PGP SIGNATURE-----

--VA1StljnN5CWdLYi--
