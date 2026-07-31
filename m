Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C35E439916;
	Fri, 31 Jul 2026 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510645; cv=none; b=j5vTKMonNwLl+N0Vh2+5pGuNIbkbp3MUxPGKs5vHw/20gjkI8YB/Evf6r67/kxezqMzoLGwOM1oXXdr7HXBLfBq5m6fw8arYX0A5c1THa7ud/YzrbUNdzC9WhUaPtFFb+BYOTZaMjV/UghqPlSoF3cwgBLhrurvnvc1J5paXzN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510645; c=relaxed/simple;
	bh=EoGfZPXmxX8QrkeJh7P5jUpgeLYITpQLr69yg2paQEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHL23ohbdgOiRKXfuK+KTJqNbV+WLwBR9/45gKJuhOv8nNUmIGAZfsQ6vwNwmJ2B3QJsXOsqC46q44VV9bjDmQq05c2FynLzjsGkWxBzS77ejX34S6VelXtDN6iMreDy5JeIv8U7TWUPnIPSVIvAtEvWUIE84EIcQf/mchR53MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXbZzwk9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXbZzwk9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061B51F00A3A;
	Fri, 31 Jul 2026 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785510642;
	bh=w8pzwZbQw/y3i01ME/Ns33iuDk8UiG0hKmUWB6anoCU=;
	h=Date:From:To:Cc:Subject;
	b=VXbZzwk98vQuNdptnsQXMqGiJGjGO6j3HyzYRirgGuayvwg7U4VnNd8FescXFRZ2u
	 omwwracuA+E78Su4dxXY3q57kwaV0rKoXjtgXy3PP9hlyT0qit8osYWt3zoMLSfSMP
	 bEG1Dkk/p9nXB2EsQIj9GtcNoPQPxD8dxhHZPSnEnt0r+syAc58tVZkYSPcLKFSf05
	 fKEsK0Vew6zldC/lbh0X6WSihS6/pn3E5g/cOGJ/hnj8Fr9H5Fnmhe3BREsFBmiXWH
	 37U96RdiHfPFONfpio3/UFCY7m7VPE66LhUpQEwT6VrnOJB98Zzg7AJ9VxQa+K4Xd0
	 3Pb4FqUrfFv0Q==
Date: Fri, 31 Jul 2026 16:10:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: linux-next: manual merge of the nvmem tree with the
 char-misc.current tree
Message-ID: <amy67hJt6Ywz-TGE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="coL2RbFUho3cxWhT"
Content-Disposition: inline


--coL2RbFUho3cxWhT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvmem tree got a conflict in:

  drivers/nvmem/layouts/Makefile

between commit:

  b5be879519291 ("nvmem: layouts: Add fixed-layout driver")

=66rom the char-misc.current tree and commits:

  c00ca6cc2fc96 ("nvmem: layouts: Add fixed-layout driver")
  eeb4218f73b55 ("nvmem: layouts: Make the fixed-layout driver optional")

=66rom the nvmem tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/nvmem/layouts/Makefile
index dd6c6c70b1a92,9da790a9dde9e..0000000000000
--- a/drivers/nvmem/layouts/Makefile
+++ b/drivers/nvmem/layouts/Makefile
@@@ -3,7 -3,7 +3,7 @@@
  # Makefile for nvmem layouts.
  #
 =20
- obj-$(CONFIG_NVMEM_LAYOUTS) +=3D fixed-layout.o
+ obj-$(CONFIG_NVMEM_LAYOUT_FIXED_LAYOUT) +=3D fixed-layout.o
  obj-$(CONFIG_NVMEM_LAYOUT_SL28_VPD) +=3D sl28vpd.o
  obj-$(CONFIG_NVMEM_LAYOUT_ONIE_TLV) +=3D onie-tlv.o
  obj-$(CONFIG_NVMEM_LAYOUT_U_BOOT_ENV) +=3D u-boot-env.o

--coL2RbFUho3cxWhT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpsuu0ACgkQJNaLcl1U
h9AP/wf/SErCzhCCAQQ9anetEnDRTj8OBsU5SUEuvDBgq4VDd5v0iozWHwcXPpv6
j0lyoylGxYFjn8Gir1qmks/CuWrXWOsFfM/SRa/jiTH9uMoPHcLZsEp+jTY/dZCt
Af0ws+3B93X5h3uYro8DhwVfSUK1UgaZvaxlMUqkeG06hBlLgPGMQ8D9gJ2CEN9L
xw8ldoCuVuLZmvaZFW4Ri3+Bfv4i2jYE03L0oQn+09pHtNiBJzaqUnGc1V8tWNWk
CDpqh9L3Hp/jPKtXURkEW4lZ9ZdS6I0qd4AdswUVNsFIUEUROd365/wBK/6806Aq
Pjd7254K+EGFlxM73Yh/OMgqCNiysQ==
=bZ+P
-----END PGP SIGNATURE-----

--coL2RbFUho3cxWhT--
