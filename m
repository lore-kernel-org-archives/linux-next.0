Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C763F5BFD;
	Mon, 17 Aug 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969326; cv=none; b=OkWeRdhM+7RwBOb4RUVCxhWDFVGSverLmwpgvfSXh8pQb2gxuiK4SVPdn7lOfat1hOgju0RcrfcU5aLEryYUYJzZdlBkW+CqprQUY2khNt6Y+LX7ItvBtSh+7eRXLX4l/9EdgdMG7XEDXS6r2e8nGOmxNvyo0XCbmnZI6J9WsgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969326; c=relaxed/simple;
	bh=CmyyC9e8L1vWS+PQmHq7IEz/0q4oU/m5k+KSl+PWVC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ufEAQDSrfGVhPrQyzMZRJZgjn7YQhoxY67Nx/SQqAu+lo0PJvrETD6Gcq1Oay3ZdSTSXCRPY4Q0tHt9pQ9eZ3O2b2MAlfngL2WEBHd3zfDaip5cXPVLqaQZXMJ370naryuBbIgoYx0xbvS3qSj+FSUCt+331hdBSE4fu9y6Dyjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZR5fkXJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZR5fkXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF2A1F00ADB;
	Mon, 17 Aug 2026 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786969325;
	bh=FjiTcNCWtVCZTs84iDQdSvCo/ynA3lYk8ofaXSOCTw0=;
	h=Date:From:To:Cc:Subject;
	b=mZR5fkXJmzYtlWnLzbkvK06wGu66JBmIjQJbK23BC6b0XDxBUxugsnsHXx0cA0iNE
	 QvJzDYdsRLxfh+WYnL2P9tAHVoAvtP3C1BAIDab8rLuxIRHGCE5LhdJM8chfDQhWSJ
	 EYHtODNK1eFP4PMDxs91pRzintnvu3vbLCR/9usvR6gYNSjxlFxTn4vai8BRCwbjQI
	 jMHgdrIMLCMuUwQXjmgvvDTs17Ehu5UkuQlPPbIi6QC7VNsOhY58U6y32cXcNnTRE+
	 WpDTTFo8t5HiEZZaNCEuGDmlhDVwD3QoKAPjK2CkcKJUca9X2xKJ31xiAF+Wz+2cvi
	 RbR5kgAuKFSHQ==
Date: Mon, 17 Aug 2026 13:22:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the ntfs3 tree
Message-ID: <aoL86l8BmU7b3_oh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YBgEXhJucILl51Dr"
Content-Disposition: inline


--YBgEXhJucILl51Dr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  d18b300d80d7e ("fs/ntfs3: fix out-of-bounds read in read_log_rec_buf()")

Fixes tag

  Fixes: 20fd9f64c005 ("fs/ntfs3: Add NTFS journal")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--YBgEXhJucILl51Dr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqC/OkACgkQJNaLcl1U
h9CqnAf/crCDRHjlI0PikbqprPITfUfjOw8qFOMqJ/GGCAvqDy8HiYWec/iXIgPk
PNvMvhLVlQZSh4GermLB9joosoLUX76MsN6nkPLbg/uBUHFAnJtbEqL89L0WQL0D
fvr16SMRkauxb/eU85/r0R9rLh0qUrDMoqTsLZr+dFx72uxH14TNYUcx/CoY2FgJ
r8e8bc5BaYdoVoi01gxKULEfmqzkYVQsQc1ylgKnI43+rPXFLsLQPya9ynXmPaaj
jjge1DeD+ELd7h68MF7hh8j3Vv48QTspaW+NfmZwMXxf61Do1odV1xzcWqw4l193
9VkxxufVChKl/TX04Omgai2vptAqsA==
=Nf/V
-----END PGP SIGNATURE-----

--YBgEXhJucILl51Dr--
