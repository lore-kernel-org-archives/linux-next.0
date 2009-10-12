From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unable to fetch dlm tree
Date: Tue, 13 Oct 2009 10:04:23 +1100
Message-ID: <20091013100423.6afbb070.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__13_Oct_2009_10_04_23_+1100_l5eBvhdEQdZPBmOO"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933524AbZJLXFI@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Teigland <teigland@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__13_Oct_2009_10_04_23_+1100_l5eBvhdEQdZPBmOO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Fetching the dlm tree for today's linux-next gives me

fatal: Couldn't find remote ref refs/heads/next

and, indeed, "git ls-remote" shows no "next" branch.

I will use the dlm tree from yesterday.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__13_Oct_2009_10_04_23_+1100_l5eBvhdEQdZPBmOO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrTtfcACgkQjjKRsyhoI8zTEACgnaZ5oHibSCB7boZYrTKrpWJn
0JsAoIsia5sf1814zLzUH/ckZvURDnWc
=k4Ei
-----END PGP SIGNATURE-----

--Signature=_Tue__13_Oct_2009_10_04_23_+1100_l5eBvhdEQdZPBmOO--
