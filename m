Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3F53451B3;
	Wed, 27 May 2026 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891779; cv=none; b=V3xZpuQqMAWaToyc8hF0wlHnTuLaPfdpBuhPxfppAX0e0izWOHtgPWmE5S6bYcK/Y+Qi7VkXbplMkoIs7Fls/XlrCJqgPFwwB2ZRw9my5liWN9xAw41I2er2R6tKo41/sQ3e1d+UHoUhlfmc/KDBsbunPPnkHW0HJmDt2E+ZnZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891779; c=relaxed/simple;
	bh=pr2XFmE66m7JtFA//DdPkw5VUhssVcJPCpbTLHJB+cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q1Ywnv0HhmYvc4aSX+In1mxiOs6p9E+DJI3AkRKuFNypN65H9ViD2fm6yZly6z7B9ho1sU3FxacKt7EkFrWWgTZ4QYRcKC3Tt1KI83mAGDutX/bAdMuPZIORjdWMf6ALDP410GMU5W6a/G2ozr+BIu79U1f6vMgCaGJB9jKoZj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFAWsnxY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFAWsnxY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DC91F00A3F;
	Wed, 27 May 2026 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779891777;
	bh=YNExk73VztDYn6co2AUObJ3GUK9qqB5SSKbjrnI6JWg=;
	h=Date:From:To:Cc:Subject;
	b=YFAWsnxYA3v28700Us0ToyXfFBIIJsg9+1rM4v4o5r5abn3gCScVd94hhlPHpA8Te
	 3CJ2V71h2AA/a2QlZCClh7ANrKqCHpP/UxO71K9d1PdOOvucj7PEf77R8r1ZU5xt1c
	 Xa/N4GlRO5GiwzSiVFLsm2O2UU6s8G++k/SgRQY3RT6H1yZAS0AzDjDXQzrTYIKiGB
	 D+WUoJUoSDbMqUlNqH5jkNWP8uAa1IAkj580ZbmSdzTz3RumFKMVS6k2zSyAzFMGQx
	 csLEgiRyXzuL3iAmjHmw69AEP6cZgo80yG6ewOFzsGDqcbDBgLxwA6942QKw6gWgp1
	 JTvWcEJdNXw3g==
Date: Wed, 27 May 2026 15:22:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <ahb-PZwR5mEd8A9W@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oJJbkxoBRlp7+aMD"
Content-Disposition: inline


--oJJbkxoBRlp7+aMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/include/asm/tdx.h

between commit:

  b7d2173946efa ("x86/virt/tdx: Add SEAMCALL wrapper for TDH.SYS.DISABLE")

=66rom the tip tree and commits:

  4487492b92a4f ("x86/tdx: Use pg_level in TDX APIs, not the TDX-Module's 0=
-based level")
  3f330fbb918fb ("x86/virt/tdx: Move mk_keyed_paddr() to tdx.c due to no ex=
ternal users")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/x86/include/asm/tdx.h
index e5a9cf656c072,32fbdf8f55aef..0000000000000
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@@ -145,32 -177,15 +146,17 @@@ struct tdx_vp=20
  	struct page **tdcx_pages;
  };
 =20
- static inline u64 mk_keyed_paddr(u16 hkid, struct page *page)
- {
- 	u64 ret;
-=20
- 	ret =3D page_to_phys(page);
- 	/* KeyID bits are just above the physical address bits: */
- 	ret |=3D (u64)hkid << boot_cpu_data.x86_phys_bits;
-=20
- 	return ret;
- }
-=20
- static inline int pg_level_to_tdx_sept_level(enum pg_level level)
- {
-         WARN_ON_ONCE(level =3D=3D PG_LEVEL_NONE);
-         return level - 1;
- }
-=20
 +void tdx_sys_disable(void);
 +
  u64 tdh_vp_enter(struct tdx_vp *vp, struct tdx_module_args *args);
  u64 tdh_mng_addcx(struct tdx_td *td, struct page *tdcs_page);
- u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, struct page *page, struc=
t page *source, u64 *ext_err1, u64 *ext_err2);
- u64 tdh_mem_sept_add(struct tdx_td *td, u64 gpa, int level, struct page *=
page, u64 *ext_err1, u64 *ext_err2);
+ u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, kvm_pfn_t pfn, struct pa=
ge *source,
+ 		     u64 *ext_err1, u64 *ext_err2);
+ u64 tdh_mem_sept_add(struct tdx_td *td, u64 gpa, enum pg_level level, str=
uct page *page, u64 *ext_err1, u64 *ext_err2);
  u64 tdh_vp_addcx(struct tdx_vp *vp, struct page *tdcx_page);
- u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, int level, struct page *=
page, u64 *ext_err1, u64 *ext_err2);
- u64 tdh_mem_range_block(struct tdx_td *td, u64 gpa, int level, u64 *ext_e=
rr1, u64 *ext_err2);
+ u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, enum pg_level level, kvm=
_pfn_t pfn,
+ 		     u64 *ext_err1, u64 *ext_err2);
+ u64 tdh_mem_range_block(struct tdx_td *td, u64 gpa, enum pg_level level, =
u64 *ext_err1, u64 *ext_err2);
  u64 tdh_mng_key_config(struct tdx_td *td);
  u64 tdh_mng_create(struct tdx_td *td, u16 hkid);
  u64 tdh_vp_create(struct tdx_td *td, struct tdx_vp *vp);

--oJJbkxoBRlp7+aMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoW/jwACgkQJNaLcl1U
h9CprQf9GVX3rKVD/iy2CGviivjQmO77aHKsC5Vyl+r6F85Bvll05g2CQVBU3KMP
vyHyVOdjYHqvp5ITXrPOsLJ84QmpWpWb+nDTiRDPNGN1R/a3biu/Pt/gS83XOVJL
6I7RSWbhlpMxHeOtaQ9LWRWWog9r/D4LqrrTS31AGz1iKHakntOlcJeAPanR1aLZ
FGJBmDuJZIFo113LtskHpDaIrpZY0OLGinhxdvclGnmnfWDfRmBs9KUfQlVfdP9F
M4lTTxA4uS/jzw+TOeAN2cLMO/P3wJEBX48KpvxSU4mYQBwxtwOJvYnyD3HRqSOf
dePjnB8rWHajeXIA5rUlb6dBXqZiHA==
=d4Rh
-----END PGP SIGNATURE-----

--oJJbkxoBRlp7+aMD--
