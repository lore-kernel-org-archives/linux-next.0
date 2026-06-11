Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C283CE080;
	Thu, 11 Jun 2026 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173737; cv=none; b=itbjlGlkb0jbE+wOeE13fWfxVMnnkAwcfAlLPXWs8NGNzwnTiL3uvh1h+oH7+xQYg7LskAirfUftQXXWLmIlKiGGHewlEXHU9cr9eMyL99+bG1V9Rnr+MZebRneunHrAu2qpPBoe2XSXYunFt1Q7ilK2VVsCUAMP53jIrPm1pss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173737; c=relaxed/simple;
	bh=bDLvt6M2VgHEh83JN3R8MvQC1jQVGFKjX//YTOhn3U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUw4cfMNsEqh8l5SzVzQLiGXD3p4l9KQwDgTcp0AJfTMw08m2FAZWhrMTNGIVteoshJKF0d4+ulkqtdyMthXfga2B7ZF1XcSzZkUANvG0BOHdPyTCY+HzGuBtFLkuwzAfuLw/65TtRWGWTG+7Ih3u2SLO59qb7mcxHkrWlkchiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFDA1F00893;
	Thu, 11 Jun 2026 10:28:55 +0000 (UTC)
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A887E1AC56C6; Thu, 11 Jun 2026 11:28:52 +0100 (BST)
Date: Thu, 11 Jun 2026 11:28:52 +0100
From: Mark Brown <broonie@debian.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Tejun Heo <tj@kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v4 0/2] workqueue: Add warnings and check WQ flags usage
Message-ID: <aiqN5JEmwQeHqwa-@sirena.co.uk>
References: <20260529130640.220328-1-marco.crivellari@suse.com>
 <bdce3ef27e358b704541d403d28206fd@kernel.org>
 <a808c387-1087-4826-80de-16252ae315b2@I-love.SAKURA.ne.jp>
 <a85feb7a94ee487fb5b236d86b674c58@kernel.org>
 <5b2dea50-2850-4876-b6e8-ba94b9a85034@I-love.SAKURA.ne.jp>
 <ah2bd_V2QHQftm2o@slm.duckdns.org>
 <4d47c6aa-8ba5-4e17-87e5-bf1e5ecfbddf@I-love.SAKURA.ne.jp>
 <bbca08c9-c6bc-4109-b734-14aedc10c93b@I-love.SAKURA.ne.jp>
 <20260610172823.GA804799@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9TwgEG5/oJYBxMnF"
Content-Disposition: inline
In-Reply-To: <20260610172823.GA804799@ax162>
X-Cookie: Leave no stone unturned.


--9TwgEG5/oJYBxMnF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2026 at 10:28:23AM -0700, Nathan Chancellor wrote:

> With that applied to next-20260610, I don't see any other instances of
> this workqueue warning on any of my test machines. I do agree that
> enabling warnings prematurely is disruptive for testing and should be
> avoided but it seems like this one is close? That change should be
> applicable to the workqueue tree, it just needs to be taken at this
> point.

Yeah, if things are directly applicable to the workqueue tree they
should just go there - I was assuming the fixes that were causing issues
were ones that were for things newly added in -next.

--9TwgEG5/oJYBxMnF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoqjeMACgkQJNaLcl1U
h9AlTQf/Z/1pnqw3VIkn6eQ4B3MF4jxgnEOO6q0SjQp14/Kj5zZluBPko1k8MLLK
/HiOfqIQNHSrLBnTEdlOLAKiOJe9l+KjQ/60LjLTDA5hQ7w4fEBzQhWNOY6xJBUi
IJZDSds3CwOQ9wEIkYbK/taJHa2o6hBmV9S+YVj3PGo3lFRxZ6fJUtoZyn9R0rDv
EYiQq/E/itrP1Zq3eNyS1mCLznXyMP1lOibDKCOlimH5slZK0/AFkjou/qSrrLg1
aDO659TfDPubMqyBlRt7B7fFvXqF0fFy/aCX0j5UuYbF6QTqYGEBeib7e1pdzV01
b/w/OZKHVQ1SUCieu2mIvcBBEhcF4A==
=Kc3O
-----END PGP SIGNATURE-----

--9TwgEG5/oJYBxMnF--
