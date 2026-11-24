Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540791;
	b=eTakhy4GOvH5ihR9I8vm/LFvtPUMm5w3b9Cttr+MzWY84MlUND8Qeu9dBwFWKKYm3mXV
	 aSQZ/1C+8UeD1YM/ojqoPUxgw+BJp8rzH+Ueq7e4u2mo94sSSiWd4yy9ToMTGiagx7NWL
	 cVC/It00+uJ2GMh8b7gd0W1fpXVvRJn6r4a0SYW5llHm8PeXz9Jh9SafquuSKUW08L/A5
	 levTngldKI5hVHGOXTewuEnXNl1YJ2cDIh29n+v77J7BrtfT4MNar/nldLFfh41jw4BdD
	 EcYyLTkL8T2hmQaM9mq90SazLrk8DHFc+WS8y1dTkKFiD0EQz8RQOJWWy1JLlFZoq7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540791;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=36xsYN2ou1Io3gNicvnMEWUlnY9fY0tPyO5qdsl1DqY=;
	b=kyh6Z7nZ7U/cp706BROTnFbeWDHEtKOBwbgdWCqX//zO1sdU9UKaNGVWvl2RyOhSpoHK
	 cG1rZ6qLvuZ6Rhrb4NsHk6ol/dh8G6YXxRCwfj0swYspyvey/nSCcoLlXi6DqIZeHioEb
	 OJTIBemE2yxJdtHD34iH3sd3Swhp4Q8sO590wbKdjOrukjZ013zx51QsSZCZL1dV4Uhi0
	 zQvukMbImzYAj4IaORA9ohGZsU0iyTQFahpBLPMaaq5L6nlEC3ncTLfgC8lX+fdbfLTiJ
	 91CU543WWdbVVVQn4E0kYFW2om2AbPhNHjxMw5O2omdgnQHcZiqbg8m1pG2LmGly2vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=almdEahm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54E606A31E;
	Tue, 24 Nov 2026 17:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=almdEahm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30AAF1F000CF;
	Tue, 24 Nov 2026 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540790;
	bh=36xsYN2ou1Io3gNicvnMEWUlnY9fY0tPyO5qdsl1DqY=;
	h=Date:From:To:Cc:Subject;
	b=almdEahmTwMlxv/MyJjtJ40dxSPNFwK2mHVfUmM9pnHHDEqzOPaeorAWQKs/bm7Ew
	 BzBm7UMO997EwP0xRmC9jWdDvMbwkIndPsOsOcsSriDTTVOVD/MabP/Hlq8Rzs6HAI
	 583Hie2vqUs1T+jDgLHOPHIh+LKXAcHQjaFE8B40j9EbyP4RK4H/ZsCs6eoRoyPwMX
	 FJvm0cemceW/LmKk/uI2vFF/3wa8gyLcQQtOHwvUQBaTrQKttQoZd9jyop2u74wzzP
	 aMy4udA3IncqgLaN8D9cCRmnoe9P+GS7IbTc9jNy4jU1LxJPdeiTt2Gbwj/J92YWld
	 avxErNvUQGXcg==
Date: Tue, 24 Nov 2026 17:19:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <awXHMlpalEe2U_vC@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="suPJIMOqKSEGUNxu"
Content-Disposition: inline


--suPJIMOqKSEGUNxu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/thermal/intel/intel_hfi.c:407:38: error: too many a=
rguments to function call, expected single argument 'msr', have 2 arguments
  407 |         rdmsrq(MSR_IA32_HW_FEEDBACK_CONFIG, msr_val);
      |         ~~~~~~                              ^~~~~~~
/tmp/next/build/arch/x86/include/asm/paravirt.h:153:28: note: 'rdmsrq' decl=
ared here
  153 | static __always_inline u64 rdmsrq(u32 msr)
      |                            ^      ~~~~~~~

Caused by commit

   437ce3015e51c (thermal: intel: hfi: Disable HFI on shutdown and kexec)

=66rom the pm tree interacting with

   e7f9f17e00130 (treewide: Convert rdmsrq() from a macro to an inline func=
tion)

I have applied Sasha's fix below.

=46rom eed7d9a619595e153de4f0faca0ff0186b8a4c1b Mon Sep 17 00:00:00 2001
=46rom: Sasha Levin <sashal@kernel.org>
Date: Tue, 24 Nov 2026 09:56:46 -0500
Subject: [PATCH] linux-next: semantic conflict between the pm and tip trees

Hi Mark,

The current pm tree has a semantic conflict with the tip tree that
breaks the x86 build:

  drivers/thermal/intel/intel_hfi.c:407:38: error: too many arguments to fu=
nction call, expected single argument 'msr', have 2 arguments

437ce3015e51 ("thermal: intel: hfi: Disable HFI on shutdown and kexec")
in the pm tree uses rdmsrq(MSR_IA32_HW_FEEDBACK_CONFIG, msr_val), and
e7f9f17e0013 ("treewide: Convert rdmsrq() from a macro to an inline
function") in the tip tree makes rdmsrq() take only the MSR and return
the value.

The fix for the merge:
---
 drivers/thermal/intel/intel_hfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/intel/intel_hfi.c b/drivers/thermal/intel/inte=
l_hfi.c
index e7657d2c4298f..b70f6f7263c5d 100644
--- a/drivers/thermal/intel/intel_hfi.c
+++ b/drivers/thermal/intel/intel_hfi.c
@@ -404,7 +404,7 @@ static bool hfi_disable_if_enabled(void)
 {
 	u64 msr_val;
=20
-	rdmsrq(MSR_IA32_HW_FEEDBACK_CONFIG, msr_val);
+	msr_val =3D rdmsrq(MSR_IA32_HW_FEEDBACK_CONFIG);
 	if (!(msr_val & HW_FEEDBACK_CONFIG_HFI_ENABLE_BIT))
 		return false;
=20
--=20
2.47.3


--suPJIMOqKSEGUNxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFxzEACgkQJNaLcl1U
h9AyyQf/UQ6/7XKc4ezbj2vKeRJzc0vF3pqfLj7Y+PsOsUmgWxU6l6euvwOv2YSd
9gKlo8YBGVaN9KfMQM0dHx3GdgD7x6JnGBOMv2FBZ7i8atdwKsHvXsXVd0l4sdlq
LnfXAWLLtYdDfG3DVmPEttUkQcOSstwsb+v3nED4tWqBU21k2LtsfnH6AnrpDqVP
0jAeTPGlTIymYAO+4jfM42pDvoZ+gqPlm9GxCM7HtbYV/6uobJrQk9xtgH/Bxzwt
+C78PeP7lCiFIN4XV6Bv7feoMIXIT1jnQEqdSzEPv18f62PZBnasNFdNYP3fgv4r
QP/ebtujjBnWD1pOdsbxYLJ0UsOqzw==
=i7f3
-----END PGP SIGNATURE-----

--suPJIMOqKSEGUNxu--
