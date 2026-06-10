Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5FA426EC5;
	Wed, 10 Jun 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104940; cv=none; b=I2IQazP+2v6WDoSoy6grVhaQDX2SBgP0zUEW8owX4Q1C6/oIogKvMVuuQyMY/yCeH67/4X1lABub7WwAP4dZI9vsRWYu1FYKET8Q1a8X6tcTroC+JNXMVDkEjBnEUfjvDj+fuocSxfX/ek5Ell/Fo+tO3CYBWQw1GjroZ2f392U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104940; c=relaxed/simple;
	bh=JLC1+HV+QebCFreV76rWQIAIVuubemIVwQYQIo1nz8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dS93wDsm4oleee/ukqpmoXsHSPypGkvQuGBJddV+wjRojZ5Aw2zFQXm+BuW5eVxGmCizY+wgiN5XX5QKY9rCL28wKlV0uizvz3MZkhBX4xsrWzkZ3GYMtZAI38dBYQMvWEFW+EKf96EJv/EBkLAGTwNCk2Kf0BaaEPo4Zz7bT/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9131F00893;
	Wed, 10 Jun 2026 15:22:18 +0000 (UTC)
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E37941AC56C5; Wed, 10 Jun 2026 16:22:15 +0100 (BST)
Date: Wed, 10 Jun 2026 16:22:15 +0100
From: Mark Brown <broonie@debian.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Tejun Heo <tj@kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v4 0/2] workqueue: Add warnings and check WQ flags usage
Message-ID: <aimBJ9ClrKXQbl8g@sirena.co.uk>
References: <20260529130640.220328-1-marco.crivellari@suse.com>
 <bdce3ef27e358b704541d403d28206fd@kernel.org>
 <a808c387-1087-4826-80de-16252ae315b2@I-love.SAKURA.ne.jp>
 <a85feb7a94ee487fb5b236d86b674c58@kernel.org>
 <5b2dea50-2850-4876-b6e8-ba94b9a85034@I-love.SAKURA.ne.jp>
 <ah2bd_V2QHQftm2o@slm.duckdns.org>
 <4d47c6aa-8ba5-4e17-87e5-bf1e5ecfbddf@I-love.SAKURA.ne.jp>
 <bbca08c9-c6bc-4109-b734-14aedc10c93b@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8J+ByNxfHZJLh7tN"
Content-Disposition: inline
In-Reply-To: <bbca08c9-c6bc-4109-b734-14aedc10c93b@I-love.SAKURA.ne.jp>
X-Cookie: Leave no stone unturned.


--8J+ByNxfHZJLh7tN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 09:48:05PM +0900, Tetsuo Handa wrote:
> On 2026/06/02 2:51, Tetsuo Handa wrote:
> > On 2026/06/01 23:47, Tejun Heo wrote:

> > Not all users are quickly accepting patches. Please apply all fixes *be=
fore* you start
> > emitting WARNING: message. You are currently making linux-next tree unt=
estable by syzbot.

> > Mark Brown, please skip WQ changes from linux-next until all fixes are =
applied.

So that's the workqueues tree so extra disruption would be limited but TBH
as far as kicking things out goes I'd be more inclined to take a steer
=66rom Linus on his thinking here rather than making that decision for
myself, especially this close to the merge window.  If there's changes
that can't be applied directly to the workqueues tree one thing I could
do that's a bit less disruptive is carry those fixups in -next, do the
appropriate patches exist?  We'd obviously need to make sure they get
into mainline promptly.

Just as a note here if you put something at the top of the mail when you
add me it increases my chances of seeing the bit directed at me - I get
CCed on a *lot* of mail that's not at all relevant to me, unfortunately
that means I'm a bit lossy when it comes to triaging my inbox.

--8J+ByNxfHZJLh7tN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopgScACgkQJNaLcl1U
h9BD+gf/X+mndhJmKDdLzefUTLzENbP+mizAPKDu5DbacNnl42H1UpOyh1J5YrTC
OYfMSsykM1tqv2PS7Ptvkrz3o1vzGooPHkiX7Y3nROHlQQwAZtUk5KoVoI4iflPc
ZpaAbSybI9mwUJh/A00cBicm3PTtEnur09L/e24I8U/5t4Hg/EyyUYjYTJp9rfOJ
45V7ogK5T7/Z2Zd8aVBjJ5cOSv+e9RcPzU37nNFy/sH+xqETFWXAYtsZu6Crk2fF
uFJaPzuENCvZJ1YiD3KSPs99SMkvd2TaiE/cPhtOkRVl2SBbPg+TPAp/C4eYdEg8
Hk7IkEun72KYc+1dVeXVrbkAqNsJLA==
=nQUN
-----END PGP SIGNATURE-----

--8J+ByNxfHZJLh7tN--
