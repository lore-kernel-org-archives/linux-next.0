From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the namespace tree
Date: Wed, 11 May 2011 14:09:00 +1000
Message-ID: <20110511140900.bbafb560.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_May_2011_14_09_00_+1000_YPXj=fzsQ8_WS7hb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__11_May_2011_14_09_00_+1000_YPXj=fzsQ8_WS7hb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

After merging the namespace tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from arch/powerpc/platforms/cell/spu_callbacks.c:49:
arch/powerpc/include/asm/systbl.h:356: error: 'sys_setns' undeclared here (=
not in a function)

Caused by commit e975ee91dcc1 ("ns: Wire up the setns system call").
sys_setns should be declared in include/linux/syscalls.h.

I have dropped the namespace tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_May_2011_14_09_00_+1000_YPXj=fzsQ8_WS7hb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNygvcAAoJEDMEi1NhKgbs+MYH/1dQLIMzkgd6/8+0kXfcwb83
zCL2TuQMQvN70HyiQ2a9SWdx0t4fbvVkYKgdVnkGOQ2wCvnfC85mh0sNzKMIezZh
4vY2qcHZY7SLCcEtckfFtMhxMuKbiNm/Jw8287akwoGsd5JZUqcyfd+eLcJOPK1E
OW3vzkNcgrMp3+nldZ1iLJ0WG77mEltMQPlIXn1aiAqBXIG8t9pNpQQ+Us8FjTFL
KEW1K2enDFuNCTGqE3DFkli5ltDJFPijwJCbf8bkloM9FcpYKox0PtWFt5KkJCGX
9Pjgkrh/CubFlwhJv8E+tp9U875m1jVlC7LheDipmNZEB4m0hITNBMTIiqXgl6Y=
=FqXF
-----END PGP SIGNATURE-----

--Signature=_Wed__11_May_2011_14_09_00_+1000_YPXj=fzsQ8_WS7hb--
