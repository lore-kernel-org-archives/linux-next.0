From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the vfs-fixes tree
Date: Mon, 14 Jan 2019 11:02:04 +1100
Message-ID: <20190114110204.5eb36d04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/W6+sWcrA0soaaHA4VprP2Yu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/W6+sWcrA0soaaHA4VprP2Yu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  kernel/cgroup/cgroup-v1.c

between commit:

  61aa329d0762 ("cgroup: saner refcounting for cgroup_root")

from the vfs-fixes tree and commit:

  b3678086951a ("kernfs, sysfs, cgroup, intel_rdt: Support fs_context")

from the vfs tree.

I couldn't figure out how to fix this up, so I effectively reverted the
vfs-fixes tree change.  Al, can you either do the merge yourself, or
provide me with a merge fix, please.

--=20
Cheers,
Stephen Rothwell

--Sig_/W6+sWcrA0soaaHA4VprP2Yu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw70XwACgkQAVBC80lX
0GwN0gf+PcBzCF9K67oo/h5dYw6yytrsora6pT1yG21VSjjeWpcqi6sB9Kw/4794
HX7pxQB1wTzA52kvcD0keKZoCDdOIY+9p9dfOuCp9QFsVNZCpZgQgTNQGP2fY9rS
LCRhoazNga+ml9vVRR00OMZiXMnN+1h1VIlKtRoee6DTHXuCKQiA9kRmQqGgQrEu
qUUevFAjgZOVkc6CWF5+02n8pCAKTgZakgdSgVRpvxj3HDf69cV4xOMVo+kTZkip
O/czAgkUD+TK680ErGr2+4OX+sQb99Wwz1q+lfrNpKL18RbjcBgVL4vRbPUanaYN
dO10Zva+jc5Vw7+Uc76zSda8nZxy0g==
=TMps
-----END PGP SIGNATURE-----

--Sig_/W6+sWcrA0soaaHA4VprP2Yu--
