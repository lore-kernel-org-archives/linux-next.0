Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933FD3F0AA9;
	Wed,  3 Jun 2026 07:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471033; cv=none; b=eUvfHtAYpjN9wPKkTNM7HaPBRFiWI1RKLUezjFVksecDPh23AHWl2/1IqKSmK9bF7ucPvTazVwwhsoVeriitwZ9Vi1cdikc9jot/Mj8t9TQIXtmwPAVi0kMz8HLbHMk75BZQE9s5iMYumRl2e4zn1v6uDHlu2XDsKZOvKrDYGEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471033; c=relaxed/simple;
	bh=z+5SbE4V+e31OZL2RTEQ+K+lu4p2jq2qcaIMytjQLfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIP003N6kc87/VgBuh3NQ6q4vIuccPgF6OIDVqdtMUDQ6PLgG8Em/1ObVxtyeSKeBxeqPbvxOG7yOhZt+eo/q+tWWuDpag+YhMkDM4KnYNdCYxlXJQ5ixwagoLKmyzLNasKRKJCx05j4q6gf0jAfeGNFo1UQnvQIA1GqCx/t+Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D54d1T7Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D54d1T7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6AB11F00893;
	Wed,  3 Jun 2026 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471032;
	bh=Yb+t6QoX/Vi9FfHHjH/kJ1nnptcrQNXzVbN3ue93T34=;
	h=Date:From:To:Cc:Subject;
	b=D54d1T7Z6/IOHeuS3YksDmn9F/j3iIjs0RQuxFviZpzu5QmYglhlCqGp0umuP9/Bf
	 hRzioB6b1GfCoxhqR1Lo8dXqTdKesWWGyMluafgoWO6Vzzb9ib4mGBXnuyTEoH683O
	 szlGGo9kG46yNcqVm4VSAAbGbjcwpBUa5Y0AHSu94LgwkEBIZNimHPauQzN6g/wiLi
	 iqb+XK3x7IlLMKCrPrrKVdxK8P85xyGpOXwt6eFyg+tZ0u4EW2M3Fm4wjWxbBxwQpe
	 9rvWzZz7ZdIHa/00qG8prAM40tRd8a79gY/yDYN5f4gRExcF/ttxMmjc2ZiVt362xA
	 SYeOJfVsvQvpw==
Date: Wed, 3 Jun 2026 08:17:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the ntfs3 tree
Message-ID: <ah_U9V7DvgTYVsOp@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ggPGBFUc+cruBVHP"
Content-Disposition: inline


--ggPGBFUc+cruBVHP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  149a4d9c78020 ("fs/ntfs3: bound attr_off in UpdateResidentValue against data_off")

Fixes tag

  Fixes: b46acd6 ("fs/ntfs3: Add NTFS journal")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--ggPGBFUc+cruBVHP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmof1PQACgkQJNaLcl1U
h9Bnrgf/ZGGfNxtifcsSbBhbr3ZQ2hQqSJBNGiujJqb1fty1HGsspFA85hzPBW6C
6iBTfHsXdz6DjjqouoxKLGk1lb+HUDleU1uxI85S9D14P0iq6t41r8QWL4xb2t0f
Zpgm6Q4O/71cJKuA5XTMSQGYIpXV9eR0XuPUC4+p4zGtKkCyeqKnjY+JCnjcFGn+
VFUi1WBPQht7Jj/XiCBoWnqY6hPjNXfbpcFh/WPJO0mvUFJHy0+2GkJMFSw4LeOc
UjGdwOBGyJVfjNWnj7CTHYt7jdtwkHvAt3YXJL56+lX8vEPE7qyLmForDOFMdYXe
JgRlxZmLMFkUB94xuBNZVgTZwesszQ==
=ONws
-----END PGP SIGNATURE-----

--ggPGBFUc+cruBVHP--
