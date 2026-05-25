Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1F2773D3;
	Mon, 25 May 2026 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779721363; cv=none; b=jfpJTWBrUtMagt2vtC5Ewt9sVKHb8kEIaWQRNvaWEYjEZHxW3jxES8Ve7i+Z7mLzFDrWIPUkA/AuV3mR7stqNjGly5idtXVtISAKMe57Qz7Kg59yHhTD5UfVSPJqF1iSJih+unU/LnVKfraJKDBYylrSxzZeO7FgUuEELOCDIbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779721363; c=relaxed/simple;
	bh=tm6oaghaR0QCop1wa4OBNCwlwdxkxbKFn+CH+PpdQOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cr3Wc7/975crRipU/QP7iSSpmicphNhSLcKt7SJ5OeNAC95W8s5JJYIayBOEVZL8O4J/M9vS4GUVnfbwEN5gQW4W98j/3ihKvJ586jmHXO1G6cGtz1fKR8Buq/r5j8DY1rv5s87EIDul+MFGlg9gJ+2yrvmhx6pOuOr/V8pfX6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abQDFWZo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abQDFWZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3711F000E9;
	Mon, 25 May 2026 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779721362;
	bh=oE/uAUi1ZJ8Z07LJo3PiENxZ5di8rJGAwdTc2Ip5hJM=;
	h=Date:From:To:Cc:Subject;
	b=abQDFWZoeoIySS5uM50oNQAhEjFEVdVhPVHyVFnb4M3QzXnsXKnjMt0FinMac5pWX
	 OjO7kExt7XscZ3Kvd5x77xeMvRUYkV5eH1ALelDj3wJaSovdgCXh155PFpm53LUPNe
	 nYkMYpYhoDn77oPoKMZsbEGSBIIJOqWZmyvdsuHDkGG3Xdm/9IimafUBUJW4z/k3SZ
	 NxrOyUeiujK/5hl+P8aOeVKMbqrDFcUC9SDVEEjD4D2R63Sw/t76Og7BAKWJSYkGVp
	 p/QIre4pVFgcM+LjoxRieN7stJ1lR+QuXj4p6b1mhqq7NzyeXejHvsUITNnd2cQ1dJ
	 ahEkFWGsGtkfQ==
Date: Mon, 25 May 2026 16:02:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <ahRkjeEjdeF_icWN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GroEncpA0Meuaket"
Content-Disposition: inline


--GroEncpA0Meuaket
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:43:48:
error: 'struct drm_atomic_state' declared inside parameter list will
not be visible outside of this definition or declaration [-Werror]
   43 |                                         struct drm_atomic_state *state)
      |                                                ^~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:
In function 'vs_cursor_plane_atomic_check':
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:45:82:
error: passing argument 1 of 'drm_atomic_get_new_plane_state' from
incompatible pointer type [-Wincompatible-pointer-types]
   45 |         struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
      |                                                                                  ^~~~~
      |                                                                                  |
      |                                                                                  struct
      |                                                                                  drm_atomic_state
      |                                                                                  *
In file included from
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:12:
/tmp/next/build/include/drm/drm_atomic.h:824:64: note: expected
'const struct drm_atomic_commit *' but argument is of type 'struct
drm_atomic_state *'
  824 | drm_atomic_get_new_plane_state(const struct drm_atomic_commit *state,
      |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:55:60:
error: passing argument 1 of 'drm_atomic_get_new_crtc_state' from
incompatible pointer type [-Wincompatible-pointer-types]
   55 |                 crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
      |                                                            ^~~~~
      |                                                            | struct
      |                                                            drm_atomic_state
      |                                                            *
/tmp/next/build/include/drm/drm_atomic.h:794:63: note: expected
'const struct drm_atomic_commit *' but argument is of type 'struct
drm_atomic_state *'
  794 | drm_atomic_get_new_crtc_state(const struct drm_atomic_commit *state,
      |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:
At top level:
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:101:51:
error: 'struct drm_atomic_state' declared inside parameter list will
not be visible outside of this definition or declaration [-Werror]
  101 |                                            struct drm_atomic_state *atomic_state)
      |                                                   ^~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:
In function 'vs_cursor_plane_atomic_enable':
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:103:72:
error: passing argument 1 of 'drm_atomic_get_new_plane_state' from
incompatible pointer type [-Wincompatible-pointer-types]
  103 |         struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
      |                                                                        ^~~~~~~~~~~~
      |                                                                        |
      |                                                                        struct
      |                                                                        drm_atomic_state
      |                                                                        *
/tmp/next/build/include/drm/drm_atomic.h:824:64: note: expected
'const struct drm_atomic_commit *' but argument is of type 'struct
drm_atomic_state *'
  824 | drm_atomic_get_new_plane_state(const struct drm_atomic_commit *state,
      |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:
At top level:
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:118:52:
error: 'struct drm_atomic_state' declared inside parameter list will
not be visible outside of this definition or declaration [-Werror]
  118 |                                             struct drm_atomic_state *atomic_state)
      |                                                    ^~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:
In function 'vs_cursor_plane_atomic_disable':
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:120:72:
error: passing argument 1 of 'drm_atomic_get_old_plane_state' from
incompatible pointer type [-Wincompatible-pointer-types]
  120 |         struct drm_plane_state *state = drm_atomic_get_old_plane_state(atomic_state,
      |                                                                        ^~~~~~~~~~~~
      |                                                                        |
      |                                                                        struct
      |                                                                        drm_atomic_state
      |                                                                        *
/tmp/next/build/include/drm/drm_atomic.h:809:64: note: expected
'const struct drm_atomic_commit *' but argument is of type 'struct
drm_atomic_state *'
  809 | drm_atomic_get_old_plane_state(const struct drm_atomic_commit *state,
      |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:
At top level:
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:135:51:
error: 'struct drm_atomic_state' declared inside parameter list will
not be visible outside of this definition or declaration [-Werror]
  135 |                                            struct drm_atomic_state *atomic_state)
      |                                                   ^~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:
In function 'vs_cursor_plane_atomic_update':
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:137:72:
error: passing argument 1 of 'drm_atomic_get_new_plane_state' from
incompatible pointer type [-Wincompatible-pointer-types]
  137 |         struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
      |                                                                        ^~~~~~~~~~~~
      |                                                                        |
      |                                                                        struct
      |                                                                        drm_atomic_state
      |                                                                        *
/tmp/next/build/include/drm/drm_atomic.h:824:64: note: expected
'const struct drm_atomic_commit *' but argument is of type 'struct
drm_atomic_state *'
  824 | drm_atomic_get_new_plane_state(const struct drm_atomic_commit *state,
      |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:147:55:
error: passing argument 2 of 'vs_cursor_plane_atomic_disable' from
incompatible pointer type [-Wincompatible-pointer-types]
  147 |                 vs_cursor_plane_atomic_disable(plane, atomic_state);
      |                                                       ^~~~~~~~~~~~
      |                                                       | struct
      |                                                       drm_atomic_state
      |                                                       *
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:118:70:
note: expected 'struct drm_atomic_state *' but argument is of type
'struct drm_atomic_state *'
  118 |                                             struct drm_atomic_state *atomic_state)
      |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:
At top level:
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:225:27:
error: initialization of 'int (*)(struct drm_plane *, struct
drm_atomic_commit *)' from incompatible pointer type 'int (*)(struct
drm_plane *, struct drm_atomic_state *)' [-Wincompatible-pointer-types]
  225 |         .atomic_check   = vs_cursor_plane_atomic_check,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:225:27:
note: (near initialization for
'vs_cursor_plane_helper_funcs.atomic_check')
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:226:27:
error: initialization of 'void (*)(struct drm_plane *, struct
drm_atomic_commit *)' from incompatible pointer type 'void (*)(struct
drm_plane *, struct drm_atomic_state *)' [-Wincompatible-pointer-types]
  226 |         .atomic_update  = vs_cursor_plane_atomic_update,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:226:27:
note: (near initialization for
'vs_cursor_plane_helper_funcs.atomic_update')
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:227:27:
error: initialization of 'void (*)(struct drm_plane *, struct
drm_atomic_commit *)' from incompatible pointer type 'void (*)(struct
drm_plane *, struct drm_atomic_state *)' [-Wincompatible-pointer-types]
  227 |         .atomic_enable  = vs_cursor_plane_atomic_enable,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:227:27:
note: (near initialization for
'vs_cursor_plane_helper_funcs.atomic_enable')
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:228:27:
error: initialization of 'void (*)(struct drm_plane *, struct
drm_atomic_commit *)' from incompatible pointer type 'void (*)(struct
drm_plane *, struct drm_atomic_state *)' [-Wincompatible-pointer-types]
  228 |         .atomic_disable = vs_cursor_plane_atomic_disable,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/verisilicon/vs_cursor_plane.c:228:27:
note: (near initialization for
'vs_cursor_plane_helper_funcs.atomic_disable')

Caused by commit

  8c4ae21891255 (drm: verisilicon: add support for cursor planes)

interacting with

  5164f7e7ff8ec (drm: Rename struct drm_atomic_state to drm_atomic_commit)

which appears to be an ancestor of the verisilicon commit.  I have used
the version from next-20260522 instead.

--GroEncpA0Meuaket
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUZIwACgkQJNaLcl1U
h9DN8Qf/XuhsmNTm6pM5E0zNbbxWHWulWwJR/Ew5fOfYo7OrEPRrSuPtdQAtut5S
hEBMfjyeSf4zBnDpN/k6Q4Qgzt7xkXaD1okSbNf/445x10ZnejyNR/uVkcJga89Y
4GXCtPZtY6VQq6sIvgkUz4wWuFHhh4nUkhLuI+EEkS3aagdGcF/aa9THi8CFnUQ/
5xXN5VmNXybd0axsMDPsyH8PQyZhL3yIK24Sf4B7hsJWV8naQVWwN+TUNxLTT0qJ
Vx0G/8dzXjBj7as37v/7ifRZqqsjYtswtWdGCE4oMfnUXH8BMUO+HMY/4uCXWymB
T7xr3DtMEHxQTpuEuThcIHWHqdUchg==
=5+80
-----END PGP SIGNATURE-----

--GroEncpA0Meuaket--
