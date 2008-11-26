From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ocfs2 tree build failure
Date: Wed, 26 Nov 2008 16:30:28 +1100
Message-ID: <20081126163028.d7c1fa2d.sfr@canb.auug.org.au>
References: <20081125164204.6817a397.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__26_Nov_2008_16_30_28_+1100_LCPMzMgzc60H999+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57753 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752284AbYKZFas (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 00:30:48 -0500
In-Reply-To: <20081125164204.6817a397.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Fasheh <mfasheh@suse.com>
Cc: linux-next@vger.kernel.org, Jan Kara <jack@suse.cz>

--Signature=_Wed__26_Nov_2008_16_30_28_+1100_LCPMzMgzc60H999+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, 25 Nov 2008 16:42:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> usr/include/linux/dqblk_v2.h:8: included file 'linux/dqblk_qtree.h' is no=
t exported
> make[4]: *** [/scratch/sfr/x86_64_allmodconfig/usr/include/linux/.check] =
Error 1
>=20
> Caused by commit 603f68d0c2b66052093ea29bf1ff7a8a58667af6 ("quota: Split
> off quota tree handling into a separate file").  dqblk_qtree.h needs to
> be added to the Kbuild file.

Still fails, so I have dropped the ocfs2 tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__26_Nov_2008_16_30_28_+1100_LCPMzMgzc60H999+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkks3vQACgkQjjKRsyhoI8wZ/ACgqsbqOIGdPUSSCJmk69XgeQ/U
K7gAnjNS0C+vhvIfLFDswLVdazFHFRDx
=wNR1
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Nov_2008_16_30_28_+1100_LCPMzMgzc60H999+--
