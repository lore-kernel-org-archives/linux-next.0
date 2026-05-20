Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E171C3BEB;
	Wed, 20 May 2026 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279517; cv=none; b=aVCIh1LoDWQhPFQzpacByyqn4C7I+MqZeMVLueCawmMNn19XxLnTuaXGRjI4tmp7vOB5JkwmEtPerBE27jo0pM6lyVZzzwhjk0OkUVFjmeqxFiWgnJQIAGpK0tT3iTLxtt9WH3jJRnDrvu1QiQLuKFeQvCmrLN5Mnuhd757Whbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279517; c=relaxed/simple;
	bh=AK+zAuPGLVTshHHxJQ9ukS+vVO0L+fd7t9VqKxVRl5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gAi+qmY/sSJ3+obxikv2m7621ynsEnOb14XgcLXMSX8/vQovZGxgcmMQEQI4DSI1Tip3lyrXENyKNJbtLsdNvMwfg5baP9eQ4USjmVrkzcOVachrj0EN9so0Bd0wRcZoQU9E9W4YqM3Crvmzxc4H790ctehXUH16QCB6/8WeHd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7J+FHVx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7J+FHVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EBD1F00893;
	Wed, 20 May 2026 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779279516;
	bh=2kf7zYszowZyoQITyu7khxMNStJIj2di56LUe1+xoAA=;
	h=Date:From:To:Cc:Subject;
	b=d7J+FHVxRuLt0vCKlByL9D6s+/cXeBU2IrlNHhSPuJiNOSuBSE15X9yv8fH7/f22K
	 oBoewr+gUnd1cXtNAdHBe5WfKOQhe3kH548ZCfmbaA4E+FK2aVhBuqRIPe8cHsjeUy
	 plTi3EujGBhKkM1HFCSsI2m9cGpOjQg78dlN+R3Vf/m4PIlHdUU53/QPAkPNBvwYrg
	 7gSzRoULg1gCYdC56UaQTQyldheb0bJLRK6jp1ljSvFaD0huVmVmAeeXmv27lzvZKp
	 Yg+vy0z0dL/ks6LHRAge1fT9PIGdH3ueBNbLdD5ClRAqDijoGN+6mswasxSLlBolVB
	 1SaL8rDDDU7gQ==
Date: Wed, 20 May 2026 13:18:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Bommarito <michael.bommarito@gmail.com>
Subject: linux-next: manual merge of the thunderbolt tree with the
 thunderbolt-fixes tree
Message-ID: <ag2mmKbGy_hyoc8V@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TU5zv0tGnlDn0p18"
Content-Disposition: inline


--TU5zv0tGnlDn0p18
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the thunderbolt tree got a conflict in:

  drivers/thunderbolt/property.c

between commit:

  928abe19fbf01 ("thunderbolt: property: Cap recursion depth in __tb_proper=
ty_parse_dir()")

=66rom the thunderbolt-fixes tree and commit:

  7e6445d9d6f7d ("thunderbolt: Add tb_property_merge_dir()")

=66rom the thunderbolt tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/thunderbolt/property.c
index da2c59a17db5c,6b9666b611818..0000000000000
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@@ -39,7 -37,8 +39,8 @@@ struct tb_property_dir_entry=20
 =20
  static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
  	size_t block_len, unsigned int dir_offset, size_t dir_len,
 -	bool is_root);
 +	bool is_root, unsigned int depth);
+ static struct tb_property *tb_property_copy(const struct tb_property *pro=
perty);
 =20
  static inline void parse_dwdata(void *dst, const void *src, size_t dwords)
  {

--TU5zv0tGnlDn0p18
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNppcACgkQJNaLcl1U
h9CeDAf/ZKiDx4M+B+OVvR61yvHuaxygamWBEDqhz6hf8bCt/mqItlxhPus5dc1B
s2QOALHsE4cGDqATz27RRrz3LETAkT257oRpaQpizUl/p717eSy7kpz3YBfX8Adi
lYzyKQntgfApNBXli30m72nObvzyuai8dPvc4kWR14KDGB+JaAkhSPlAexaFp+tN
B4QbPj2CnZ1GqxPmoidKSMzS9GHeSmUT/W4QK11WKgyR91fZNwCdLwphQwFMewcF
mvbgXhIdyKofwXUmrlb6srRgkq7JY2MWJf2xM8UKLf5huTDpLOY0K7TFJLFIlVKS
1ULDWmSUrL/Av7NXovszAeMUhD0/Ww==
=C58A
-----END PGP SIGNATURE-----

--TU5zv0tGnlDn0p18--
