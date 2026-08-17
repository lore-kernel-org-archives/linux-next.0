Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16F2449B1B;
	Mon, 17 Aug 2026 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982235; cv=none; b=pLrGbcfQO4p+Ti35L1BV2bbEE8s+2ozPilnFtpI02j4z/+WmhcG9jICsSQj4XQOmPjvGQlnQWeLm2RVGYNpk0/XOL39CyLjFBMwiLK4bdjDOVVY9YXzUQznlhckeQ2wbvME5xHCIWkD4NYtWpBzhwfhiyuL2O53ZSIySlyS2BKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982235; c=relaxed/simple;
	bh=O8wB8QMXyqMyu8lpvLeIq6+OwoNXOapzMbdUjO30wH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjNFGDbdkUyBq0Ey0gmlER+JqqG857QyOSzdXX47uaiIElmADplP8N4sbFeRRfdHEhRUofSWFIm6+iz00opLfJ9/WrKSr9YJk+4U4RA2VstsCEStMEytc7q1lWD7bLUHH8GtCy9WhFjeiLGdfYxE0L6kuoLxb0njmVPaRdRQefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJyYVDTs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJyYVDTs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D9B1F000E9;
	Mon, 17 Aug 2026 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786982233;
	bh=PrWLCgNj40pfrrurfgyZbie6xvgjmmM6U+bLN27EXfE=;
	h=Date:From:To:Cc:Subject;
	b=aJyYVDTs8fVIVV2fSZPwArRrSmaZ3KZTFYjqCOYXeVwL7PqbtZGWk3keiDy3Jz3rL
	 iAeGQolj5Lh1OjUtkPeGRT1AT3Ixo4f5D1rNphlgdu+BXEOL2Ab2dtC3grmmxRt0MS
	 glxTIajLPLFsF5w62Hic+bthqElls/rlCIdvI9BYh8i9bIaVb81csEmgZLYq4QBh2v
	 uehoM3WeR5t91zl/9DICCptJdZec6YY83MbT2ZkXggdVM2clE1Y4+IuTav/QSPrJrd
	 rYdE/ixnXiAV86MKVOqAjI2UQRIV3/vHU9q3zAVCt85pHJa9aVzyFwB2ELAazYoQrG
	 r12W9csV708ww==
Date: Mon, 17 Aug 2026 16:57:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Zhi Wang <zhiw@nvidia.com>
Subject: linux-next: manual merge of the driver-core tree with the drm tree
Message-ID: <aoMvVQiSv8uzbOLb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mHKqJqCLprSGOHT7"
Content-Disposition: inline


--mHKqJqCLprSGOHT7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  rust/helpers/pci.c

between commit:

  6afbbc27f582b ("rust: pci: add sriov_get_totalvfs() helper")

=66rom the drm tree and commit:

  3b5ea0f078e1b ("rust: pci: expose the allocated interrupt type")

=66rom the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/helpers/pci.c
index 4ebf256dff230,23b06becb4489..0000000000000
--- a/rust/helpers/pci.c
+++ b/rust/helpers/pci.c
@@@ -24,14 -24,11 +24,19 @@@ __rust_helper bool rust_helper_dev_is_p
  	return dev_is_pci(dev);
  }
 =20
 +#ifndef CONFIG_PCI_IOV
 +__rust_helper unsigned int
 +rust_helper_pci_sriov_get_totalvfs(struct pci_dev *pdev)
 +{
 +	return pci_sriov_get_totalvfs(pdev);
 +}
 +#endif
 +
+ __rust_helper unsigned int rust_helper_pci_irq_type(struct pci_dev *pdev)
+ {
+ 	return pci_irq_type(pdev);
+ }
+=20
  #ifndef CONFIG_PCI_MSI
  __rust_helper int rust_helper_pci_alloc_irq_vectors(struct pci_dev *dev,
  						    unsigned int min_vecs,

--mHKqJqCLprSGOHT7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDL1QACgkQJNaLcl1U
h9Dzygf+Ny9BYmvaxW/WOw/qPeF0UiT05ZFg/1yAgyFts+Dek1PXUxjrBgPJw3au
KrOsWk5b7cU8Vs+h5YfkMnwUn9KKkUsoocmUdlQc3JKrhWjfR93ACzLRp4FV/tek
46mIS9McFKT9BwIvN0MNjmy2iGhlttb7o+QvBM/qrYwClPNTugeLbbpbi1zlWzA6
s1V4ZuOMv/qNfW0ziBVzS3R+xu2cguY7YfuYfQ5gcgEVGrg1Oze/r9SdAuOL5DUx
+eIMO+1f7N3ny8U0IVpEpBBNxpWyjWbxYDqEHnlE258mvtbbv1dstC1xKC6LGtDj
Hv5NBCIyowdTWg9TiN3dhXCKUCqE3Q==
=gHLh
-----END PGP SIGNATURE-----

--mHKqJqCLprSGOHT7--
