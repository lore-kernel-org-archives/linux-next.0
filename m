From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in Linus' tree
Date: Tue, 19 Feb 2019 07:33:45 +1100
Message-ID: <20190219073345.11c39f70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GrZ9A5Fh=N39xhpfbTOTBXT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

--Sig_/GrZ9A5Fh=N39xhpfbTOTBXT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Just a note for some future improvement]

In commit

  2c4f1fcbef0b ("kprobe: Do not use uaccess functions to access kernel memo=
ry that can fault")

Fixes tag

  Fixes: 9da3f2b7405 ("x86/fault: BUG() when uaccess helpers fault on kerne=
l addresses")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/GrZ9A5Fh=N39xhpfbTOTBXT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxrFqkACgkQAVBC80lX
0GytoggAmdtCOewmkX4T/+YLuM3ht7rrRxO8ZXYdA2klMVBHRvFklwcSVlcNsLrz
wK0o4tlhQqNWNlaAnhWeCiqjW1p0igykRDW9nqwwl/jL85x1TY2hY8ivXaWrBOZ+
ue9N5gZEE1vmQUXSjkzY+J8OFqnAwEBDRl9vxVRpIYrWRWmg9GaTi+4D7hDvYJQD
x9rZu45Nb+CL1DU5AaLhq65OipPqP1f6imuzB9gPD54OZCFBXW4KijU42IJemXiV
Pp1jDkyNvMsXifJkQrla4RmAsuAtM4SE/2WurCKWNMVrJC4Kg2FrqYMfgsLXOYIr
q0xdHukZqo907nQV8pzqduLL49y7LQ==
=daug
-----END PGP SIGNATURE-----

--Sig_/GrZ9A5Fh=N39xhpfbTOTBXT--
