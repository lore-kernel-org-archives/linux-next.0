Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DC633BBD9;
	Mon, 25 May 2026 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779708340; cv=none; b=ewztBY35VR1Fg/835dEmqC13Lxj5XCHXR9om5TgTLheYDm13vf1aBcohLq1IkWMxTW5V6UoKnRgGUAQNfEe4d2018VI4Gvy7mk4Fm/maQOcr411+fQBFS/bNeJC91UTMJUlr2VXghETC4W4Rc93+8IYvXQ8EeNbCCvRmosMXb+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779708340; c=relaxed/simple;
	bh=1q3e8siAjf5v5Zepn1GdTAoUXp1WjaFMO9OqBSrRHKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2F2FG2Eb5ST4/hbGxX9rRv+GqBCkCq16jWNqIWASS3EKx6zvegnqv/AltL52QnBez9laA+gGUd8yG4oQpgjxwrTUpGnAhr4FP+KfQ8Yg/CYKBp9bcJC6hnCDgD0phxYSxBgcK3RG3NEe5ogiFiKKnnQgaXeNlpZV1Oy6fXUAbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awBcfeJL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awBcfeJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BD61F000E9;
	Mon, 25 May 2026 11:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779708339;
	bh=653ZjnAd+9MO9OM0jibcxdWxna7jJxARe0awg8SzVZI=;
	h=Date:From:To:Cc:Subject;
	b=awBcfeJLlSImNqgt6o1ouSPiYIuz4PoWavkfA7csip6hmO6LFKDOZTElUAbRoIC3k
	 Tx2yO0q5wl0f75kgTzNkHJZlKN6oVB/9vtE6GtUaEB2JJPK/xW0aTBuM2zQAPEE3o5
	 G7NKfwpVIHyEHrmoL0Ta2BJiQos+HpoF1/gGi0TFVC7nxMWFm573qOaXpah4mylTSO
	 LvOg+G4zXOGjkI88uNP2aGCUn0DIXDdAVgkbkiJyHauCdjm/oXuSSfQkBUuIkadlly
	 WuMz/nM4j9alO1t0dsRWegvqVeCpsQUnPAEXGTpmHtbpPM/WKN2uHmc1kqCEjmZdX8
	 pviN9o/jLmbUQ==
Date: Mon, 25 May 2026 12:25:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the nfsd tree with the exfat tree
Message-ID: <ahQxr8IxGHct59V4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2RIdPozaPQ33ryc1"
Content-Disposition: inline


--2RIdPozaPQ33ryc1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nfsd tree got a conflict in:

  fs/exfat/file.c

between commit:

  614f71ca1bdfa ("exfat: add iomap buffered I/O support")

=66rom the exfat tree and commit:

  27e0b573dd4aa ("exfat: Implement fileattr_get for case sensitivity")

=66rom the nfsd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/exfat/file.c
index e6e58584f567a,91e5511945d11..0000000000000
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@@ -14,7 -14,7 +14,8 @@@
  #include <linux/writeback.h>
  #include <linux/filelock.h>
  #include <linux/falloc.h>
 +#include <linux/iomap.h>
+ #include <linux/fileattr.h>
 =20
  #include "exfat_raw.h"
  #include "exfat_fs.h"

--2RIdPozaPQ33ryc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUMa4ACgkQJNaLcl1U
h9Bc8Qf8ChP/Mjnx+AP0L7/YJoczXY/Tt3eMVZogUu68yN+44VOjh+xyh6JENnST
Nyg7K5EHbH/5wQS2CqcNwhjchicFvdUY558dNQFt6jwpT3m7338RFl5neYL9q3X7
sWjXwirGZbvKCgDJt3Lu6l1ZPSneYdyBPIV1izeuXXMWzrlM/rLoc0PA9dPrI0hY
4qgMCZIxVCqJDwmytMIN21O6HdKackvHW3z1R+LRDd53POiIh/aX/6/U+pLxhkYO
jOi5g4uoBTh+5HqwtOEX1XJE23JVAXE3hwYzNN0olwYPpJPDmuRwC7DRAn51MJ8i
UGrAa+yCWsaMlZVEUuNWud47Qe6/6Q==
=Lwxp
-----END PGP SIGNATURE-----

--2RIdPozaPQ33ryc1--
