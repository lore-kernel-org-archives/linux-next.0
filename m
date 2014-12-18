From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the modules tree
Date: Thu, 18 Dec 2014 13:05:53 +1100
Message-ID: <20141218130553.5c134d80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6C+zPfjC/QOrZAqIAs28+ZZ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35052 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751252AbaLRCGB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2014 21:06:01 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>

--Sig_/6C+zPfjC/QOrZAqIAs28+ZZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the modules tree, today's linux-next build (powerpc ppc64_def=
config)
failed like this:

kernel/params.c: In function 'add_sysfs_param':
kernel/params.c:649:9: error: 'struct module_kobject' has no member named '=
kp'
  if ((mk->kp->perm & (S_IWUSR | S_IWGRP | S_IWOTH)) !=3D 0)
         ^

Caused by commit 12491941a26c ("param: do not set store func without write =
perm").

I have used the modules tree from next-20141217 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/6C+zPfjC/QOrZAqIAs28+ZZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUkjaGAAoJEMDTa8Ir7ZwVNCAQAIiTpkk0vVCV8FHqXSFQovO3
Qd4eg/aOVrw3Fqf2+bhTF8WqHS198ITHUReLq2pu7PF4wH5/33ARrxWxxkI6oyRQ
8U8EmB3KJ8DGFVZ8deA/hsYEfQo/Vd9O5ot4Of3zTg6PzrfUhSbc/XLZyM0uylK6
Qjbryk8fpZhNRQStK387wuxdXqj+iWlqqfpOhITteGLndT3LiwplFLeqRTkdAr2Y
iKN5lmEtQtkK6TpNhkgz4TzvsmIWLitAT7iYNowDFGJHcW9LpQxuhuNsMLFvFC7Z
TIMy+4WyRHu1NfRjkzGrkZxt3U+2f1SZqRnFCaZQnw8s8ypUwSQL/RCV+go+Efkj
t9dWPbj5C0aDaejxVP3CBMEndUR86tjVLC/BiO8MNe6bKj/IHxVTm2Jjpql70Q86
zTefoNOgledUzdCZ4dGugMy7oNJW4gvWtHSnT4cl/yBDElftYmPQZw+M112mUq3A
EnLMMgGwUskjne/VnmirX4f+Iv6okbwQycMp8n6yZpAkTAjdbRUtDIWdvAOUNxFV
VsVa1c6yTxQf1RfDe8bkDx2A1AFvHemF4mvxBpmgK1h5dTxp1WJuJrc4EMYZHqKW
AyIpfstcQg9W0AhMV0RrRn+muli3YDRN3ru38fZISCRhWmQ2Nh31nFeTV1RkXTrM
yl5Q29l2OtTPTjRKPYeQ
=aFN9
-----END PGP SIGNATURE-----

--Sig_/6C+zPfjC/QOrZAqIAs28+ZZ--
