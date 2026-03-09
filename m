Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C3E3D2FEC;
	Mon,  9 Mar 2026 14:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066907; cv=none; b=SpZ60+QCNTF9W4QOGnHEcu3hM10Qb+JYM/rC4UEMLygq0ewVsW01CTO5s8fm4TP3iFNoNy8UuhBNjTftGsrQ+mZfryDjb+D6RiIuTePfAzBYGQbR0NjeSoXNLhFRWKMz4xhP6b98iSlWnwlR4W1ADapA04+fg8Avh0c0ubl7TqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066907; c=relaxed/simple;
	bh=9rr+QD/P/lYXiDjOo0kLnRzDrnNdMzuEFBf6qRH/QeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SGxecp+C0BQzd17SX6ixiQ1Psx+XrP/yHBG9o4UFCdqvfELiBiOWPm03TRe3P27wspILJAnc0+mHx8DAQ4EzYK4PiplxOqV/lL9jDv1uu4Zl+F1n3eQlEjduYqrQ8RNUygHSIwz8Zsmsk2TVy/nCkzTQujOdm0wWxfP4sNND69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQRIhSj3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQRIhSj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F9FC2BC86;
	Mon,  9 Mar 2026 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773066907;
	bh=9rr+QD/P/lYXiDjOo0kLnRzDrnNdMzuEFBf6qRH/QeE=;
	h=Date:From:To:Cc:Subject:From;
	b=RQRIhSj3mq4fmMOFm2atl3diqTXwrB5N+ZYXbIChQDa6xlixz4HXNz7Q997Uzhcz4
	 His/eEZe0ISBDZkhjH14nezNft4s6DLfys4+XoS/isWUlDQMY3YS8LkuSmU5lIXGVn
	 460beo86od+Iq+FY6CD5sPIt2k4By+n1Wz9tSb/gS+Z28D4KvQl5hs3LV8GI/lx68x
	 9Lhw2o4A+Ih7v+DCr40NhpbGJGfBGLlVyBuuE/3APlMRY3z6IJ7XemL/gHjZl+RdGI
	 gcTjf/cZaNYsFdRN23aZxECFldDWIY22adXI9dnV/w7on8l+oFTw4otHI5ZmwSozeD
	 eBkIlqnCL3a4g==
Date: Mon, 9 Mar 2026 14:35:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm-misc tree with the amdgpu tree
Message-ID: <aa7alzO1DPSnmSIs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5XM4+rh9C8fQU+4n"
Content-Disposition: inline


--5XM4+rh9C8fQU+4n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  include/drm/drm_fb_helper.h

between commit:

  1837c76b780a4 ("drm/amdgpu: Move test for fbdev GEM object into generic h=
elper")

=66rom the amdgpu tree and commit:

  6d438685340df ("drm/fbdev-emulation: Remove empty placeholders")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/drm/drm_fb_helper.h
index 15274b8a1d978,ca214b5c02833..0000000000000
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@@ -271,6 -271,119 +271,8 @@@ int drm_fb_helper_ioctl(struct fb_info=20
 =20
  int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
  int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
+ bool drm_fb_helper_gem_is_fb(const struct drm_fb_helper *fb_helper,
+ 			     const struct drm_gem_object *obj);
 -#else
 -static inline bool drm_fb_helper_gem_is_fb(const struct drm_fb_helper *fb=
_helper,
 -					   const struct drm_gem_object *obj)
 -{
 -	return false;
 -}
 -
 -static inline void drm_fb_helper_prepare(struct drm_device *dev,
 -					 struct drm_fb_helper *helper,
 -					 unsigned int preferred_bpp,
 -					 const struct drm_fb_helper_funcs *funcs)
 -{
 -}
 -
 -static inline void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helpe=
r)
 -{
 -}
 -
 -static inline int drm_fb_helper_init(struct drm_device *dev,
 -		       struct drm_fb_helper *helper)
 -{
 -	/* So drivers can use it to free the struct */
 -	helper->dev =3D dev;
 -	dev->fb_helper =3D helper;
 -
 -	return 0;
 -}
 -
 -static inline void drm_fb_helper_fini(struct drm_fb_helper *helper)
 -{
 -	if (helper && helper->dev)
 -		helper->dev->fb_helper =3D NULL;
 -}
 -
 -static inline int drm_fb_helper_blank(int blank, struct fb_info *info)
 -{
 -	return 0;
 -}
 -
 -static inline int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 -					    struct fb_info *info)
 -{
 -	return 0;
 -}
 -
 -static inline int drm_fb_helper_set_par(struct fb_info *info)
 -{
 -	return 0;
 -}
 -
 -static inline int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 -					  struct fb_info *info)
 -{
 -	return 0;
 -}
 -
 -static inline int
 -drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
 -{
 -	return 0;
 -}
 -
 -static inline void drm_fb_helper_unregister_info(struct drm_fb_helper *fb=
_helper)
 -{
 -}
 -
 -static inline void
 -drm_fb_helper_fill_info(struct fb_info *info,
 -			struct drm_fb_helper *fb_helper,
 -			struct drm_fb_helper_surface_size *sizes)
 -{
 -}
 -
 -static inline int drm_fb_helper_setcmap(struct fb_cmap *cmap,
 -					struct fb_info *info)
 -{
 -	return 0;
 -}
 -
 -static inline int drm_fb_helper_ioctl(struct fb_info *info, unsigned int =
cmd,
 -				      unsigned long arg)
 -{
 -	return 0;
 -}
 -
 -#ifdef CONFIG_FB_DEFERRED_IO
 -static inline void drm_fb_helper_deferred_io(struct fb_info *info,
 -					     struct list_head *pagelist)
 -{
 -}
 -#endif
 -
 -static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_hel=
per,
 -					     bool suspend)
 -{
 -}
 -
 -static inline void
 -drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper, bool =
suspend)
 -{
 -}
 -
 -static inline int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_he=
lper)
 -{
 -	return 0;
 -}
 -
 -static inline int drm_fb_helper_initial_config(struct drm_fb_helper *fb_h=
elper)
 -{
 -	return 0;
 -}
  #endif
 =20
  #endif

--5XM4+rh9C8fQU+4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmu2pYACgkQJNaLcl1U
h9AcOwf/WcSimoUmYj5nrebS+Gw6T/OXV3UtxWFQgVg7LpX2vVDcdw1VjQqWYVNi
HtDNckfK5hrm9i9EK5yedfkbNGxPXltHTKuYz+YDFZRa7doUyV8f+TJAsyF5wumX
NJ8oxpceSbHbq+Iid0xHmOoxMryymyTwrck1bU+Y7KchsJ7yACBf1WS/Ry0eqxEG
FCjvweMRaA+P91OBRvv6RwsGuW5crNLi8WfVsljCajjqQlImyeIYOOf367RlIZlN
W+s8hGwa7qQ8sXaokV8ZRB0++wgOSFYNPn/GRsM+p+t18sEd8cJeb/QIarUM4rsy
CRhOvUA15Tf5mSbHQ2NKX6MjrkxKcg==
=UWn/
-----END PGP SIGNATURE-----

--5XM4+rh9C8fQU+4n--
