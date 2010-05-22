From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the final tree (Linus'
 tree related)
Date: Sat, 22 May 2010 16:46:44 +1000
Message-ID: <20100522164644.43846a3c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__22_May_2010_16_46_44_+1000_qgPFtsa5BvC/U5c="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55037 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751891Ab0EVGqv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 22 May 2010 02:46:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>

--Signature=_Sat__22_May_2010_16_46_44_+1000_qgPFtsa5BvC/U5c=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the final tree, today's linux-next build (powerpc
allnoconfig) produced this warning:

lib/kobject_uevent.c:86: warning: 'kobj_bcast_filter' defined but not used

Introduced by commit 5f71a29629b4717445f8b7f5fb8f50c2d262b68e ("kobj:
Send hotplug events in the proper namespace") from Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__22_May_2010_16_46_44_+1000_qgPFtsa5BvC/U5c=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv3fdUACgkQjjKRsyhoI8xj7QCfZigek4B/szE0Y4T3PMr215/5
s0UAoJ/HumyexuFeAWpoNlEB/c60YqRU
=LZLs
-----END PGP SIGNATURE-----

--Signature=_Sat__22_May_2010_16_46_44_+1000_qgPFtsa5BvC/U5c=--
