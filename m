Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EC73BED67;
	Tue, 17 Mar 2026 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749832; cv=none; b=lZVQdD4jkV45+YfkfgPP+IxhExcyvRsr+XAXNhCZFm6z5b2qCAi/WgKyiackb8jAyXmseXJTe/a1Tqwtbe9Zv4UmAwD5hZU2yTPKScDmmj4Lv8CrI51y/BdMIFz3xTnM8bbVqoIrc6DWbhBIIcIDDfXU+P96HA8PIw0LRVQTl1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749832; c=relaxed/simple;
	bh=cm6BLBK9hI5Ysv5hlMKD348gjxoKvQKi58l79NA3hA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pg/yO9Ts2xTm3OXefvMtDFuJr4I03hRmmBmUZ3IeGvK1BPKXkHUzjyQh2H030xKk+iGNXTZygbM/zXwv4R88XbDgPhiRkkU1waxln2M5gHavmOEl3tcfuig5/K3XAZ3gCoIbPYK+V0B8DQO9MHnkNlbZoSHGspzVQRvofjqniqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZMYnLLE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZMYnLLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AA0C4CEF7;
	Tue, 17 Mar 2026 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773749832;
	bh=cm6BLBK9hI5Ysv5hlMKD348gjxoKvQKi58l79NA3hA0=;
	h=Date:From:To:Cc:Subject:From;
	b=rZMYnLLEqGFcYdipWcbkSzg8YH1rw15bmkxGTqF5clpNUF0DygAra/aQ6wKNZ4U12
	 I6oWTq4eMSoX3cvz+uqwBTdEuyd2Dj6bPg7wkuHThbFa06hDwr8WSI8eND3NeQWj4S
	 cyVgSxggGEe/O0LSSFqy9+8hiLsPCgbQ9ZHXhZU8n6UVM7sN1c0tfHx6QE8RAZDITA
	 9mmV5M7f16OZ+E3y3ttHDex29bsBtTEGeD+jS6kF9TfuLKZm6mTnZUalqMQzsla+u8
	 1jeghSXywRIRyrmCoY+F8AytEzwLNsSnkAVPVKYuSYFbCpAMJwjK9XNOs4Vy4qJEan
	 SpucxjpzSWtXA==
Date: Tue, 17 Mar 2026 12:17:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the mtd tree
Message-ID: <ablGRNKWOa7nGK1A@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w7nqpM0QnxSSlpSJ"
Content-Disposition: inline


--w7nqpM0QnxSSlpSJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  54f955ba09367 ("mtd: physmap: Drop leftovers of removed code for Baikal SoC")

Fixes tag

  Fixes: 16d68d10f5b93 "(mtd: physmap: physmap-bt1-rom: Remove not-going-to-be-supported code for Baikal SoC)"

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--w7nqpM0QnxSSlpSJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5RkMACgkQJNaLcl1U
h9DZogf9Ffn6UuERoH6zA5JRlm1nrODg3SfLT+q8CDizvEEBD/VB3OOO7hJuqtze
OflvNricvBYjF6hlRRe5Slq7vD86748iz45tznjlFE4uxSlQ3pz0EMauhzdVjOKQ
NbE1mVfUXvd3OI5J0YcjivnAzSLuiVvg4Br06xH4ga7jixH9FUFjLvZJbB8+bay8
xeYtCPXWBZJ4lLRgIgQsGK/SyQY2YnbCN/b44cgSlQkpDrnvIiYfjhB4/pmCtuNL
SJ8EOZAUuj19YtfzUrLcZxL5SbH8TynZ7zY9+iISm+GwWjTgMZF8J6LbsrphsSA9
ub5okrukN1yU3AmI5VhQyusHtJme+A==
=MFJB
-----END PGP SIGNATURE-----

--w7nqpM0QnxSSlpSJ--
