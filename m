Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FCB3BA243;
	Mon,  9 Mar 2026 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060201; cv=none; b=Ye2/TEDXyLr/HBHQdlniYaY9pZYSOEUZkQjrtBeYa/ZIJdMxLA3A9c7d3in5WVaDCx5J0k14yFdmwPjWSaTmPOER25yu8b4QWXjUZNjUap05D+tIRALbuh+A7exDUVWa4b5M4vH2iTkkZbEy3hkiO7Uu9wabJNJ8/g5oM9dQ7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060201; c=relaxed/simple;
	bh=QAKR7s6xDF3BfjyK0X82e2SIBct41bCHWq4FK0mdi+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGQCnwdCpEku3KCTMdz4O4MvJJjl3gh0WKja/LUd7mCJYMaZpsK4nd1eY+z9Kf1aTwcxqAcctPdmowv4YT7rcdse/9v0Uwr7Eu4+F/M1CQkvt0dMZAs2XDT3Q7OjWjcqR5S46tWcjyPRj4z/36Tk52lXAC/Jb3gbJy12z57CVZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZyGAdHJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZyGAdHJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A097AC4CEF7;
	Mon,  9 Mar 2026 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773060200;
	bh=QAKR7s6xDF3BfjyK0X82e2SIBct41bCHWq4FK0mdi+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZyGAdHJ490XD01AYnZMf3ZPJTeqOmqAbiEembPq+9rtM8bDY4OKo78VISUitxS81
	 45W+IKPerTXLunZEYiOCHhOtA6US9+TJhuHkM6MD6nwktczjKe1rz8X21eZrfI78xc
	 M4mAddwg23QrEOe39GdNPw4/s0WtZ2OukMPxeDO+N7Y0xW/Zx1xZDb7FNvgen72xyo
	 56PCPa7DJdaNx1Oi80voR58fbuy+cf16re5F5StsRodpX7bamnSb+tEsxzr3l/136f
	 UG7vUaqG1Y5wTvh6qbxztcCrIy6RJ+WdC5SSXBIZt9wRlFAGhGKbfGcKSOMrWLzst6
	 5wwCcJa5lgC9Q==
Date: Mon, 9 Mar 2026 12:43:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rdma tree
Message-ID: <091dbc25-06d6-4847-af50-6349f1acbf17@sirena.org.uk>
References: <aa6qqi-GmXZXxubE@sirena.org.uk>
 <20260309114020.GU12611@unreal>
 <f41b2391-d202-4d2b-96d0-4f9040003a35@sirena.org.uk>
 <20260309115226.GV12611@unreal>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kHL8iPdzuJVOHoLS"
Content-Disposition: inline
In-Reply-To: <20260309115226.GV12611@unreal>
X-Cookie: I don't understand you anymore.


--kHL8iPdzuJVOHoLS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2026 at 01:52:26PM +0200, Leon Romanovsky wrote:
> On Mon, Mar 09, 2026 at 11:46:07AM +0000, Mark Brown wrote:

> > No, I see signoffs from Sriharsha and Jason but not you and it's you who
> > actually did the commit (see above, git show --pretty=fuller).  Did you
> > by any chance rebase a branch where you'd pulled something from Jason
> > (or which Jason had pushed to)?

> Jason applied, but I rebased that branch to drop patch which was taken
> by mistake.

Right, if you do that you need to add your signoff to the rebased
commits since they get rewritten during the rebase making you the
committer.  Nothing looking at history can tell a rebase happened.  git
rebase has a --signoff option for this.

--kHL8iPdzuJVOHoLS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmuwGQACgkQJNaLcl1U
h9BV/Af/VfMb28Hqy6CEEWh/gDAA8vAI568h0CnPC2jHZbqDe5D4dZruUcoF3JV4
oUz9zAyTesjVg7yuYHE6dKLvpH7IyYsMAXw8jb1yUKUPamiPEA2q1WL1ccrtSaV8
AcpAHKixeN3nPM3ranGA8taJQ0ECerq45+P15GyL1lGd2+mLHXzLxesJUZDScgV6
nrc0+mSvHQheThC7LRWOjx0uEecyPvtsyUxCpX8KyRcLSarKs6VbR5dQahGDG3lg
MRldzgb0xAzBzwIvPvPISd4dTAhAPjFjIk3Fs8pNXrMWII4uAmaleQkCCPNvoDCF
F8zY9SA2mqzv8suPE6wvGNEztLG8jQ==
=reKN
-----END PGP SIGNATURE-----

--kHL8iPdzuJVOHoLS--
