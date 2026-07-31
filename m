Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02578305698;
	Fri, 31 Jul 2026 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505807; cv=none; b=Iq/SQuNwi2PeKhaPUSovzEPP2AWJK1/EDfgGUkJ8AXl4LyXivNr8GkUjtX0KRAXFLBaddsz8ZPl0NjOnFmGfRe6q1MiQgEJgRPlFy93rnHXhC4M7ghuua5Ya54E6KDjBSiI/k+a2UMwsvW6DmxgDGkAD2BmQcilSdeDMYLAJyro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505807; c=relaxed/simple;
	bh=lbXTahdM2VNOG7U9DwchYuQWhnNHOs8a/aYp/FSZnVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IYnRJfxuUV6VB2FsHf7xNnb0i7Aw4YJVG9FjmFF3CqPhhvRdkmRaAONgfVTXTyzO6g6sLE7pwt1QWbeQoHxYCFOosIdxny+nHMGvdDS23jLKPKhD63SmWmawBUd18rZsxgdGEKj0Qr/dcjUK7ULo9TCW6ms4bksGAVikKzkzK3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlUtaLq1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlUtaLq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2291F000E9;
	Fri, 31 Jul 2026 13:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785505805;
	bh=fEORQpubpXudAIsFpEpzyWIgEbxZ+DRZ1k8rUZqLWlk=;
	h=Date:From:To:Cc:Subject;
	b=PlUtaLq1swC9wgv6yzVwHLi4Th/kIKvxyDh7Vg8yWODBgDa7Cay+ou7xKfok2Ea0m
	 nEfn0q8WJV7j2qLdJo3AjhA41UOLRJ59xz0UJvLyXf9tnSl+60w2/4HfxzNMEPVdAi
	 GUxYWStGYcGWlpExq/Iy0/COjkPas9HQjO0majEj8VYlbRqpHpioQTyRjrq/I5mQ51
	 DcuPA0n7VXT2+MxyVxsLPFezHLsxq8CcZ7zkfP6DNoWqtJAEj7PfQXDlGM1XPhDMHK
	 sfUNrZ/H0nLDGFTaKeZgQUYqTBbml7U7Oq0E5gdrvV+xEJ3SQjXAt91vsqxNGdTw68
	 LEOedYSyK0D6Q==
Date: Fri, 31 Jul 2026 14:50:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jaehoon Kim <jhkim@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: linux-next: manual merge of the s390 tree with the dma-mapping tree
Message-ID: <amyoCSe6P7Utuo_N@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tULI0oFdjPa4iv46"
Content-Disposition: inline


--tULI0oFdjPa4iv46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/mm/init.c

between commit:

  30c5e45ee2c53 ("dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_=
SHARED")

=66rom the dma-mapping tree and commit:

  28b0d6897484a ("s390/pv: Enable SWIOTLB_ANY for s390 PV")

=66rom the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/s390/mm/init.c
index 8d1de5a2e5549,01050a8e7e05a..0000000000000
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@@ -166,7 -151,7 +166,7 @@@ static void __init pv_init(void
  	virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
 =20
  	/* make sure bounce buffers are shared */
- 	swiotlb_init(true, SWIOTLB_VERBOSE);
 -	swiotlb_init(true, SWIOTLB_FORCE | SWIOTLB_VERBOSE | SWIOTLB_ANY);
++	swiotlb_init(true, SWIOTLB_VERBOSE | SWIOTLB_ANY);
  	swiotlb_update_mem_attributes();
  }
 =20

--tULI0oFdjPa4iv46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpsqAgACgkQJNaLcl1U
h9DEvwf/Uzt4FvpdmMtgWBJHM4yHMtpsIz/2b/KeO+TVnkgLxZH3+7dm9f5krbVp
W7//zRbmtaQQe3pzpE4AUUrvISpExHmefTi6apynJ7stYp1EEvCCQZzviPkr/YAt
tkV1zDATV/nq9ruPixKkIcBCN/9UyrFncrowcFcqy6UsUTsUFKLLBlNC7FeUTVHP
qQaDsx5hFFzkjtAQc0lpp150JFOtpkHG0SXJvbnrPy/pqQv3wp0Rqx8TQIXFOZUP
QRLQ5zKbpigW/Cid0YLpTqHpCUsrRivzi1XwBZBZlBlUUEFDwz2OQ3bBRiSwuwQx
BJ3WT1TNq2ZOdxgv53toQb4yCZadPg==
=Ib9z
-----END PGP SIGNATURE-----

--tULI0oFdjPa4iv46--
