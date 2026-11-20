Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189257;
	b=aVm7GvhhVWhaGKfdcies/nYolVNeNn6LoNMDppUSkUdCocAcn2wqhVjJF5e1tyJ3PnIR
	 3PvlN0NUhlFoKAdSICoBOSPz5vVYkgjLRNkCesNv5hpn85CmSiEBRo94HgkFuoIZEGmnz
	 OJpkdEQ/35r9JxZFtfyc3IJ/ur0H6MH85C/0Jaab3URoCYXTQfbPa77TrtzoCmQe2fsw9
	 CK/irhimPjEBqzpWl8xyjZwKTlILCmJze06qUdsOqNvrRNhh4TKzpfFCFbXI9hWdk6PFA
	 t3K7WfdV6H2N3IGrFNU3KMZvnazqIEHlk+XfnwqKb8M/82X9vMh6uf12QD0lW1O+BbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189257;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=YzCmk60AeGBh2Q3ykEBFfvvkrWc+WSvMIROm4YdLrGg=;
	b=ykUCigBRqhUY/qWZ/Fd1bByx2zu+LuOr9PQBaf9NyuPq2beHOsVJqlLxMzShBr8Knbfi
	 rwJgMECGgbJX9lBKSwLlWGYoAyqW/M7wcS1BWxBzj49YZE+tG8TxOtgaqE4Fiq7B7227Y
	 HeDoiCL/DPPlafpoQ7ZX4+DIwu166r8PCu744BPIQWHCQtJlBEhOuVNS9QcNqazZHvOYB
	 J3ldpbjC7lS7llBkiUii8boPsPgodgMCINf1cZCR/qezBxLeTcSkPkjBB3P8M5jEOzwgo
	 c143wvhrPlSU+31hfZwz82bKJEvg8wTiIEEIQFYTw9drP7JW4RP9yC+kMjZG3UBOrdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QaP9/IuP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AFF606A330;
	Fri, 20 Nov 2026 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaP9/IuP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588A61F000C6;
	Fri, 20 Nov 2026 15:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189257;
	bh=YzCmk60AeGBh2Q3ykEBFfvvkrWc+WSvMIROm4YdLrGg=;
	h=Date:From:To:Cc:Subject;
	b=QaP9/IuPApa8R3jnWuAWRNLsA3qmHK26b+aQYSMIGDYs5ft+Oev/Bv8OgBLZDCggq
	 H2JyDEYY55zeNDCJAv2U4cC3F1WFDqyYeZKPTAjdsSUzlCMfJX3vfvVZxZtPoy5ONI
	 sdJ86fUmB8BetBfOzIsI0a4kWHjMejo25YMtHWAQMlI+PqDP7E9l15mA7/XUrBM0tJ
	 AddHoqb5gzMeNe4yJt9U2oII/+ViyVDj6b0BvJL/0iFxjP/gSyP4Tq8qgCVJtrfd7u
	 AWRDRyo7kxS5scfZAq2s2EyEYnfJpo5atEZLIhcjU6ajzvIo0VEwv9Lx0rMC1ctsX9
	 0ZhKklLieIBgA==
Date: Fri, 20 Nov 2026 15:40:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Adrian Betschart <adrian.betschart@cinemaone.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	Dave Airlie <airlied@redhat.com>,
	Davey Hughes <davidralphhughes@gmail.com>,
	DRI <dri-devel@lists.freedesktop.org>,
	Fangzhi Zuo <jerry.zuo@amd.com>, Hugo Sales <hugo@hsal.es>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Wayne Lin <wayne.lin@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-fixes tree
Message-ID: <awBqBGP_igDMIjAm@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f8DaNxDYe9UPQUTy"
Content-Disposition: inline


--f8DaNxDYe9UPQUTy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commits:

  406a850b0dd28 ("drm/amd/display: Move HDMI FRL Polling Outside dc_lock")
  449141afc84a4 ("drm/amd/display: Stop HDMI FRL status polling on fini")
  09b6bf1a04cc6 ("drm/amd/display: Take every stream out of self-refresh be=
fore a modeset")
  6fd6e75162065 ("drm/amd/display: Apply the HDMI RGB range default only to=
 HDMI signals")
  fff46a322847a ("drm/amd/display: Keep FreeSync flip timing across plane r=
esets")

=66rom the drm-fixes tree and commits:

  e2830fb628915 ("drm/amd/display: Test FreeSync flip timing across plane r=
esets")
  4acf82d2a2dcc ("drm/amd/display: Keep FreeSync flip timing across plane r=
esets")
  39f37a2346410 ("drm/amd/display: Apply the HDMI RGB range default only to=
 HDMI signals")
  acf94b17b1243 ("drm/amdgpu: remove legacy non-DC display support code")
  5d90fdb959505 ("drm/amd/display: Take every stream out of self-refresh be=
fore a modeset")
  709b7a5aff3ad ("drm/amd/display: Stop HDMI FRL status polling on fini")
  7a1807cd11a8c ("drm/amd/display: Move HDMI FRL Polling Outside dc_lock")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3cf2e2fdab04d,2dbea24e93e60..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -2728,15 -2728,8 +2728,8 @@@ EXPORT_IF_KUNIT(dm_bandwidth_update)
  static const struct amdgpu_display_funcs dm_display_funcs =3D {
  	.bandwidth_update =3D dm_bandwidth_update, /* called unconditionally */
  	.vblank_get_counter =3D dm_vblank_get_counter,/* called unconditionally =
*/
- 	.backlight_set_level =3D NULL, /* never called for DC */
- 	.backlight_get_level =3D NULL, /* never called for DC */
- 	.hpd_sense =3D NULL,/* called unconditionally */
- 	.hpd_set_polarity =3D NULL, /* called unconditionally */
- 	.hpd_get_gpio_reg =3D NULL, /* VBIOS parsing. DAL does it. */
  	.page_flip_get_scanoutpos =3D
  		dm_crtc_get_scanoutpos,/* called unconditionally */
- 	.add_encoder =3D NULL, /* VBIOS parsing. DAL does it. */
- 	.add_connector =3D NULL, /* VBIOS parsing. DAL does it. */
  };
 =20
  #if defined(CONFIG_DEBUG_KERNEL_DC)
@@@ -3854,7 -3847,7 +3847,7 @@@ EXPORT_IF_KUNIT(dm_arm_vblank_event_pre
   * this at commit time, not in atomic check: by then the previous commit
   * has finished writing it.
   */
- static void
+ STATIC_IFN_KUNIT void
  dm_plane_inherit_flip_time(struct dc_plane_state *dc_plane_state,
  			   struct drm_plane_state *old_plane_state,
  			   struct drm_plane_state *new_plane_state)
@@@ -3866,6 -3859,7 +3859,7 @@@
  	    old_plane_state->crtc =3D=3D new_plane_state->crtc)
  		dc_plane_state->time =3D old_dc_plane_state->time;
  }
+ EXPORT_IF_KUNIT(dm_plane_inherit_flip_time);
 =20
  static void amdgpu_dm_commit_planes(struct drm_atomic_commit *state,
  				    struct drm_device *dev,

--f8DaNxDYe9UPQUTy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAagQACgkQJNaLcl1U
h9Dm3Af+PZxOS1ZGxlezvO24ycghrvGVNFlQzUqnnzAUUHbnxv+fiB+gCMQbNbCl
+uYHBZZc74z+ceFsBVcXv1gf46FcpBiLIcRSHTzRCDTOe/jLyN0r0M4JZU/hpsot
y+d6LtQGxO/pcxkyJbX8KbVt+f8QVEvx3c6GTB/qCRE9kXvSlG3VhaNjk/JNNF5m
8y6UwYgpAi5r9V0t7QQmzDimv1rrfDnC3AKQ8yyXtC7dz+deSM46X4Ce9xZLWb/Q
+p3jPgDWUyBsV+elf9Pfqb0IJG1is3O8vVNqdXJ0Fn6w4zmZ6YjCqRu3H/xfEw83
Hd9TPKS93Dr95cn0So3BdQux+jiyaQ==
=4n0Y
-----END PGP SIGNATURE-----

--f8DaNxDYe9UPQUTy--
