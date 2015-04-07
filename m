From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tile
 tree
Date: Tue, 7 Apr 2015 21:09:29 +1000
Message-ID: <20150407210929.471691b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_rH7RSjJB5hRM/1isZyhJcq"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35396 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751765AbbDGLJg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2015 07:09:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Metcalf <cmetcalf@ezchip.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ulrich Obergfell <uobergfe@redhat.com>, Don Zickus <dzickus@redhat.com>

--Sig_/_rH7RSjJB5hRM/1isZyhJcq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
kernel/sysctl.c between commit e164ade07b21 ("watchdog: add
watchdog_exclude sysctl to assist nohz") from the tile tree and commit
866d62a433cc ("watchdog: enable the new user interface of the watchdog
mechanism") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/sysctl.c
index 431601ad393a,076473547fe5..000000000000
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@@ -861,13 -858,28 +859,35 @@@ static struct ctl_table kern_table[] =3D=20
  		.extra2		=3D &sixty,
  	},
  	{
 +		.procname	=3D "watchdog_exclude",
 +		.data		=3D &watchdog_exclude_mask_bits,
 +		.maxlen		=3D NR_CPUS,
 +		.mode		=3D 0644,
 +		.proc_handler	=3D proc_dowatchdog_exclude,
 +	},
 +	{
+ 		.procname       =3D "nmi_watchdog",
+ 		.data           =3D &nmi_watchdog_enabled,
+ 		.maxlen         =3D sizeof (int),
+ 		.mode           =3D 0644,
+ 		.proc_handler   =3D proc_nmi_watchdog,
+ 		.extra1		=3D &zero,
+ #if defined(CONFIG_HAVE_NMI_WATCHDOG) || defined(CONFIG_HARDLOCKUP_DETECT=
OR)
+ 		.extra2		=3D &one,
+ #else
+ 		.extra2		=3D &zero,
+ #endif
+ 	},
+ 	{
+ 		.procname       =3D "soft_watchdog",
+ 		.data           =3D &soft_watchdog_enabled,
+ 		.maxlen         =3D sizeof (int),
+ 		.mode           =3D 0644,
+ 		.proc_handler   =3D proc_soft_watchdog,
+ 		.extra1		=3D &zero,
+ 		.extra2		=3D &one,
+ 	},
+ 	{
  		.procname	=3D "softlockup_panic",
  		.data		=3D &softlockup_panic,
  		.maxlen		=3D sizeof(int),

--Sig_/_rH7RSjJB5hRM/1isZyhJcq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI7ruAAoJEMDTa8Ir7ZwVeBQP/Aww3mDHOiag3R8MeJ//ElCa
etbnZk4G5B+ESyaYR29ZQZZqUD6mF5DdHEjot2luOsmIZiYsVu6hztYunWknKSSR
cPB67jj1/EnBSATiBy5jD9LUv0meZPVPVzVBiAHWQozvw8zajzXAk5QAgCwunoYN
PyWAZ03ootudEpTax1O6RgTACL+3mWz6Pgm7pll/aqWqnm3imVbeMQHI0cWwX+d7
Try1SMV740j9wibucpaK8oQzWV8qHUeCtb7Ms3ZJJtSdiTAABL4QgCpMQqWIrV+j
05XI+jMhGHYxNdnY2cfkH5dGyxo+EcypLpEAlWN0/ri0c/fVJyzJfourPfX6oWBm
KVk1ms+DgTtpBEjRGRdlfjTqh68XMliWS88MIebhQ4Rx4DgECH/M7dyHSfBD6du6
g6oDos6jVs5fsQVzx/Alj2b/3iBiZwglyGMtYiYE1YlbbiNk9dJy8/ScECJ5/YjH
jYe1/Zd2savKU0vsK1W2feLaMWdRdin2rt+NXmsmBVYIh/MGU0qxm018kTQN28w+
JEaLfK+SropSHNpez9+7rI0sN9D4oT1A/PKcB6HqCwBB0kFZQ1YfUce6KSEF3QME
1fdOslSBdfRXELv3sRQhWB/KL5WZkti4+UEYcMhm5bj9fCOUJAFjnqHBIgqzXIJM
ND/Tl7ESd0xwU6dWkg7I
=hVdL
-----END PGP SIGNATURE-----

--Sig_/_rH7RSjJB5hRM/1isZyhJcq--
