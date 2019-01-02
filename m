From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Wed, 2 Jan 2019 12:18:41 +1100
Message-ID: <20190102121841.3d792549@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/R/y4_dkLueN0Lg+3Gk8wlEh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/R/y4_dkLueN0Lg+3Gk8wlEh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got conflicts in:

  kernel/cgroup/cgroup.c

between commit:

  e250d91d6575 ("cgroup: fix parsing empty mount option string")

from Linus' tree and commit:

  b3678086951a ("kernfs, sysfs, cgroup, intel_rdt: Support fs_context")

from the vfs tree.

I fixed it up (I just used the vfs version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/R/y4_dkLueN0Lg+3Gk8wlEh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwsEXEACgkQAVBC80lX
0GyL3wf/bJDNKj6NlcAKzv628k0O49J4jvme5E9XX6KSC2QkYyEvHb7EPSGGMYIp
YOBfeoMq4ya0I1a7iCRX4Y+o/MMK9q+KAR3qsZ5nbTBV7UdpCQjBKEy+N5dItjEI
NFPUQhXAiJDAO4z0Ppy4Fv1YzG+fQNptXWm7utnwJ7ed9Lpb8aQpCJ5TZKfEKd9H
eW2xLeQNSGhYrGK1MTrz83sDkRqQI+agJzOqtaeDF+8DaKMv8PKz1ZktHChAvG71
4QA7osVQUWEruQcbjHw0vvtdTcRrFl/X8ZzFTe3fAFUA9wh8KpMLLueXdC/AZ+iO
ffdl7+Riz31IMplPbXV2hD50JvNIWg==
=+XpJ
-----END PGP SIGNATURE-----

--Sig_/R/y4_dkLueN0Lg+3Gk8wlEh--
