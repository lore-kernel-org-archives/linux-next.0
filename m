From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kvm tree build failure
Date: Thu, 18 Dec 2008 22:05:26 +1100
Message-ID: <20081218220526.b97c69e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__18_Dec_2008_22_05_26_+1100_Fv/QgcxaVMMhl13P"
Return-path: <kvm-owner@vger.kernel.org>
Sender: kvm-owner@vger.kernel.org
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__18_Dec_2008_22_05_26_+1100_Fv/QgcxaVMMhl13P
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next build (powerpc ppc44x_config) failed like this:

In file included from include/linux/kvm_host.h:27,
                 from arch/powerpc/include/asm/kvm_44x.h:23,
                 from arch/powerpc/kernel/asm-offsets.c:52:
arch/powerpc/include/asm/kvm_host.h:203: error: redefinition of 'struct kvm=
_guest_debug'

Caused by commit 887e823e3f9c402ff2fe1ea2dc25072ebe81b5b1 ("KVM: New
guest debug interface") which added struct kvm_guest_debug to
include/linux/kvm.h but didn't remove it from=20
arch/powerpc/include/asm/kvm_host.h.  (ia64 and s390 probably have the
same problem.)

I have reverted the kvm tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__18_Dec_2008_22_05_26_+1100_Fv/QgcxaVMMhl13P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklKLncACgkQjjKRsyhoI8xfcQCguhAHwRIE5Pil7i1rPOMjwpSZ
m64AnRPxJJoYKqk9PaI83d287oQDo704
=CYp4
-----END PGP SIGNATURE-----

--Signature=_Thu__18_Dec_2008_22_05_26_+1100_Fv/QgcxaVMMhl13P--
