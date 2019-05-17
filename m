From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Fri, 17 May 2019 11:04:47 +1000
Message-ID: <20190517110447.34e65beb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GkhwStloeVvNpPg8oh+2H7f"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/GkhwStloeVvNpPg8oh+2H7f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  Documentation/virtual/kvm/api.txt

between commit:

  dbcdae185a70 ("Documentation: kvm: fix dirty log ioctl arch lists")

from Linus' tree and commit:

  d7547c55cbe7 ("KVM: Introduce KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2")

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

diff --cc Documentation/virtual/kvm/api.txt
index 64b38dfcc243,73a501eb9291..000000000000
--- a/Documentation/virtual/kvm/api.txt
+++ b/Documentation/virtual/kvm/api.txt
@@@ -3809,8 -3936,8 +3936,8 @@@ to I/O ports
 =20
  4.117 KVM_CLEAR_DIRTY_LOG (vm ioctl)
 =20
- Capability: KVM_CAP_MANUAL_DIRTY_LOG_PROTECT
+ Capability: KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2
 -Architectures: x86
 +Architectures: x86, arm, arm64, mips
  Type: vm ioctl
  Parameters: struct kvm_dirty_log (in)
  Returns: 0 on success, -1 on error
@@@ -4798,9 -4968,9 +4968,9 @@@ and injected exceptions
  * For the new DR6 bits, note that bit 16 is set iff the #DB exception
    will clear DR6.RTM.
 =20
- 7.18 KVM_CAP_MANUAL_DIRTY_LOG_PROTECT
+ 7.18 KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2
 =20
 -Architectures: all
 +Architectures: x86, arm, arm64, mips
  Parameters: args[0] whether feature should be enabled or not
 =20
  With this capability enabled, KVM_GET_DIRTY_LOG will not automatically

--Sig_/GkhwStloeVvNpPg8oh+2H7f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzeCK8ACgkQAVBC80lX
0Gweegf/cRv0YebzAmqhtNeCTu4uNeuma3G+ITfHVHUGsEZ8zQxGInYyu1GPxfB4
A219pIl1/hwzZ0LAnGi0h9QDSudZUlIsvQ49DY5Cw2Gojf4WnbfwZgQY3Pa6ii0M
PR0hQicg9KeeHIDwu/Y+qiczAB36jA8XxlPr+FqJ10YtrdYn3iM67Em/CWwat2Dh
cwZCdBUVoG1HPTDaxv7DTyRjHnCdDG7sR0Y+W+2XHeLK1mMeC/IuTZKLfgaOi4cO
1jZSL14SIkqyUibpbIa2A3WVXVX0mGItW/YWQLC8bHD/86XgID5KfYNnv1sDQxE6
wcydxA+pQ1K1PGlw1ZrmW2J1xf/oVQ==
=n3xT
-----END PGP SIGNATURE-----

--Sig_/GkhwStloeVvNpPg8oh+2H7f--
