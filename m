From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm tree
Date: Fri, 29 May 2015 17:36:48 +1000
Message-ID: <20150529173648.61bf6592@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PJGS/IRjPW1sVa4wAb5Q8ps"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37655 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755404AbbE2Hg4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 May 2015 03:36:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

--Sig_/PJGS/IRjPW1sVa4wAb5Q8ps
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

arch/x86/kvm/cpuid.c: In function 'kvm_update_cpuid':
arch/x86/kvm/cpuid.c:98:2: error: implicit declaration of function 'use_eag=
er_fpu' [-Werror=3Dimplicit-function-declaration]
  vcpu->arch.eager_fpu =3D use_eager_fpu() || guest_cpuid_has_mpx(vcpu);
  ^

Caused by a bad automatic merge resolution which didn't add the
includes of one of its parents.

I added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 29 May 2015 17:24:42 +1000
Subject: [PATCH] kvm: bad merge fix patch for arch/x86/kvm/cpuid.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kvm/cpuid.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index e243f2ed54c0..8285bc73a5a2 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -16,6 +16,8 @@
 #include <linux/module.h>
 #include <linux/vmalloc.h>
 #include <linux/uaccess.h>
+#include <asm/fpu/api.h> /* For use_eager_fpu.  Ugh! */
+#include <asm/fpu/internal.h> /* For use_eager_fpu.  Ugh! */
 #include <asm/user.h>
 #include <asm/fpu/xstate.h>
 #include "cpuid.h"
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/PJGS/IRjPW1sVa4wAb5Q8ps
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVaBcVAAoJEMDTa8Ir7ZwV5tgP/i6lCtDzUzVb9y+AShIMYgql
HAeD8BxhXff9zKB0xX1w0/VkQmHPuhigXTYYBdOgsa+bwyjQKyRAflbN8Kd66dHj
NcaOsYKIr2A7NXmIy6KmWJedO1Ao9zd4B7tyiiMx3nrHz8JGuxnsoTjRx4HGfsTX
6iCoJxQOHoQHp04eH4X02asS1XbtAZ6rfQ+O6e+SjQoQF+7kVm73JsKi3YyrF3mL
0rTVF+OmS6r/R0mj6Da/TE/lkxP8tjJxUW/58slMuxP3bEIEhbAjXCYCIqc20R4b
Ck9PyhFA1w8CRk5K+BBelyf5QSJxU4ENDAzEh0ytxQI7RJxmtLC6Tq9HyNf/7rom
eFgq1h4bmb9jBLgtlHjMce7SSMp6NsOZDelxLBKWAR5gQp/MDIxMH4ZZGETdVij9
67R+R10G1hLwEgG6q0YcT6Z1d2zZqZcsgVKC7OLzfOdixRIqq0R4NoCxt/YtjIEq
SR8IbW79ExaTcIOQWFbbkqmSYHSmMbJoq9RnRuN4OmwNy9tBadzMvAGHRIhjcZy8
8eVvYY4JCmVpB/BbAPQ9vNUjA6GKKD1Dos8N3hP2tSUaeXNocvg+0QCaWfUAqmRu
K00t2Q9E7kyv/GeHPVmlJ3wmul7vfc4QOmd+R7HApisQfiSdH2buUnKHCgZqUtIK
kP51N6xfWF36VAMA6/Zz
=NIM3
-----END PGP SIGNATURE-----

--Sig_/PJGS/IRjPW1sVa4wAb5Q8ps--
