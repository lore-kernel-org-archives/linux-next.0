Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191983B27E1;
	Mon, 20 Jul 2026 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558660; cv=none; b=NeQP8ujZywH9k/aypZ6XMNs02RWlBdaCPzyQr4QOsYb58rx8DfySBGDZG+JACnZwrhOA3iSCIvKPZlVLb2BD4xF+glrv5M4/jPscqcE5FJCSBSJP7U/QQvHBnujTG5dbtpkViYXPipHWf3xCekyxAdecZ1fx6GR/oSrubqk1L9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558660; c=relaxed/simple;
	bh=YQDebOQWzy0x6bcJASrnnNeppXx3JvF1XvSBG7DFRUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OPddJNBqCk4V91RaCjDSXhJB+9T0qvqEZjUFuf65aBr7y96w0kHZbZ/CemfDMGTgwmQNbxJBehwDRDn4ViCHXnXEb44+/yO6zwlTF6kQfQwLshkghSA3pzJDohaUS1XsGax4bZ7jbAX1x2cjT9cOuUedZ+reXjwQDfiZnp4TAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Krbtnd4v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Krbtnd4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FF21F000E9;
	Mon, 20 Jul 2026 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558658;
	bh=ge0ST5uI8w0LQqp7rNRW6gqoEiJ8mVb/G7akG2udssM=;
	h=Date:From:To:Cc:Subject;
	b=Krbtnd4vecMFOM2O6Nj3MaNc3Xk5o68suqamkqsE6Ft7SAVA4kVrJyJpjKeULg1HG
	 KNrNyf3Ou7w9onBYKGFrI3/w4x7ft54u9PLb/Alr5i/V12pPCBt/8YDIuT5TZwKKmd
	 0aNl2kZq3ONH3qEOaVO5I24gWbRXGOeeaNkWkDPXo51twUXYRNp4VfAYcSJdVnfzml
	 0885MEat6THdV5K3oZ3398rPHlJh28vmZ9HtsxM5Q0PJqsd6tMJ8gnfmAkeDrSz/99
	 EHozwXZFeQX0SW/yPT55T63nPn0cRorEkN7BhLGYCoYFmjsqmZnUYibhajWv0fSwjl
	 PnhZUQ9lLrKqw==
Date: Mon, 20 Jul 2026 15:44:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <al40PhpnfidCIYIU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A4HRck5EADJCIPV6"
Content-Disposition: inline


--A4HRck5EADJCIPV6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_device.c

between commit:

  130910bac905a ("drm/xe/pf: Disable display in admin only PF mode")

=66rom the origin tree and commit:

  21fcb222f0d1e ("drm: Remove DRIVER_GEM_GPUVA feature flag")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_device.c
index 9d119c95a569a,ad7f3e61d4579..0000000000000
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@@ -426,7 -427,8 +427,7 @@@ static const struct drm_ioctl_desc xe_i
 =20
  static const struct drm_driver admin_only_driver =3D {
  	.driver_features =3D
- 	    DRIVER_GEM | DRIVER_RENDER | DRIVER_GEM_GPUVA,
 -	    XE_DISPLAY_DRIVER_FEATURES |
+ 	    DRIVER_GEM | DRIVER_RENDER,
  	.open =3D xe_file_open,
  	.postclose =3D xe_file_close,
  	.ioctls =3D xe_ioctls_admin_only,

--A4HRck5EADJCIPV6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeND0ACgkQJNaLcl1U
h9CqJwf+OK6omN5TO+ub2D7KHgCSLdVCLUuuG1l9m8rsY8LOt0wiFKWuCB+tudBA
GcfD99B7I0qPxI+tYyehHWMCxqsvMp/YJDqDV4YobRGuLp8buk/GtFSpQjXpcUY2
9lia1JpEi2Rr2UCvgyTu8BDEzMp3MPkaSwv77UrUiaolkeThXi71uFu1ictrnx2q
RoKon5gRTFWMzAOF7NFHnvDE7BQ6Xu3TZ1QufdNPPW8rpuQNxPt+4Lh6Mz+Mxv/s
jDNf6m0uoWiWp1uJDzpZxdmLOLtterr3ko8DUYhOwyfN0YuAEDhH4aq7IwPais1t
0+4woFaw12Bfi332grduBzhIotpPBg==
=40Mb
-----END PGP SIGNATURE-----

--A4HRck5EADJCIPV6--
