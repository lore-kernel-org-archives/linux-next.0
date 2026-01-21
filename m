Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1AB35F8DD;
	Wed, 21 Jan 2026 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001966; cv=none; b=qy+Gogkwf7cKM4SRUMQV+3Tf+w+qBBcE3jF4zaS8UBdb0uEF5JZlLMcWdpduRGP3GnGXruD5pZ2dAnoIWBLTem7YToUQ6miZiWs/D1MVyzRtGDTWXJKMK/3vE7fjY2YPMw/i82dQkC5dHiv7d3HbF4hrIM7cGY/dSGHuPDl1Sds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001966; c=relaxed/simple;
	bh=ibrfMROuMGm1tu5PdwsNjvRxhnL2rps7i7XMuwV/d4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gR/MHPYoQKjAOeSOQV/HLoVECnO5TyUxJ3bxRhANlq5rVSyGRK5cmAUEwnBEQPL9sX670zHUUqdLxCXM7dc25CTIH9Sd9vu3a50o62d6lAmIKfkFFRPlqniXYet59N3Hc46OIwRtAbxlhIyqQ+/KGjjST8jE/Ja84GX12xpT+jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnwAc/Jl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnwAc/Jl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A81FC116D0;
	Wed, 21 Jan 2026 13:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769001964;
	bh=ibrfMROuMGm1tu5PdwsNjvRxhnL2rps7i7XMuwV/d4E=;
	h=Date:From:To:Cc:Subject:From;
	b=YnwAc/JlXTE+7O3vPrHC2Ptky+TruX4f02RF6U2naeDhUvkv3DPJT0jJTxavfVGlP
	 2B4bKqGa0vrI2etI7Z/lP9Vq/dfzrvXozXY67bXLJLolQo7khiOLuJ/ZGc5Oi5FNWc
	 rttuht+FlbJZ6leUsHrsR9AtErvf2vsGD7qPkjKYWyFW3bmctuIxyEIWatrwBmbMFk
	 M/rIi4gFfGMWGQIJ9pVt/vHMkWnfg5nX6LcJM5t36dg0LiCYFrApl8tdHYmwwRAO3P
	 Wnv5KkMxkl3q1zTvk4xQUzuzwj4MhBaB+zJylH4zWpXrp3LClI/+JgdnBp+ZB44rNq
	 HJIyqIr9QDkag==
Date: Wed, 21 Jan 2026 13:25:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Subject: linux-next: manual merge of the pci tree with the origin tree
Message-ID: <aXDT53ca9FrHELdS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="swBdHtPtJd5n494A"
Content-Disposition: inline


--swBdHtPtJd5n494A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/controller/dwc/pcie-qcom.c

between commit:

  0cc13256b6051 ("PCI: qcom: Remove ASPM L0s support for MSM8996 SoC")

=66rom the origin tree and commits:

  8d8db7dbf2181 ("PCI: qcom: Rename PERST# assert/deassert helpers for unif=
ormity")
  6a1394990902f ("PCI: qcom: Remove DPC Extended Capability")
  7c29cd0fdc07e ("PCI: qcom: Remove MSI-X Capability for Root Ports")

=66rom the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/pci/controller/dwc/pcie-qcom.c
index 5a318487b2b3f,41baed591a4a8..0000000000000
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@@ -1312,12 -1311,13 +1310,15 @@@ static int qcom_pcie_host_init(struct d
  	if (pcie->cfg->ops->post_init) {
  		ret =3D pcie->cfg->ops->post_init(pcie);
  		if (ret)
- 			goto err_disable_phy;
+ 			goto err_pwrctrl_power_off;
  	}
 =20
 +	qcom_pcie_clear_aspm_l0s(pcie->pci);
 +
- 	qcom_ep_reset_deassert(pcie);
+ 	dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
+ 	dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
+=20
+ 	qcom_pcie_perst_deassert(pcie);
 =20
  	if (pcie->cfg->ops->config_sid) {
  		ret =3D pcie->cfg->ops->config_sid(pcie);

--swBdHtPtJd5n494A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlw0+YACgkQJNaLcl1U
h9D1pAf/RuJ7gcq/1Aqu5FR0NyUKr019gfOPbYexl+pCKY80tnJPazRqxm0FYVgw
YhRjAu9rAkjIpHnJya0HTkIQeJRlFSZd30gUX5/bXbwN6afbUG+EGuuyHO7VAL/k
vcH2pBK3OKEWIuuyuiASoRehN33JimcOLb9yxhiFnBE65BsZoBqOlg05qL3amtPk
cbvfr8l/SXEvWQBoTCdTA5/XGZ6BjHFmMndyTR18dJz4S8bWLeQbzCjLuXpn4ydm
oLuyZq/VwhEQ9lMsHGtNHRLTELW2Qhylaqn+ZsAkPsvcdHgtAjFgBkBCNVwLtLo8
PBBj6FfKSjd5zH4pf0tvkNekDCyxZw==
=sDXE
-----END PGP SIGNATURE-----

--swBdHtPtJd5n494A--
