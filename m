From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the tip tree with the  tree
Date: Tue, 11 Mar 2014 19:03:46 +0000
Message-ID: <20140311190346.89aa11208f24e6abd10721b1@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__11_Mar_2014_19_03_46_+0000_R8J9bvw_pDkCuhU2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:49500 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751718AbaCKTEV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Mar 2014 15:04:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__11_Mar_2014_19_03_46_+0000_R8J9bvw_pDkCuhU2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in drivers/video/fb=
dev/sgivwfb.c between commit 844901baede6b5 ("video: move fbdev to drivers/=
video/fbdev") from the omap2_dss tree and commit c5f9ee3d665a76 ("x86, plat=
forms: Remove SGI Visual Workstation") from the tip tree.

I fixed it up by deleting the offending driver and can carry the fix as nec=
essary (no action is required).

--Signature=_Tue__11_Mar_2014_19_03_46_+0000_R8J9bvw_pDkCuhU2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTH14SAAoJELSic+t+oim9XQMP/08uTuRXvpg1+DdE95wTTVdt
ZSkMupGWhkpsQbFXXjUtrMUlfCUzDAorZj16quSVvb3zE55kas7s4sLFC4NaT0mR
ayQI8hapteG842AZaJeiph6WAc9i5zu8juhqHwYzDwpt44PsJcwCDeMdLJbWsEiU
YKQjmSoJWSgIXG9j3Wu6+yTAf8mlPE8JTLIENRRZfP+b4kG/Cxpnsx/9M7T8rSU7
PrFSauT+2kA9dbEKMvzl/bD9UnRenjalcE7nE5aE7lZEGpXoVx7O79A32c2NsFa+
xqlG/EM8Ek3dxkPt38uuoHTpHg5YJTDdMavK0CdwL4HiXcxRBx4PBKLfHufV2D8k
3YoOxNWxxLGyg914kZvI00FsfMEUnCZyf34hoKG4kcMIXkkLYoPrCWTC8dluB6ah
HxiVorB0B+ARM1YrIlEeSdFBYlXWiynhg8zZH2/5jA5dnYMeg6XRSpLPRIlgc/vM
qU9SHhq694MvjQ13akZGdAjDUFTTDrOSXgKAOa/EmMI5R0eAjsq0rnpOna06jcto
gYbbJkwik9zvCj41+1IZgsoHfFQLsAoBj4Jjb60dd8uVLa2jBDjnAJ1wLSbtfLDF
/ns51zhlCQ763KSXhZ82XIUk6GgYmauA4bMzoEdVC2QHzOXPWulfRCy7UVzbjJbv
acMPRv6SXSL+pgDHXsU1
=5pzu
-----END PGP SIGNATURE-----

--Signature=_Tue__11_Mar_2014_19_03_46_+0000_R8J9bvw_pDkCuhU2--
