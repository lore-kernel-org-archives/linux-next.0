From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Wed, 8 Aug 2018 13:54:45 +1000
Message-ID: <20180808135445.1a85f9b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SkhUMoQV0vcZ4iq.LZ7CQ=u"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Tatashin <pasha.tatashin@oracle.com>, Wanpeng Li <wanpengli@tencent.com>
List-Id: linux-next.vger.kernel.org

--Sig_/SkhUMoQV0vcZ4iq.LZ7CQ=u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Paolo pointed out a semantic conflict between the kvm tree and the tip
tree in

  arch/x86/kernel/kvm.c

between commit:

  368a540e0232 ("x86/kvmclock: Remove memblock dependency")

from the tip tree and commit:

  d63bae079b64 ("KVM: X86: Add kvm hypervisor init time platform setup call=
back")

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I applied the following (as suggested) after the automatic merge:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 8 Aug 2018 13:48:34 +1000
Subject: [PATCH] kvm: x86: fix semantic conflict in platform init

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kernel/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 0906b8731393..e2499bad3209 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -714,13 +714,13 @@ static void __init kvm_apic_init(void)
 static void __init kvm_init_platform(void)
 {
 	x86_platform.apic_post_init =3D kvm_apic_init;
+	kvmclock_init();
 }
=20
 const __initconst struct hypervisor_x86 x86_hyper_kvm =3D {
 	.name			=3D "KVM",
 	.detect			=3D kvm_detect,
 	.type			=3D X86_HYPER_KVM,
-	.init.init_platform	=3D kvmclock_init,
 	.init.guest_late_init	=3D kvm_guest_init,
 	.init.x2apic_available	=3D kvm_para_available,
 	.init.init_platform	=3D kvm_init_platform,
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/SkhUMoQV0vcZ4iq.LZ7CQ=u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltqaYUACgkQAVBC80lX
0GwqEgf9EI6wYOYduAAdxG+AZxIyRL7ueVEb0tgPJFHB6skFqub62SE0Yz+to9GQ
IzV9vQiI0PnibR5M042K/IwrdqCic8UatGR4QVHOWKJQ70PnMRPxxfblzbXV1yPK
jsV+xBGIHmMYbEgiSObxle/4g3SQHhFTCeU5qbgEgxhBz8NI1QO0H1xmOtsszujE
dkybl6d9hlAl1tfIZj2cTuusAPVcEzcbQ9YOTQ4umXK9YepFfBAdDfDPm7i0DwTq
4HAlxXDCNVYwq4/UjafWoeDtSce5a+pZiWxpGJ2ZkXsfz+Nc0W+ZnMLCU3U+wNKX
6AunO8P9rfkLjBT1fWeXgMyf62x81A==
=XOqN
-----END PGP SIGNATURE-----

--Sig_/SkhUMoQV0vcZ4iq.LZ7CQ=u--
