From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Mon, 17 Dec 2018 16:22:28 +1100
Message-ID: <20181217162228.3c30feec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OyfY+_NdlGcil7qPBSyO+8H"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Christopherson <sean.j.christopherson@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/OyfY+_NdlGcil7qPBSyO+8H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/vmx.c

between commit:

  a97673a1c43d ("x86: Fix various typos in comments")

from the tip tree and commit:

  a821bab2d1ee ("KVM: VMX: Move VMX specific files to a "vmx" subdirectory")

from the kvm tree.

I fixed it up (I removed the file and then made the same changes to
the file in its new position (one change was already fixed)) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b8fa74ce3af2..c90fffdc5a93 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2214,7 +2214,7 @@ static __init int alloc_kvm_area(void)
 		 * vmcs->revision_id to KVM_EVMCS_VERSION instead of
 		 * revision_id reported by MSR_IA32_VMX_BASIC.
 		 *
-		 * However, even though not explictly documented by
+		 * However, even though not explicitly documented by
 		 * TLFS, VMXArea passed as VMXON argument should
 		 * still be marked with revision_id reported by
 		 * physical CPU.

--Sig_/OyfY+_NdlGcil7qPBSyO+8H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwXMpQACgkQAVBC80lX
0Gw8FAgAhFK77KopU/9fKE7F73xZ3etOlp4ecy3B4jU0B8YCxmWHhCha+dBgk6ki
YobgAJx7P+tl3qbEixAqrZsMD2K/ACBA6hiyuqOZqPHoYI8mwGc1oP/mQ1jzGPCY
GyNbYnyHt8wtTvOmrZfRdEtSV8cujZjSUEX7sqzmC5e7DA6BfBF1IF9662sYLNB/
yX4UYeV/TrkzJZgRHX4NXc6LIe8GUV0jgSr41kUaZh1BHysgOeG6r26dob+TLwCi
V3wsbolivyFmK3ZHKQsk9z2BPoD6qQtWtHc+tEUNFeIIF2c3mtFxtua5+s31RHgy
oMv9DMXSOxQJG9hprh8eeNQRPh8vag==
=YaXU
-----END PGP SIGNATURE-----

--Sig_/OyfY+_NdlGcil7qPBSyO+8H--
