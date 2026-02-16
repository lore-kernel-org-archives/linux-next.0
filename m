Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D28921FF47;
	Mon, 16 Feb 2026 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250294; cv=none; b=RoFUc8yYNfwor22yZjU8aABP+wDJ1flHy8mXowB6Inxc8rvJWoWxx7V007HZA4UOojRkB0Dea/b78bRvliXUlo3fNug0bH99ueo4n+aE8eQG+GAv7rXh84IlefgxutF++H1LJ/E8ajiaqLpNcS1WAa+/XJGYmOyrLAR93H3s16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250294; c=relaxed/simple;
	bh=BERhO/wdwUbYScCzA4TV1PV1xA2d485A6fYbndaqE7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uzHp5GaSx3+BYjEq7owOW9N/LWx748KCTXwlWMViW+v+VOFWXIRgzFzRYAybkeHddusRHQFjFzvsa36BU+VibS3vMNlcbj1GvbeZJqUfzi7PFqZb6sHQ0COMmXs+CGTPG0lZGWaOKBI5LCVQiX1zwi3mK3mq22xYDFpshsCD5jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQrozhBq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQrozhBq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37103C116C6;
	Mon, 16 Feb 2026 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771250294;
	bh=BERhO/wdwUbYScCzA4TV1PV1xA2d485A6fYbndaqE7Q=;
	h=Date:From:To:Cc:Subject:From;
	b=eQrozhBqWS/NgXKm/lRj2Mo1UH56ziWp9mMSIBdpTiWokL97W1sxuSMtsiidJ/1He
	 BND+McoCyC46W1oiCO6lfYA+JRgN+chJ6nf9Qr6w7ZgrSp5KOaBtGvsB9b9KO3m4xw
	 cOVYuIJ8axKz+Fm8dXeuqWQGo/wGIVuW6YSVHGxy+whXDq5oJ+Na8V6sT1eE5ua3+S
	 9M6xir+wKOp7qe/avThCoCJCHDceUUBxqkUpwz0+yOHlXT8N0DLlqoKk3LodNnxFf1
	 u6VKcluOfH1jweKrR31pvKs2YtRnYRZ+LzI+r8oInpvKyflKwcKX28AJsNANCHv9bQ
	 eGVxDKmPgqphQ==
Date: Mon, 16 Feb 2026 13:58:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-nonmm-unstable tree
Message-ID: <aZMiciWo-B7jSfAX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8vvKLPZY6W8VY8m4"
Content-Disposition: inline


--8vvKLPZY6W8VY8m4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

/tmp/next/build/drivers/input/misc/pf1550-onkey.c:179:8: error: extra tokens at end of #endif directive [-Werror=endif-labels]
  179 | #endif CONFIG_PM_SLEEP
      |        ^~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  f88534a6e7afc (drivers/input/misc/pf1550-onkey.c: fix build with CONFIG_PM_SLEEP=n)

I have used the tree from 20260213 instead.

--8vvKLPZY6W8VY8m4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmTInEACgkQJNaLcl1U
h9AFZgf+OchB1hjUq2kUTsMaHXMkwp3RepYYd/BaxGy9+dZY9+M6uqXdWWpK55la
BzeOBq/5oAG/MIRSdorABVEifpet4QxvxOWrzRoNiswpZC7SLABpTWAoQuUlOAa/
+gF/59cdhqi9lIAQrLxnrUEb0a1AqjfCVCXhO10mPCPBD5O+zFC/rLvlhLKfIsLs
PMWD+g5ec1HL5WMIOyrlDBr9utg7M0oHUYeCJ1rhqFG9w74pPus8+nSYl8KHM8mc
T0pdOJpDxD29cGqCj/qtZNkXOWFRCdM8nbMKEAvnvdRIr7/k+e7IBo9QjoCl/f6l
xOA06uTgd6n5PAaloE1fifhDWTCTIg==
=Xv1t
-----END PGP SIGNATURE-----

--8vvKLPZY6W8VY8m4--
