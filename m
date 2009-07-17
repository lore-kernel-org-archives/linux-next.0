From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Fri, 17 Jul 2009 13:12:53 +1000
Message-ID: <20090717131253.af92ee00.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__17_Jul_2009_13_12_53_+1000_+w./23S1./seFWim"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38084 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757600AbZGQDM7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2009 23:12:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__17_Jul_2009_13_12_53_+1000_+w./23S1./seFWim
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/serial/icom.c: In function 'check_modem_status':
drivers/serial/icom.c:697: error: 'struct uart_state' has no member named '=
delta_msr_wait'

Caused by commit d663043b15626a1917587386da503e7943e434f6
("serial-kill-info").

So again I have used the ttydev tree from next-20090713.  Not having much
luck :-(
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__17_Jul_2009_13_12_53_+1000_+w./23S1./seFWim
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpf7DUACgkQjjKRsyhoI8xKegCdEWJ+uZ5j6k05L5RrhwMR8cBa
iVoAn20A/LIGn5b5QGX29+qvItuAAK9J
=tdMf
-----END PGP SIGNATURE-----

--Signature=_Fri__17_Jul_2009_13_12_53_+1000_+w./23S1./seFWim--
