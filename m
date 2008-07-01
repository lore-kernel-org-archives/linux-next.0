From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 20:59:55 +1000
Message-ID: <20080701205955.a78a979b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_20_59_55_+1000_Tuu6kE2ooAl3lZ8+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45356 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752156AbYGALAF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 07:00:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, Adrian Bunk <bunk@kernel.org>

--Signature=_Tue__1_Jul_2008_20_59_55_+1000_Tuu6kE2ooAl3lZ8+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/serial/cpm_uart/cpm_uart_core.c between commit
0b2a2e5b7747f1f63bd86ca22b5c6097da5b2137 ("cpm_uart: Remove
!CONFIG_PPC_CPM_NEW_BINDING code") from the powerpc tree and commit
33e211d606d46d18befa6fe6aec76aa7971eefa8 ("03-serial_vcs") from the
ttydev tree.

The former removes some of the code modified by the latter.  It is a
simple fixup and I can carry it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_20_59_55_+1000_Tuu6kE2ooAl3lZ8+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqDisACgkQjjKRsyhoI8wqLACgqvmPHKx0n+W5MyMLgy7papx+
2JoAoLIj1ndkNiiNQW+I2jvIfWw1eT+0
=OlYI
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_20_59_55_+1000_Tuu6kE2ooAl3lZ8+--
