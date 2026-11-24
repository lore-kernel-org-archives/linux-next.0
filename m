Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533786;
	b=gwFV/1wiCJUteik7YwKpJuq3fQgBuvDxnVNXeSHAye5w42tAlJWQmHCg5v7La+EMxOrG
	 UmP8K9ATcrHsYo9n/dpuT8Luke4Ef13aeJxyW+pj2n9FmmaIP0MqvqNgkpvCD1w5MDPID
	 gXKE9I8GbF8yTAgB/N2BHsVC8fbMF+2qzk9vqv/qLM0AreZ5Vy6RQQJXNQoUlRSk7zDla
	 uC32CaGMLXNdN74n7EDZmVJwxkHGZbeoIoqJeqXArgeWfVmR7EC4/R2PU1L/euFkD07X+
	 AP5DlwpgV4+PUvoNATZTBQTFTbULoc9IteV5fUr1iaGWJOLcYF0CFSr2tAUqGPZ56Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533786;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Wvro22YPm0sc7VtJ9BRqEaFRBATy0XmQt/Kjw4rfVwc=;
	b=wkSebuIVGdMwMu6UhLNjzU1+SE2mSRytuAGL/ZvW8RfF4f4zlzVu9CdrFmXwd9mskdkV
	 oAo/p42TZ2CTvMnFmY5Iimsb7mZ0cn9rB6iC9KuaFjMQVRt/TaF3KgGwE+opVnYJXZRzz
	 0fwugBy+9Wr/FrjUPyqwBsYRWeXNpceMhNjTEOi/mQ+ei0sULfUbiiADRqVRM9SJbmlGt
	 cm4IfPg/dmDrp4blkhKz2Olk3UzZk10TIvl+XEFt6m/x5Ilt/cVChwEdoI4+JRIjAGto1
	 2/bTtqaBJnFHHA2MCkjB32udFJ4XBn7v3Gos0h/qp7HFSR5jJFFyGFl5ovRGLi13g/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ScyHEDXh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02712606A31E;
	Tue, 24 Nov 2026 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ScyHEDXh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23D61F000CA;
	Tue, 24 Nov 2026 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533785;
	bh=Wvro22YPm0sc7VtJ9BRqEaFRBATy0XmQt/Kjw4rfVwc=;
	h=Date:From:To:Cc:Subject;
	b=ScyHEDXhFYB2tiOsKjR4kZ/yobRaQ0r6werkcc7qMLL4evJ0d7TkR5OD5X4ySMDNp
	 my5x3ECyUJfeWVTPJGvXw0xkdRcDFBnJd21SVIwSHFxxl8pQ9ruW3D4wOMZ6cWqWFU
	 8rF27ItqvzXe59UoOfj+hCLWDvQ4orTcfrES1fTE0aPutPjL3F17LYog4sHc+ggRt7
	 nufMNI8uz+BNBytzMy3G8CcV9fSUhi+Z60luI9pHEDkz9NmV6Kz4MHDY3UA2QBogxN
	 qMpAo35ytzhe5COw6GyPt6Skktu4dY2fSNcuJLVXfCdn4LCELOYMFvi4aNhx8N3ecY
	 eB8COQwyDgGgw==
Date: Tue, 24 Nov 2026 15:23:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: linux-next: manual merge of the drm-intel tree with the origin tree
Message-ID: <awWr1C8qQAfrXt2l@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="s87hUG1Zje37F0sQ"
Content-Disposition: inline


--s87hUG1Zje37F0sQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_quirks.c

between commits:

  88d804cd1be9a ("drm/i915/display: Add quirk to force backlight type on so=
me TUXEDO devices")
  b03f2f48069e9 ("drm/i915/psr: Adjust Xiaomi Book Pro 14 2026 psr2 disable=
 quirk")

=66rom the origin tree and commits:

  5bb277d94021f ("drm/i915/psr: Adjust Xiaomi Book Pro 14 2026 psr2 disable=
 quirk")
  6d00cec4c9bec ("drm/i915/bios: Add quirk to allow eDP joiner on ASUS ROG =
Strix SCAR 18")

=66rom the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/i915/display/intel_quirks.c
index e3303d5146e89,ec3a79c87e73d..0000000000000
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@@ -108,6 -108,16 +108,16 @@@ static void quirk_enable_dpcd_backlight
  	drm_info(display->drm, "Applying Enable DPCD Backlight quirk\n");
  }
 =20
+ /*
+  * VBT on some machines defaults the eDP pipe joiner to disabled even tho=
ugh
+  * the panel requires it to achieve its native mode, so allow it regardle=
ss.
+  */
+ static void quirk_allow_edp_joiner(struct intel_display *display)
+ {
+ 	intel_set_quirk(display, QUIRK_ALLOW_EDP_JOINER);
+ 	drm_info(display->drm, "Applying allow eDP joiner quirk\n");
+ }
+=20
  struct intel_quirk {
  	int device;
  	int subsystem_vendor;
@@@ -271,6 -281,9 +281,9 @@@ static struct intel_quirk intel_quirks[
  	/* Xiaomi Book Pro 14 2026 */
  	{ 0xb081, 0x1d72, 0x2424, quirk_disable_psr2 },
  	{ 0xb080, 0x1d72, 0x2424, quirk_disable_psr2 },
+=20
+ 	/* ASUS ROG Strix SCAR 18 G835LXG */
+ 	{ 0x7d67, 0x1043, 0x3b29, quirk_allow_edp_joiner },
  };
 =20
  static const struct intel_dpcd_quirk intel_dpcd_quirks[] =3D {

--s87hUG1Zje37F0sQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFq9MACgkQJNaLcl1U
h9A3Dgf/XjP/vcut0dT6mZXkNilCUjlAjH4FUYZzQu8JUxSpT4bp5CYIkvmTVsva
uv8FKBiFuXRKPaCIwcWYvjPLvInv6OzQraZc9fEwVJEXSGIBB58Jwt8/mrImgKsr
URrcam8MVzYHgellrFnLCUgknblKiDB4PXEHGkpXNSndnEBCLrUoYxjqbxj5G81Q
mwHSVSKexmLB5IP7Qt0yJKIBPndjCcl2jFAL/uGmu+Tl8TSmoD6aBdUhUQNL8qGt
N4H2jCtPgcOR3WIyhCP4q/OiI9F46Y90IIEM2kwoFZ3ZVQHZ5cNkQNCNHQXXNKbP
rsquhjTbVYW7kNS4u0eYxS5dMEX1UQ==
=qWAA
-----END PGP SIGNATURE-----

--s87hUG1Zje37F0sQ--
