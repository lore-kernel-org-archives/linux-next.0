From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build warning
Date: Mon, 30 Nov 2009 16:40:15 +1100
Message-ID: <20091130164015.9bb8f6a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Nov_2009_16_40_15_+1100_QCtDKLFe6TTpg+lE"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751249AbZK3FkP@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei Pelinescu-Onciul <andrei@iptel.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__30_Nov_2009_16_40_15_+1100_QCtDKLFe6TTpg+lE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

net/sctp/socket.c: In function 'sctp_setsockopt_autoclose':
net/sctp/socket.c:2091: warning: large integer implicitly truncated to unsi=
gned type

Introduced by commit f6778aab6ccc4b510b4dcfa770d9949b696b4545 ("sctp:
limit maximum autoclose setsockopt value") from the net tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Nov_2009_16_40_15_+1100_QCtDKLFe6TTpg+lE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksTWr8ACgkQjjKRsyhoI8z55QCfS8ZAEgpCf9dks2s8jlL8t1Em
AJsAn1zI6z6HCmvqYrngotjJOmCaSyA/
=LzlK
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Nov_2009_16_40_15_+1100_QCtDKLFe6TTpg+lE--
