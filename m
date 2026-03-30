Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14CE2DEA68;
	Mon, 30 Mar 2026 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774908761; cv=none; b=FlplefucosQmx248doXIMgxIaw0nC4Mfu7Pr6TSeIEU/WPB2avBt1gJZJo24B+SpZf62CAt6dL58i9sxBbSgJrkybMcH1BogqQGuiO5tIMfReTWksbr8FdNWo+tustmHHBDG+BB42upOd/yU3s19EjOSNMmdJiGB9MiKMo6h0JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774908761; c=relaxed/simple;
	bh=OzE+AyVFnQn3pwCOWRJy6q0Dz9zb6lseqn+VWVIi2MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xa3qMxFsVTkdwqrkBiGHQKt6nDNIS5oRwgK0fIIwDynE0BKSxY79yiU6nOncmy14TU3F4aWarnrLxQVUeLjb9LCIMJvdlju2YADEB9f8lnfos3nCEKVzOoHItXC7erVzq6NWWl/fRWNRLmuwQEBwooCwrDoBzYcGNFsG1m/wbG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZHxwxXz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZHxwxXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713ACC4CEF7;
	Mon, 30 Mar 2026 22:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774908761;
	bh=OzE+AyVFnQn3pwCOWRJy6q0Dz9zb6lseqn+VWVIi2MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mZHxwxXzdY6cc45j3F88EJfYqrQXKXfa3WCwnX7qwFq//0ZdzWRtxJAOL1H0zF9Ok
	 2ewzHXtX7Cs5escSOtXMaVElhIxaG5rcwxZAWG8QGtAMSl/pCaspVTPCD0mrtwmyI0
	 NSgqqnzjn9eTXj2TNZ2MRwJmXvhCA5vC2N1Gc5aXEgmPv0BN051UEIH626BRaWWJPf
	 W5tRDgU3zalMq6tAktTga5MhT95/V+8JiAL2qUgj+ZevWCOS8aPDhArneJ8nDLt2kq
	 SFLaB0kduIde5n5A4u4OR/S9dE84fCacfefLjpZZc05VdH2RdqQ5f1S9KnsVSTe1H+
	 MZq4s5HhNtwiQ==
Date: Mon, 30 Mar 2026 23:12:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the hid tree
Message-ID: <fa4b8b25-8b34-4314-a7f3-ea7143ed9247@sirena.org.uk>
References: <ab096wLbcpu0M-GF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NOSOtbKuEYS/Xscz"
Content-Disposition: inline
In-Reply-To: <ab096wLbcpu0M-GF@sirena.org.uk>
X-Cookie: Two percent of zero is almost nothing.


--NOSOtbKuEYS/Xscz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 12:30:35PM +0000, Mark Brown wrote:
> Commit
>=20
>   142068281f513 ("HID: input: use __free(kfree) to clean up temporary buf=
fers")
>=20
> is missing a Signed-off-by from its committer

This issue is still present today.

--NOSOtbKuEYS/Xscz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnK9VUACgkQJNaLcl1U
h9C3EAf6Ao1a5fHNs/5fXh+e57IhWTQccZ92IK2wi74r+Nrvu9Miij4YOmnJkjcd
BlkCPXtmCo7gsGOXwZHpEuViQWz9Ka+w6GXsBdUjxKTcWHOwRe9SiciC+ykrItEW
aQg719lfBQEC9b0Ys8cHwT78ECjQdSjHidceU8ncAKhicG3WRXRvIuM6Akiys2K2
v5DmQnk3mgtEjUYX7r8m1pBYkKQKtdakpWY6ynHjr8bWizCU98MrLtqM5d8ryRTq
68tPhbaTuRNDN4xFbZMlClm6N6Ht4+n8LRmu8ImkxldYGPZnSjmn5IKj87e2NKWo
m5jZUDi09QrzV4zkkyFYEOAT6DM25A==
=75k1
-----END PGP SIGNATURE-----

--NOSOtbKuEYS/Xscz--
