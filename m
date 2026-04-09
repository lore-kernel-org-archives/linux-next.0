Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABFE3A9D8A;
	Thu,  9 Apr 2026 12:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775737517; cv=none; b=aMBM9FiDVhVrSmmCjb+1gwhLROG/7aUx55DNQBoDfQO563A0oAVdi6DMibUkXoFvWV3i/gnZgZBnulxEUIo5z9UCtZ6WYgBEpVWZBES1rs/tjxzluMtOmNNO5RX/XM1z/eLvhPBw8gKlOLc+LZRQUcOXSDGpr+Q3Vdx53jaEWHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775737517; c=relaxed/simple;
	bh=gB4dFDp1WudUk8cpyV65/L8cJXgH3T4ZT7LOV0rf2nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFsE0/ngmA3DqOQCybTmZeViB/oTg9MyHLE5LnSayXtC7oes1cjd2yBgfF35pvyUETOEkuIvLdQ7tBHqOarpGjVpqnajHN1knjkgu5lLjZQv9Q7UeZ4QFTE4dCTChl0wJJfKlPLJOkj5Kg+0+G5qKsvzsUa/3J3cYBoGiFqGUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXQKN38L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXQKN38L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15372C4CEF7;
	Thu,  9 Apr 2026 12:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775737516;
	bh=gB4dFDp1WudUk8cpyV65/L8cJXgH3T4ZT7LOV0rf2nQ=;
	h=Date:From:To:Cc:Subject:From;
	b=lXQKN38Lv2PQ/XrjinmVuz6/Z5i9vmAJLX8i3X1SIH9GDFtgCrwmOzz5jIndqvUjD
	 pTsCccjRArSQ+RDL5+3REpgRA2/sAZeSkcQKXwXrReo6TB+rf2I930uxz+qLStX5zs
	 YtPnozAXTRdiSJ94xSua8MP31LOV+ZsGl7w4cgvcvI+SqU0UGILCh0GUSL+MnCFXqO
	 tXEstd8Ti/dxNVpWGTLLs1xUM6i02GFLcTIzl36VVLCylCHxng80usfFpM8bOj9nUd
	 wGhSt3FYBBdCOQHXBDtIqtbig2cAp7/orjE9jkPl1XT+0CBHW/aZkom9vwONopdNP8
	 DgN5gqxtsC8fA==
Date: Thu, 9 Apr 2026 13:25:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <adeaqUCOU91HTsj3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CcxB6SF6nhKmnF0/"
Content-Disposition: inline


--CcxB6SF6nhKmnF0/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next build (arm64
allnoconfig) failed like this:

/tmp/next/build/fs/sysfs/mount.c: In function 'sysfs_init_fs_context':
/tmp/next/build/fs/sysfs/mount.c:75:37: error: implicit declaration of function 'to_net_ns'; did you mean 'get_net_ns'? [-Wimplicit-function-declaration]
   75 |                 struct net *netns = to_net_ns(ns);
      |                                     ^~~~~~~~~ get_net_ns
/tmp/next/build/fs/sysfs/mount.c:75:37: error: initialization of 'struct net *' from 'int' makes pointer from integer without a cast [-Wint-conversion]

Caused by commit

  9a8098b1d5023 (kernfs: pass struct ns_common instead of const void * for namespace tags)

I have used the version from next-20260408 instead.

--CcxB6SF6nhKmnF0/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnXmqgACgkQJNaLcl1U
h9CGtgf/XBXWbHhtnU+kpgThUj+tpi24v05GshfEUeHZXvjjtfNWvZtzAHgnvmxN
ZGQchISDGxvAqWM+qeNrfW/gtblillXqayvwFZwbmUMBDDUbPy1kxzwqservEoIG
w79Ot5HMEE8KzwKzzYTKI5h4wvVZA1bfdHdeK9jPGXLULHF7vOiiyV9bPSuhCawH
5z+PNjZI7AkMyiiS2MvHKvSC0Ea8Ty9T8sXK4M2fX4m8TpUEO3djyP5g5uiLXkDc
aIH0JUqFx/jenmiT2Eki0ZhXEapXIjTkBKc2csfWibujwcb3r7M9DvyqEEOhriq8
GpENE12e0RuPREEWR1Xt/SlHmzQfnQ==
=ZgW6
-----END PGP SIGNATURE-----

--CcxB6SF6nhKmnF0/--
