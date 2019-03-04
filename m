From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Mon, 4 Mar 2019 13:50:34 +1100
Message-ID: <20190304135034.79b90d37@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WfOBf/gbWqGR=ZAJW2p.JX9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ben Gardon <bgardon@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/WfOBf/gbWqGR=ZAJW2p.JX9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  virt/kvm/kvm_main.c

between commit:

  8ed0579c12b2 ("kvm: properly check debugfs dentry before using it")

from Linus' tree and commit:

  b12ce36a43f2 ("kvm: Add memcg accounting to KVM allocations")

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc virt/kvm/kvm_main.c
index d237d3350a99,0fb0e9aa0935..000000000000
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@@ -4044,8 -4049,8 +4049,8 @@@ static void kvm_uevent_notify_change(un
  	}
  	add_uevent_var(env, "PID=3D%d", kvm->userspace_pid);
 =20
 -	if (kvm->debugfs_dentry) {
 +	if (!IS_ERR_OR_NULL(kvm->debugfs_dentry)) {
- 		char *tmp, *p =3D kmalloc(PATH_MAX, GFP_KERNEL);
+ 		char *tmp, *p =3D kmalloc(PATH_MAX, GFP_KERNEL_ACCOUNT);
 =20
  		if (p) {
  			tmp =3D dentry_path_raw(kvm->debugfs_dentry, p, PATH_MAX);

--Sig_/WfOBf/gbWqGR=ZAJW2p.JX9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx8knoACgkQAVBC80lX
0Gy0ZggAmznncpwSwuDUKj1gBbbtRklv1vzWT1RBYegD3e98gZEqjgFVHqHDGrCp
ZmLUanMdKEmtBChJ7c0nWnTwKZgmmZ9Bo9q1PLda9F7b6uomqydckx5eoFB0FrPI
fVMe/3ozdbbyQHasbP5xLKJlRQ3DaZX+HW6SWQ34iPX2L9YpJJ3BCBUIDP8alMAK
1s9esQDG8k7Fi0xjec+W7JXR2b4HlY3O2RxFnQmy/ybNLKiwOI9KOg+Hu7eyNkd7
aMOVxVfW247/ABL8Pj1JRM7Z9ms+iVD4iM72EQaMYVbKmCGBDVHfNMkeWBpvivrX
VwUYI5xwbGt9SQlQkZzdihBwkGEGQg==
=k5ru
-----END PGP SIGNATURE-----

--Sig_/WfOBf/gbWqGR=ZAJW2p.JX9--
