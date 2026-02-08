Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05824086A;
	Sun,  8 Feb 2026 23:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770595144; cv=none; b=SGhPAOAPA20jU87nqaeVS2JRypce4JAdEbzwzCEZaWvxbPiH189+EJ4Fy2XEyjPRqIr2X77nmAus6hkEtGlPW0GAhvU97ZKMjVHSOnWqRsYFf9n++1UxOy+hjhF20WU4pu7b9GMaUQ+iXD9tGQ5eVhnsnRpKOQBtFRv8w0yV24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770595144; c=relaxed/simple;
	bh=wcxtqooFWfZU4NNuxhxqV81XMsZEIHvUSPzdRWukosI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tWLSSdEmsUonX5u+bDPCwB0jKvvXGHTiTLxndrP5o608/6BhmaavYXSmXcuquA8HIAPQzICbQbNrVFIjElYToA6Nud4ldydu2hr1FykQOwVwcHFHRj/8UWjjkUzOmL1GgrZexYeUvcMkp0KdqLaGMe2luyBQb20eUupe+awN/QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgtYSZGL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgtYSZGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C267C4CEF7;
	Sun,  8 Feb 2026 23:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770595144;
	bh=wcxtqooFWfZU4NNuxhxqV81XMsZEIHvUSPzdRWukosI=;
	h=Date:From:To:Cc:Subject:From;
	b=KgtYSZGL6Zg6/IlnICYcyefNNJ7mra0s5kbTD0B0PoclrP1AIj9EYlMbI8m1Y8tpz
	 1ismE79KMpkix4JgziEVpHer6GfJBxwxgsyadt1ehsJNEZBe+Q11bQjPFcEACd7t6Y
	 t0E8Warg0legS2ej9uVgYHDnxeebzGHRfX4ZDYtTLMk9DrYRyzaayk3p5Zep4xuQ66
	 WWidIUxPURCSS2PkXbRonbkoSkQ3CnXss6YshebX2u5S9jhU7Xrd/rpy/qC4h0r+lh
	 g/3NDeotkctyzBSV6FpWYGIv8PsVA/SiFjfKa7CMj0QLwpKZPodr4kT0n120twIgaU
	 Gp9CL2L+Np+jA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AFAE51AC57F0; Sun, 08 Feb 2026 23:59:01 +0000 (GMT)
Date: Sun, 8 Feb 2026 23:59:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: linux-next: manual merge of the iommu tree with the pci tree
Message-ID: <aYkjRSFQwbF0-9vi@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VnzwO4LM2u5loZRc"
Content-Disposition: inline


--VnzwO4LM2u5loZRc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommu tree got a conflict in:

  drivers/pci/pci.c

between commit:

  183c291caa34cc ("PCI: Use lockdep_assert_held(pci_bus_sem) to verify lock=
 is held")

=66rom the pci tree and commit:

  f5b16b802174fe ("PCI: Suspend iommu function prior to resetting a device")

=66rom the iommu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/pci/pci.c
index f7630fb3092857,a0ba42ae7ee01e..00000000000000
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@@ -13,7 -13,7 +13,8 @@@
  #include <linux/delay.h>
  #include <linux/dmi.h>
  #include <linux/init.h>
+ #include <linux/iommu.h>
 +#include <linux/lockdep.h>
  #include <linux/msi.h>
  #include <linux/of.h>
  #include <linux/pci.h>

--VnzwO4LM2u5loZRc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmJI0QACgkQJNaLcl1U
h9Dltwf/TPBjT9CRP2gVyAj3CxAuICjyuIHWgvGuZpeBX5++P1FiuGKN4Vo5ZaWO
wBybfhuaPbntje8CHIr7CBNW3O1NcfzAWSv/qFvIAQvcD5BhL+wrr0JvUgoxnG1E
CvHJT+Lc/WzpbeK62gI4MZP4GrW77m7K/zkyE+VA6O5OqlZkNkQwaWIE+cZQV2N6
K+kgidsXbzfE+d2BED68WrXczrlpEr43tqMdLdwMRrhxDmPcWfWBDFg8cWUnfVlo
GjP6TJNO9DuBvyTHyzyszfAezfKC0KIMkpiF644ryQDpFlfdFpmfdUEl9s9REaeE
UQojMJSfNDb8EEIC8bWnUtTgGNi8ag==
=a8um
-----END PGP SIGNATURE-----

--VnzwO4LM2u5loZRc--
