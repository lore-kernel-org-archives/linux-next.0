Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215533783D8;
	Fri, 10 Jul 2026 12:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685502; cv=none; b=krvcpSJK56OZIFp7xWKl+i5K7WjMgpeLOhxHV7BVCS2YSM54wP9Cpl8qTuxmRvOPxZXUtiyKdQvVoiWBiT6/D2PPBu2tcHKiXODqlyQ2JA4JsJUkeikXMd0UaCM4bFiXcnlfJv1KxR9ZVOKNOXfrPBNL/7m5PXE5BxM9EMJy3G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685502; c=relaxed/simple;
	bh=98nspmCdco4KEj+9xi6ZhVwcI8w6pUAh2dTxQn49r6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cSU7QxKD9gC5Etx27XQcsMrVE/FIs4FmKfbYcnuJmIWI4Amiu5F9qgVZ+yIrJtxor+2ZZSIyoLAnTsRgL5Z51f/jiBYR9152DKDRxaWiNdC1D4XOAWgZntvAcaMNIB1iiWCtOjIL0GAD2sRyMn2FN6UjtqD5bPQXwl/PAGYfN50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBXrAoJO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBXrAoJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E881F000E9;
	Fri, 10 Jul 2026 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783685500;
	bh=kn7H4g2tNaZPLX6ioKkOx4AtSf9ua3uqUStd5IiHdqI=;
	h=Date:From:To:Cc:Subject;
	b=iBXrAoJOOyVOOkNI7RJizrdbvlQ4ciEDv+ozGhKCwnYd6eBB2T7vTZDu3K5nabJzi
	 mpK7XHwJnWq5w0EiCnsGwvWm9tGZCCGJoIFwnlC3K8e68FJXmdC2jvgPfqWtce7ZRz
	 cH5W7C+3IO2neTfRpWH8T8PMi1GgIPrbHApnBmYR0UR8IMI5RU8pdWdoUpPKw+TKss
	 SqbyY3vSpwqsgdQnzsbLhf8yUuQF0c9Md2V0Zz8TSb7LX731pXW2u1xofKElSA1Cc6
	 6IKkVZiCKNsQyYd+oCitlkD4iLvbmSCNR1Bk6pXJargsQVQ0CCS5KVIsvxwPz9QDFa
	 /0mMunMOeEfZg==
Date: Fri, 10 Jul 2026 13:11:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	David Francis <David.Francis@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <alDheI4V_zDaAUL-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sEC/SRmYGkpXiaIW"
Content-Disposition: inline


--sEC/SRmYGkpXiaIW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
  drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c

between commits:

  8a93f77aec655 ("drm/amdkfd: Don't acquire buffers during CRIU queue resto=
re.")
  47ea05f246beb ("drm/amdkfd: Check bounds on CRIU restore queue type and m=
qd size")

=66rom the drm-fixes tree and commits:

  f19d8086f6644 ("drm/amdkfd: Check bounds on CRIU restore queue type and m=
qd size")
  1cafa8b29e029 ("drm/amdkfd: Don't acquire buffers during CRIU queue resto=
re.")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 641b8ada82a03,c9f9f7a871117..0000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@@ -333,6 -333,8 +333,8 @@@ int debug_refresh_runlist(struct device
  bool kfd_dqm_is_queue_in_process(struct device_queue_manager *dqm,
  				 struct qcm_process_device *qpd,
  				 int doorbell_off, u32 *queue_format);
+ int kfd_reset_queue_mes(struct device_queue_manager *dqm, int queue_type,
+ 			int pipe, int queue, unsigned int db);
  size_t mqd_size_from_queue_type(struct device_queue_manager *dqm,
  				enum kfd_queue_type type);
 =20
diff --combined drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 9ccbc6e5b27b3,97e77a5a35e51..0000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@@ -1055,7 -1055,7 +1055,7 @@@ int kfd_criu_restore_queue(struct kfd_p
  	ctl_stack =3D mqd + q_data->mqd_size;
 =20
  	memset(&qp, 0, sizeof(qp));
- 	set_queue_properties_from_criu(&qp, q_data, NUM_XCC(pdd->dev->adev->gfx.=
xcc_mask));
+ 	set_queue_properties_from_criu(&qp, q_data, NUM_XCC(pdd->dev->xcc_mask));
 =20
  	print_queue_properties(&qp);
 =20

--sEC/SRmYGkpXiaIW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpQ4XgACgkQJNaLcl1U
h9B+egf9F4F3DwZeCRXjIMuhEIldDjN2qYdWEWL3Ho7h4ChbYKg1/KCfcyLMYAvB
G5Q5IxVESdIUjMQS9xKNmAo/Jaq9k2cfWdT4ohz7tyanTtfmU7vehJ/qluy95pjG
Ws9p7FCrY1sbtowqVBtiOMEOdwvF/dC0pr6vDcWl5QndXPpIsekGKRCkAu38Zu02
b6Dy88abhTEXY4+i5Q6n4guRSUUATlb0ZQJ/HhcQ8Qn1RZ4VdlpYUSOD3twboLJy
QLOAX28CDhGWH11qtCA40/dgCXzAIESW4PQTMUxXxYMgIKdp4m+rDtThG7TQbC8H
keTti2P9Yuw/O3vu6kqbT1VwQYFqlg==
=qNJp
-----END PGP SIGNATURE-----

--sEC/SRmYGkpXiaIW--
