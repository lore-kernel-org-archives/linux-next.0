Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAEE1C84BB;
	Wed,  1 Apr 2026 14:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052462; cv=none; b=SCMFhULGWMMMYfpAHUo6Lh55hxcN6XOsjG/A0Q3m4SUZTvAsgmBTljvARO3AjVi3TwdHGNASKnkxl3WeA29Gw74/u/WRGiLt0nziF8B6PTSXo5NxdVmR2CZO3S/Wm8KXwGtcI+z6+/1/BqpPkKADaK8WLMbra9v0MhRD1XVk3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052462; c=relaxed/simple;
	bh=ikhatxBZq6Z/B6o3ja7E6A6ZANNgbjK65FC2T4FOwzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hxp9hLK4dkTtXpTAwu45DXnMI7+qi7po4d48KFYvmICERe3BG/Ga/k6WH4JT0GnIYZfn8YDwe+hET0Mlu7ScNP1bytbOzpie1jh7Sc9fVFn27RjlCDjNHxFRDqZlamSPEyQ4yaXBXPBBY22XUf8bg4uwxHDinIvc0cK+MafsqFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQHHtQgH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQHHtQgH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126C4C4CEF7;
	Wed,  1 Apr 2026 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775052462;
	bh=ikhatxBZq6Z/B6o3ja7E6A6ZANNgbjK65FC2T4FOwzg=;
	h=Date:From:To:Cc:Subject:From;
	b=NQHHtQgHl2dmAlkUEjWMLFrcNc7vqABpio635HUCYNxiBwNH5+KkvixBT783hfUMB
	 pF6xPFgh4LogQ53iWKau/Cy3qYJSQI62a7nbqBEWU/0lxEhxFpX4QxlE5ReRVG7ApR
	 lpevcob394PAvEMQwUN+4HVmaMrygWhi8Ohk14Ol/+C1Ftu3PEDHbuR+IzGgrFBYdO
	 4yJBrdQfDQAp4CzcHahU9XPZR0Ecr6XJWUi+RvoEIg0WPuFPDsFIdkMrjE3tdadRjl
	 khV9/UYDyLqtNrqOdA6LXBrf/1IHpG57F2Ell1J1CN0kfuv7vAdWQMes3Jt91I+wU/
	 D7WHVxCDlrZ8A==
Date: Wed, 1 Apr 2026 15:07:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <ac0mqrDGf_pvx4jb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mHSO47euoKjOdQ2p"
Content-Disposition: inline


--mHSO47euoKjOdQ2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

During the final build, today's linux-next build (sparc64 defconfig)
failed like this:

In file included from <command-line>:
In function 'sparse_init_one_section',
    inlined from 'sparse_init_early_section' at /tmp/next/build/mm/sparse.c=
:323:2:
/tmp/next/build/include/linux/compiler_types.h:699:45: error: call to '__co=
mpiletime_assert_420' declared with attribute error: BUILD_BUG_ON failed: S=
ECTION_MAP_LAST_BIT > min(PFN_SECTION_SHIFT + __ffs(sizeof(struct page)), P=
AGE_SHIFT)
  699 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |                                             ^
/tmp/next/build/include/linux/compiler_types.h:680:25: note: in definition =
of macro '__compiletime_assert'
  680 |                         prefix ## suffix();                        =
     \
      |                         ^~~~~~
/tmp/next/build/include/linux/compiler_types.h:699:9: note: in expansion of=
 macro '_compiletime_assert'
  699 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:40:37: note: in expansion of macr=
o 'compiletime_assert'
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:51:9: note: in expansion of macro=
 'BUILD_BUG_ON_MSG'
   51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condit=
ion)
      |         ^~~~~~~~~~~~~~~~
/tmp/next/build/mm/internal.h:975:9: note: in expansion of macro 'BUILD_BUG=
_ON'
  975 |         BUILD_BUG_ON(SECTION_MAP_LAST_BIT > min(PFN_SECTION_SHIFT +=
 __ffs(sizeof(struct page)),
      |         ^~~~~~~~~~~~

Caused by commit

   28208ad9dae4d (mm/sparse: fix BUILD_BUG_ON check for section map alignme=
nt)

=66rom the mm-unstable tree.  I have reverted that commit for today.

--mHSO47euoKjOdQ2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNJqkACgkQJNaLcl1U
h9Avbwf9FzmaxTUBdg2HHT8iIKqOmNOlnPlwdGDa4quUjbPShtHfBAPCAdzMj9Pt
GGWZX5PbcB58tuFMgi6zWKiuG213OWXHTzusM4pCGXUJUqGN/lTlbEBBHG85ff90
wDOymRLY7xzLqhKPemr5hwZuc6qJuwHol6pc0gqr1T0FqPAtN/JzTjeFZb730Cgp
/Hcg79qVJ4H24jpZ5DLxYi2Ixxv+XlbP4jhre9C60FSmQYbm97RUza4bd0toJjhW
+CmRoiEfeX1J7mfne0jL9uoJMT8sXgw9cVyZTi2RsE+Jysy1vhfbSwDV3oybeCgX
fnEN7wO8GfQGDeTD1Jzggut6O4XEfw==
=wGDZ
-----END PGP SIGNATURE-----

--mHSO47euoKjOdQ2p--
