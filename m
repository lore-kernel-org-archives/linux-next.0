Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A8823BD1B;
	Mon, 18 May 2026 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120641; cv=none; b=qTkn4gdXZ0oIwKS8dCTsnALrGI0bhaWWY+rAoDev2GUFLvczQEtmqQO/416EEDJOmYsJ4Lr/V+uoojJoNRTOWK4zeBHDPCs4WGEoB0KRXz/h291p6d3/LfNQNV9E+Dx+Vl+sWv2ZeQkYfwte9I/WPOtSXamSGko2aPHGtFO/0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120641; c=relaxed/simple;
	bh=HIaE0GK3QIh2mZITmeWpGkxId+tCg5/O7Cu5trXdDzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jhEOBEuDwbeHky0mDxHzwfJiPXpMSgxoBA+b0urvybJsFgc+IYT4we3pFixRQyiAE+d0RrqgBa3NFtrH5yji6fvXUS7h4U4nDpjXzro+Rx8J+hp5SRmFwc+dZCe95234r56XdCCBwJyB6UqKatxRMLxa3YO0Xxko+rCMIC3akRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7/VKOtu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7/VKOtu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117BFC2BCB7;
	Mon, 18 May 2026 16:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779120640;
	bh=HIaE0GK3QIh2mZITmeWpGkxId+tCg5/O7Cu5trXdDzQ=;
	h=Date:From:To:Cc:Subject:From;
	b=D7/VKOtugh7/fP46X8USjq9ZI9GqlugV+tvsHhPIEyDPGxNYc5eTzofYe9+KUYxvY
	 PMbIWjniWZmrOjEzHobxuhxEWL+8iBVRafl+34sp9vQFDgfn+y0ZVe5NT7WlbPzh8W
	 Dapw1CKX+0d/XTF1K4bFqObo09TmqIHf34Zv5CozmfenUi4EAZs9Uz+r5ueoIFwk5X
	 7fWP608GA4GEruCGg0PzdG5YOvaGWRn73B7rWNMFGwaCnvCJP5CDJoLf0MjBbQ1y8b
	 WQBxZNZcOSa1H7MpKqZx8ZxoglpOYLP79YsyeMZ9UR2iUwXFpZeyo96ObhFSjwQZJi
	 xIN/JGNX/jhOA==
Date: Mon, 18 May 2026 17:10:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <ags5_LIZq2DlzmAN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uChC8WON4p+j53ct"
Content-Disposition: inline


--uChC8WON4p+j53ct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/include/asm/tdx.h

between commit:

  b7d2173946efa ("x86/virt/tdx: Add SEAMCALL wrapper for TDH.SYS.DISABLE")

=66rom the tip tree and commit:

  4487492b92a4f ("x86/tdx: Use pg_level in TDX APIs, not the TDX-Module's 0=
-based level")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/x86/include/asm/tdx.h
index 15eac89b0afbe,c140ddde59ffe..0000000000000
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@@ -187,14 -187,6 +187,8 @@@ static inline u64 mk_keyed_paddr(u16 hk
  	return ret;
  }
 =20
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
  u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, struct page *page, struc=
t page *source, u64 *ext_err1, u64 *ext_err2);

--uChC8WON4p+j53ct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLOfsACgkQJNaLcl1U
h9BbJwf/Quqxx+0KlKSmagiuGHBcig+vdn41MgkTGWa2VVVhHVLjnQIyxk1dndP/
bBr4HeIywtIBckAwSnTDXEoO2jZBKqtVJr6dbvVYH2EaocPe7JCI0fiWt1G4VAQ2
DzvQIr0d59b/z2kCkhEf6tN2QlkQfjOCLIjU69khqVkCoZl4v/lN2iLFMbQJ4d76
wDPdVNtofuy//XOrLXntS7O0Duih/uOkbT3ne775q6wooY62Hc6uNvrAMMOd2NvC
F5HXtqHdf0Tb+uhcNGSGky1A1ZVC0bhkZWZJoxN7Vh8oTb0caTS/fjpIW0Cyboa5
wjsemvBzvGfcMDQIYRJwnbKQUrXLfg==
=J1pG
-----END PGP SIGNATURE-----

--uChC8WON4p+j53ct--
