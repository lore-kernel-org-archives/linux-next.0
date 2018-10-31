From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in Linus' tree tree
Date: Thu, 1 Nov 2018 08:28:20 +1100
Message-ID: <20181101082820.76abf19e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/S4J=K4+oMH9+GRcnjJfR.d4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: linux-next.vger.kernel.org

--Sig_/S4J=K4+oMH9+GRcnjJfR.d4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

./usr/include/linux/v4l2-controls.h:1105: found __[us]{8,16,32,64} type wit=
hout #include <linux/types.h>

Introduced by commit

  c27bb30e7b6d ("media: v4l: Add definitions for MPEG-2 slice format and me=
tadata")

--=20
Cheers,
Stephen Rothwell

--Sig_/S4J=K4+oMH9+GRcnjJfR.d4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvaHnQACgkQAVBC80lX
0GzcKgf/aWgqqX6RVS+KzpGjxjYbjuj2PCYdkuJPnjcs4z71HaBfvuB+r0gPKbkX
QPu4MGDGvj4SETaE8EqEMTC0dJ8sO8jIW8B+HvYZGqCbP3tp4M9mF8guJiAWiVeK
IvvS0I0lGd9eI7/np71t4V4JYvwkQxcN2fGuo214ErznU8ynl18cqO8lZnd7NSes
++FhL+3ssslIeL6gc5A6QJ3EAeaJfFCpCfMD9okVDJt5oafd74ruSGcLvwnNnY9P
64Xmp/bhuF78saLlunz/1BNx3293jRBoXFIyaOPvO0isWsR31u+PioEQU+1ouG/U
YZHpKMTz2P+bCPjzOIRolnewBPH8sw==
=i9P6
-----END PGP SIGNATURE-----

--Sig_/S4J=K4+oMH9+GRcnjJfR.d4--
