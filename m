Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C37C3D6CA1;
	Mon, 30 Mar 2026 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886537; cv=none; b=tAmUvfFsOD5nGBRPaVDHoep/ausFpcG9mvw2Tp2UPe4XVHTHo3arwplijinnPaFXf5o5sz0y7TVZv56SRJGI+KXRKnQBlA7vq1s4mbCi7JafCUZxbhZtiOpirIokZ9pc87leMn/A9hmYhAOpFkXLQqyKuB+cVfGwGEP5+nszdYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886537; c=relaxed/simple;
	bh=JHsk56sU/D4uSJv9rCQtZc/uAUqmgJU0I37W1S+Lpu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q94Pq6O77xAYBhVyqaXTluDLTKGXFhsIwdp/s2+ziGdUGIazCMS7ELNJn7c50GGUjrv+PEohrd7fHFW3Ckqxi7fDOA8pWN62MdEYVD9e0DyVO1lt/5QGWKaexdwBDHspLPjHgORTtSO9ZE2nXPKJGhbC135qTM4Gyh865Nfy1I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSKb8EfV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSKb8EfV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49843C19423;
	Mon, 30 Mar 2026 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886536;
	bh=JHsk56sU/D4uSJv9rCQtZc/uAUqmgJU0I37W1S+Lpu4=;
	h=Date:From:To:Cc:Subject:From;
	b=lSKb8EfVixD2LlTjyPnjQgzoLECyQEHAOYMUhuv9+QnXzggh47q6sdS37QG4xp4Ez
	 dkPWGt61YeuM/KUajyiD8ylUBoPky8582osWymMQYE7sdcqURnFZZGHIluGeKxInEv
	 GpWDxtjnUt1G1iclwpn21Wuu3kp7AsDlTV/ky6yVHKI/8wH5oonSbhb76qS7zbd19d
	 SCpHHYumD+aM21uqh6WOcWdM6XMQzwcMIX393d0mmXK2UPpaLAvzZZJ/2GYVl42OA8
	 dyof6XMD7ZBjysFyatVnxuKMhzmONxtRdTzePi56+kzj5antsHKLMyq0J2379udWwN
	 wMJRkwp+N0DHg==
Date: Mon, 30 Mar 2026 17:02:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Dave Airlie <airlied@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <acqehIhXNVZYxrrY@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjKSOlVC0gZOJw5h"
Content-Disposition: inline


--wjKSOlVC0gZOJw5h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/xe/xe_ggtt_types.h

between commit:

  d9a4a2021d4a5 ("Merge tag 'drm-misc-next-2026-03-12' of https://gitlab.fr=
eedesktop.org/drm/misc/kernel into drm-next")

=66rom the drm tree and commit:

  7aaa8047eafd0 ("Linux 7.0-rc6")

=66rom the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_ggtt_types.h
index 9af448cde3a1d,cf754e4d502ad..0000000000000
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@@ -11,7 -11,6 +11,7 @@@
 =20
  struct xe_ggtt;
  struct xe_ggtt_node;
 +struct xe_gt;
 =20
  typedef void (*xe_ggtt_set_pte_fn)(struct xe_ggtt *ggtt, u64 addr, u64 pt=
e);
  typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt,

--wjKSOlVC0gZOJw5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKnoMACgkQJNaLcl1U
h9BO4gf/SYqtRsYqhr1GglyLs7K8cwckwaUSxGPZBoM7UCn4NkCBfpx1etSR7TGu
Vyl7aKHqFvV4HbEmqE2A2yLkHB8TqNEQQDLGQF3IFCrmoNmpMcoQRDFoR4btBnaq
DhwQ7yDPFKfEAj58waPSpgGhGZh+TiTfEZIBwcdFDkTpogFBTGdoXMKj5gBpWojY
GLUK52KbIHiwTgQg2lP5+EZBKry813y3DnkV+RFj577BZA90nVOHXEg68yoB2ke1
ZDjsVgbtWNxRYoP9QKXLgiVuYQpnm9jxj6j5eeDYBubIAHfdRuN352UsfODnSCtz
RJoCoJvp84XQi1eD/2Bb7FV1OxjtqA==
=k8T1
-----END PGP SIGNATURE-----

--wjKSOlVC0gZOJw5h--
