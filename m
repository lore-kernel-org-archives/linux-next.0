Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEC943F8A7;
	Tue, 11 Aug 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452899; cv=none; b=oQWMHNqkPYeF01YbuKBS8+k9TBYpPYP0S3q3fSukXyspTf2IMl4MNLlNlTfSFG7Lb8WL94fR3VZ+CNUw9x3rmssmevKiJNr3C8Vd2B29F9X/e3K/lPmIOVkLNJ+zf2tULjBITdv1mZv7KKPuBka9IRCcH0GzgExIDyIvHOkpKGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452899; c=relaxed/simple;
	bh=gQyVCDVWLB/QVyHW4dKBi5dYMoNp39ha9nC7NEyh6B8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JR1t2gHQNr640V4+cwH5nfz5JGMex5RUxfZXrE6c/12n23sPz0fDKx7tDVV3xavQGDXYVM4lFQtKwVdlbqGRxvQ0R7YZ+3M9ypw8skG7ikVyjzqRhfpGI6S1p8afaCTL6d4UGHsl/e94htNsgGEINznAAC0vwEmqYnM38wWhNjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5WIFPi2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5WIFPi2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162F61F000E9;
	Tue, 11 Aug 2026 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786452897;
	bh=201ZixQLvCOUtApKnA60+mdDq5sTo+9ov0K92d/oUus=;
	h=Date:From:To:Cc:Subject;
	b=W5WIFPi2/hjEe5GaivfbxMKcRpuZbgrakK2tiRjKqMaQSbmEY2/2E25UqXnHw2TP6
	 Ei7Nvvmf6Mk0+1vejodKRpDydf+HBWRHi3wkEw1VTZrU/YBv/krYEQ8Ri0T/b48mW+
	 ATDtfqH5ofV9SowRh0uble9BpGWGAgKuM9yg6bO+g2ZMDWvblabupvC6UGXxyTlNNN
	 dSg00qtJ1JcW6/uwwGUjxPKe6AlFbPDYiSbKHblVqMVS+zp+bnDDPpoIQEYN8J6sKA
	 J2Tqufzr4/sxGK4PBClYc5BLJ+Cqn7dGy6TRNHQ51jFPsY7ffnJvZWOR98Bpa/+CRs
	 pSwgUu7labAUA==
Date: Tue, 11 Aug 2026 13:54:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the f2fs tree
Message-ID: <ansbnhNDd8s8Inc6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yyS9yRx4vd0rvYnU"
Content-Disposition: inline


--yyS9yRx4vd0rvYnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the f2fs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/fs/f2fs/inode.c:1065:6: error: call to undeclared function 'current_is_kswapd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 1065 |         if (current_is_kswapd()) {
      |             ^

Caused by commit

   7451b3cd93b30 (f2fs: call __add_ino_entry out of the eviction path)

I have used the tree from next-20260810 instead.

--yyS9yRx4vd0rvYnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7G50ACgkQJNaLcl1U
h9DIBAf+LpgZK4JZ9aeTeOu1BeIoaPkb8ocBJZg45kAgAizfOoWdiWsbptrxL5k9
F4E60/tWPql7cI9T9dOT4jnQFz0TfbpK9YZwiq79e50LBGv5ViQhh/ep1ItC7XNV
xfy9HcOQ5WMe7zCrgxcOuO+5TpVWWFXySbcxReulGRxYOQpgl/dh8EaJX5KEI6a4
SRZJE6+mo0M4VqQ2OvRFXsNQfJ24NzjIruGGhaAnzToy5awEyx696DnIDE8coWie
NSqyGC1IZgEvUVOY6QXiDmlW4uwhAD4xMEO9x2qjAPn2oB/vWDF0zBGAL8wpt+EC
rZtQZYYI8+7K/H8MbqX0DeKmoNLmsw==
=yfiQ
-----END PGP SIGNATURE-----

--yyS9yRx4vd0rvYnU--
