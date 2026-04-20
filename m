Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D67921C16A;
	Mon, 20 Apr 2026 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690516; cv=none; b=lq/5N13SCs0Abu7ptfkZK/7up4Ql40ajcusS+b6B/ku18IOB8I4K2VEFCUdIEKjxqC/yFPjfE5119eQf6pCjrakBJR/A1weVdmWMvO1/CfENwhRAOf5Lu315D6J7gN1YeV1EA2G9l+Pmzizvyxm88UHHHrxpm1QqV0ulUZwgWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690516; c=relaxed/simple;
	bh=Sm84KW+0jxnl8+vxj/Cryd20BKzQGGSzkhPDvKwF90A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cx78KnE4QQwT7HTjfGzzOjE+FoxpAGFEBox6SZTfj5wIZjJrBtSUp+iPZH7D+9+ICynHzFsKQM+j+Otb/IrB+ONfEeaIBKGTggH6GOnUIMAbWF3//fygAsExYNGh3j2wL028R1JTxe1Hjt7BSTW7azGWJFPpFiOgFYmnLPHXusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qj+a0SLl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qj+a0SLl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80F5C19425;
	Mon, 20 Apr 2026 13:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690515;
	bh=Sm84KW+0jxnl8+vxj/Cryd20BKzQGGSzkhPDvKwF90A=;
	h=Date:From:To:Cc:Subject:From;
	b=qj+a0SLlCdxK8D3XegpC9nxzYySxCv/gTZ7sRXdF1ygIh3og2a2gFU1+EprduGZrs
	 pLiRtebwKlWF87OQBRSHOtn9zGmHEkeWhIrgbD1dqaukkFNrdtyxPcWKviymrPPK0J
	 NbpYyY6Rg0s6AQKmFt2dDuiOAu8UPs4PTRAasDAXtc2JB/jF3V6ztEf40C0oq3nNO7
	 rZoqSAc673D3P4sfCB3PI7zpDoObl1dfuApi5GHOvBxAM3GV2T7uZjc+FJORTHbJqu
	 3x30R6Ywvj9svxQlczorWzCWo0H6EZ91OH29ZvHOvWMjkPNiSGtq/1J3x/GCh1BfGG
	 DZ8tAPVNbDWng==
Date: Mon, 20 Apr 2026 14:08:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the sched-ext tree
Message-ID: <aeYlUCi1oEeBOKr-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C63HYGDKnLqiHZYj"
Content-Disposition: inline


--C63HYGDKnLqiHZYj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  bc4cefd40b33e ("tools/sched_ext: Remove dead -d option in scx_flatcg")

is missing a Signed-off-by from its committer

--C63HYGDKnLqiHZYj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmJU8ACgkQJNaLcl1U
h9Bm6Qf8DUW/COrf90H2IAmrWXTHU+c1jo+uH5xPJsuZJ3KGFJQGZtYQICfoplmL
tHvDVCgFwsu0dG/C/HqyudKwI3f7QqvkjNL60JkAuJvkPerKzld6rz07WGS4SVjG
Q/qvlALPeZHW5clHcW2Fc1HS2GOgnrlAsbfddIlAQi5aCRkyQ86U0s41O0ZcF11O
xmbweEzxpVHAfRlgkKRoCz2b2RW7d/pz/z/olioe4SOr6FqF1NCNb3OJPryfqG9p
na+ipqqA4HU9au2HdyojYRiNxykuR7j10ttWVtjtT2tQFBb6X4pelk8FBiWD6KY3
V1eSjuaa7yToJhJzQgGMJlXluoGDEA==
=4PtT
-----END PGP SIGNATURE-----

--C63HYGDKnLqiHZYj--
