Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE0B3D891D;
	Wed, 11 Mar 2026 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773227084; cv=none; b=BVdKPZX18ZorOrw7BkYi4YJnhGKtWT8TCu5P5ktUq2hIeaVAgORpKDvxqma3lwGHKl0atX1582ZrBdU12HSYrLyG7ADBhAuBi8cVkQeDSW5REVNjhKapG9+4G2eZ+Fk4BUimAouLljrfa6Rb6noYp4zldQsnvG5no/eHmwyooQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773227084; c=relaxed/simple;
	bh=6weQS0df77f9N63U0twoYfgdZrlfJRr+hYx4xYfnBwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdQqY55NDch/ookOOwMuRkvk644K9vRgRsHUNKQU5ScQNcay3Tqmt0fvyhxFRKUJRMNZUA0aRfPP1QdJ3PjyVyXG5SM7WazLXRB3R3DYOliwogdB91cz3oORQU/XeBE/tD0Z3pZhNvCr+ews/kFtC4x+GmKcsqq7tsNpaDDeBOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKLw4gYO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKLw4gYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9160BC2BC86;
	Wed, 11 Mar 2026 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773227083;
	bh=6weQS0df77f9N63U0twoYfgdZrlfJRr+hYx4xYfnBwM=;
	h=Date:From:To:Cc:Subject:From;
	b=pKLw4gYONpVQpHm247ty0+WwFKDQ3JVTg/xDhQtohtrj6RVmHHB8J+apJtG6+WmoK
	 fS8AgHii+Sbt/0tcSmcUFNSJVRM5Pl2mSdk9w7iceGFD9alYZmDC6veavmkxuO60LZ
	 S8dgC/G9iyhq3ap4S8FRmVOcnnVNXiP1eukn3rTqTcKtQe6LCKFt5GZBBF6iEe33xf
	 ECdIvQh/g6LODpUFkju2tStRjNwzG4Es0pfx3V/jc5+ACOOzZ6DZiC0/ZcMnSoewTB
	 7cyT6tdjGI4jCQISgnanY9qtS1BbQx5pDxUbGtmvRx5WYTPw2kU8uFLJZOoAmFG9hZ
	 l00Z0PwtfThiA==
Date: Wed, 11 Mar 2026 11:04:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the turbostat tree
Message-ID: <abFMR6ep2r2CxlMr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BgE4aRr/JMGsKGid"
Content-Disposition: inline


--BgE4aRr/JMGsKGid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  04486a0f831ea ("tools/power turbostat: Fix swidle header vs data display")

Fixes tag

  Fixes: 1a23ba6a1ba2 ("Print wide names only for RAW 64-bit columns")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--BgE4aRr/JMGsKGid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxTEcACgkQJNaLcl1U
h9BsfAf/Sqzz/a9904b1M62uOHAiAyghEnKO1NqqO0QaNX1q9Lexc0JCALEY9fIP
qRm14lFATtelu+j6OJgGC4zGsDuGq9f7qjzWdPs0199ebVynAu78S33SZCIKEbZ6
zEP4fARFf9YHSzBQKiogYhSjue4FxsLCPZnYw9tjLPZN+rddqNTaRf5fzG66jeuo
Mz99l7xWjlfowoRQTRx+aksjORoI1DCGJaqc4MRNjU2Cg5wG+xdlnu7TOIraug91
DDv7OckV23FZj2ELqoTOCn6ovX8mK8FkzPoyQXOX7ORSyCjpD/um4D6UYwkINMz9
S8UOE3V89POnrbR5FVsCxRz1trHoJQ==
=wz8w
-----END PGP SIGNATURE-----

--BgE4aRr/JMGsKGid--
