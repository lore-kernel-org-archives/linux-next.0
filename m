From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the ia64 tree
Date: Fri, 7 Jan 2011 11:21:43 +1100
Message-ID: <20110107112143.2960451d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Jan_2011_11_21_43_+1100_SEMz5nL+hln/nI55"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53967 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753695Ab1AGAVv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Jan 2011 19:21:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__7_Jan_2011_11_21_43_+1100_SEMz5nL+hln/nI55
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tony,

After merging the ia64 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/pstore/inode.c: In function 'init_pstore_fs':
fs/pstore/inode.c:266: warning: ignoring return value of 'sysfs_create_file=
', declared with attribute warn_unused_result

This warning has been there for some time, I just didn't notice it among
all the other earnings we get :-(

Caused by commit ca01d6dd2d7a2652000307520777538740efc286 ("pstore: new
filesystem interface to platform persistent storage").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Jan_2011_11_21_43_+1100_SEMz5nL+hln/nI55
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNJlyXAAoJEDMEi1NhKgbskXIH/ieuiiNTAJZOz96I6Dy/S2cl
8Ev6ON6rcaAqlv6pVYa0bvLn/CUEwTh5laKi/XsgC7+/0Aqfx0m7Xo2OzrTYHSPA
vnOSXl4dMQ/g1UszEg42ejlp4eFqlh6ZmGQDS7cyI8UR6CMVMXVDs0G7HUJ+RM5b
AWuVv+NyGTiHdJa4eF4EaNheAnTeknN6OBTh7Qmexy8tOc/JzmuwjVtrZYDI0/Sn
4RPjfwh2fp2gdggSTibjs827iEAO3TtlAmhvoN9abzMCitFRDphKWMNboJesby66
e59+WyLOV5aqofb3guzPrrKVNe+Ta/Lf46204xbZ1sxDj2YoaZDCZtrIOa8cRZc=
=wUv8
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Jan_2011_11_21_43_+1100_SEMz5nL+hln/nI55--
