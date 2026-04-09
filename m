Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3BF175A94;
	Thu,  9 Apr 2026 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775737032; cv=none; b=RnGxo+gye0zdsWVpKw+YPSGNMY1u9s1f6tmds2+kFVB4cxcu/km0vpj2Loa8cYowhD/fqzKxt7NZ9XjOxPO8GwvSDxI+2t+AFDS//IRzleo2aXvasrh1B/agOiV6xffBDH0x6iBEI593KGEQNSK0YxSS+VXQMRWHu6TulMWyZrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775737032; c=relaxed/simple;
	bh=MiJqlz0AzCVWLlGBhGGGWkWuB+IMVxSykZmEP8bYfEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHb3oFIjZdc3lhUgbZ2yk+GcS5Atf6MeLfXpX9OHAdyl7f4dEt9vTlw8HoZgzEt2ridaA/TwWOFCRFYA0ttvhOW7HlYS1WkW9Q7LfCPaK19ORpsnAeuq8qFy4JKMhWT6YiuJKmK94ApD4NLAEX7fm3GacItkAiKNvVT6HTfE5ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+1j7rgB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+1j7rgB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F46CC4CEF7;
	Thu,  9 Apr 2026 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775737032;
	bh=MiJqlz0AzCVWLlGBhGGGWkWuB+IMVxSykZmEP8bYfEI=;
	h=Date:From:To:Cc:Subject:From;
	b=Z+1j7rgBJB9IW7AlIx9kjjzCGVezTVSmLTnAjsowR4kt4LvYmTyg5LamTAzEyiQPD
	 EGjGxHiZQWUHrRdtDZH9TuV76DD5VlS9x9xWIhknUxlZmBb8E6PZ515dt9zyuvhANt
	 1Z2IQyLGOLm0FXu3ZX1MjnYZ2FqAudbCcNAxfkfv68kuPwS4vIXFYg9Rv5Zp39Rk93
	 sj6CAEMGpfLgQL0tVdV8ovdzwpQyJe6tZQLzoGRuYBT8KgoWkyRVsq004xtYd70+qW
	 jO+62NwgMD+w16d0JzcuG1T6IodA+rEZsYxjjvo1TLsuHUkEeBAr6SyriiflG1B47I
	 zDb9XK61pwHrg==
Date: Thu, 9 Apr 2026 13:17:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner-fixes tree
Message-ID: <adeYxPwylSYTR7by@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jvi1XrCRxcOYfA8C"
Content-Disposition: inline


--Jvi1XrCRxcOYfA8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner-fixes tree, today's linux-next build
(arm64 allnoconfig) failed like this:

/tmp/next/build/fs/sysfs/mount.c: In function 'sysfs_init_fs_context':
/tmp/next/build/fs/sysfs/mount.c:75:37: error: implicit declaration of function 'to_net_ns'; did you mean
'get_net_ns'? [-Wimplicit-function-declaration]
   75 |                 struct net *netns = to_net_ns(ns);
      |                                     ^~~~~~~~~ get_net_ns
/tmp/next/build/fs/sysfs/mount.c:75:37: error: initialization of 'struct net *' from 'int' makes pointer from integer without a cast [-Wint-conversion]

Caused by commit

  9a8098b1d5023 (kernfs: pass struct ns_common instead of const void * for namespace tags)

There's a missing include of net/net_namespace.h.  I have used the
version from next-20260408 instead.

--Jvi1XrCRxcOYfA8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnXmMQACgkQJNaLcl1U
h9C/wQf9HPrImsRUufe/mOLL4I7tW1bTGrHTveH16Q2AJm69uOopisLU2JncdIAn
sNlwoyLfdTdEs2Qo6ixkkNnd1DXCaJo2bJz4R/11FrS8m9BwNlk1wAKlAYCr/s78
XXy1LFdAxShnsF4n9bq5gyCurg07xb9Jpkb5jxsN1RAsTZjCWyLB3FfZSgsyrzuJ
2DNbYbgy/cMLOLaUUxOiO3UxnPBnUsN1JwBL62wLIAxUnWgBiJ+L043Tt3uyyGYD
tKCGguFYH9dSpHPHnD3oD0MwXOMAi7CtCxc7+cs2Nef7PG8gxdr7byRZra6G0XlI
m6OOOEXAh0vt/DJYqle11d60lmHSNA==
=0wie
-----END PGP SIGNATURE-----

--Jvi1XrCRxcOYfA8C--
