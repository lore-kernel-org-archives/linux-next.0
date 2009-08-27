From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ext4 tree build warning
Date: Thu, 27 Aug 2009 17:17:04 +1000
Message-ID: <20090827171704.28109c6f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__27_Aug_2009_17_17_04_+1000_M=JmUf10Dm2+CEcS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33970 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751002AbZH0HRL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Aug 2009 03:17:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Tso <tytso@MIT.EDU>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Thu__27_Aug_2009_17_17_04_+1000_M=JmUf10Dm2+CEcS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ted,

The linux-next builds (ppc64 allyesconfig) produce this warning:
(I built with CONFIG_DEBUG_SECTION_MISMATCH=3Dy)

WARNING: fs/ext4/ext4.o(.text+0x5b6c8): Section mismatch in reference from =
the function .exit_ext4_mballoc() to the function .exit.text:.ext4_remove_d=
ebugfs_entry()
The function .exit_ext4_mballoc() references a function in an exit section.
Often the function .ext4_remove_debugfs_entry() has valid usage outside the=
 exit section
and the fix is to remove the __exit annotation of .ext4_remove_debugfs_entr=
y.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__27_Aug_2009_17_17_04_+1000_M=JmUf10Dm2+CEcS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqWMvAACgkQjjKRsyhoI8wRDQCgufm7lpAUiiH+Cs4I/6oLZWe0
L78An1f6VMrJPTvnxLUDgc+xpqp6mV8Z
=JZtM
-----END PGP SIGNATURE-----

--Signature=_Thu__27_Aug_2009_17_17_04_+1000_M=JmUf10Dm2+CEcS--
