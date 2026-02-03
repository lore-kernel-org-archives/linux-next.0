Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32F02E8E07;
	Tue,  3 Feb 2026 11:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118240; cv=none; b=AjDB72sKj6AYEp0BH9kicAqRjGEj/+yhE1SFYgNnCj+hpxMQiqyW3mX9+1aDzhoOynJQuWoV17azUm5Qo1L9FMfJIS+hcf/rlHq4S/TI9+0p4RRWStv2RPGMWyBT+AM32xMNZCmWL60pYn8qbkHWHGLuVhh/CoN3YuJRrfzn/aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118240; c=relaxed/simple;
	bh=lIlM0TlNton3iDtyRMnpw7dhvxBKQ6yctD1TuH+VPUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oe+z6KgIAdIhR2tq+DjG6+Ectkk3DUGWapdaabgZdS8891/ifdAkyE+Je7WEhAhY+ysnz+nPsa+/qXoX51EhSwCagR0g4N0WtBCK1RplHsVxeJL97J1nLejMvvhE+d8LRNo0anYFvWbXw+nemuqBTTtg7Zpa1b1BBngWVWoprAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPB7pQVn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPB7pQVn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B216C116D0;
	Tue,  3 Feb 2026 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770118240;
	bh=lIlM0TlNton3iDtyRMnpw7dhvxBKQ6yctD1TuH+VPUg=;
	h=Date:From:To:Cc:Subject:From;
	b=GPB7pQVnInuC8nLUbi6sMoi+3hvP7YelQKAjE9Ah5RIG9fTs0a0HTpa4drOVERMTw
	 KrJTSRm+AfcowgVJdknh7pxnG2CdV/Yz3kZE6tfgmjCPkyhVH1yD1HJrT0XIPjXMUM
	 Ox4v/EU6GZ2sZQeLRqw4EmtLEjWZfk6k1nBy+IEObqtm6VlGsFdl+aD1cfMFS0Gs3r
	 ewNFLB+wums1v4K3oAMObvJULBnx34hKtrRbfK5YohRJMFluxxMhyLXeHIVcC0YyxT
	 wXvr6MET5SzG4ZvBFyRc5tWjJ4X0a6wDMs8UaBsy7eUyA/Z1O/NRrwV7AfweE9MBIU
	 Tblc2eiXHvWXA==
Date: Tue, 3 Feb 2026 11:30:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the clk tree
Message-ID: <aYHcXJPhxIVgvAp9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J4uxnLNDLP2eZKcN"
Content-Disposition: inline


--J4uxnLNDLP2eZKcN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  dc345e213f16d ("clk: aspeed: add AST2700 clock driver")
  f3c4f2a27d049 ("MAINTAINERS: Add entry for ASPEED clock drivers.")
  2216460fd728e ("clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.")

are missing a Signed-off-by from their committers

--J4uxnLNDLP2eZKcN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmB3FsACgkQJNaLcl1U
h9ChPwf9HJ0y0Clk0jNqVOa89Jh4eLsqfrp46kA1tA/WbRA94gxIQYMwuN0EWxiZ
w34YX9aAwfiY/bNZ0+M9xCxxsNkl3FuFv2txSymHSWlQOMHKucJoxZEvwNHrstDW
GLdiIa/unJSaAo9I+c3z2ELoG9OgU35uHHKib5hIGZBtGxLvvx/EOHxmegQYpCPI
10gsW5zVDs5cV0MtHwzwOaxvNLeg110DRu/Eq/J+aFI2qTo3Xx5JN4X+FCeZzojv
mPmN2Cp3ol8DD05UrI1ogapnJPn4vA5aDlHWEJt/9l5yrTP7STvwE9Ayr4gH1I8k
3oRKYQb+fMGyy1Wo5CaroNRIDoNtLw==
=D9XN
-----END PGP SIGNATURE-----

--J4uxnLNDLP2eZKcN--
