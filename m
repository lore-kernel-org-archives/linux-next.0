From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 livepatching tree
Date: Thu, 30 Apr 2015 14:07:33 +1000
Message-ID: <20150430140733.7c9f79bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/re0U+mMF+zNVFxVGJFO2LcA"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33521 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750802AbbD3EHk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2015 00:07:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, HATAYAMA Daisuke <d.hatayama@jp.fujitsu.com>

--Sig_/re0U+mMF+zNVFxVGJFO2LcA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
arch/x86/kernel/machine_kexec_64.c between commit 4545c8988013 ("x86:
introduce kaslr_offset()") from the livepatching tree and commit
22543072a261 ("kdump, vmcoreinfo: report actual value of phys_base")
from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kernel/machine_kexec_64.c
index e1029633f664,ab48c252e661..000000000000
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@@ -335,7 -334,8 +335,8 @@@ void arch_crash_save_vmcoreinfo(void
  	VMCOREINFO_LENGTH(node_data, MAX_NUMNODES);
  #endif
  	vmcoreinfo_append_str("KERNELOFFSET=3D%lx\n",
 -			      (unsigned long)&_text - __START_KERNEL);
 +			      kaslr_offset());
+ 	VMCOREINFO_PHYS_BASE(phys_base);
  }
 =20
  /* arch-dependent functionality related to kexec file-based syscall */

--Sig_/re0U+mMF+zNVFxVGJFO2LcA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVQaqJAAoJEMDTa8Ir7ZwVhz8QAIOdCcdOslw/4XvwtV5FFxFv
VpARCPdSLLzvwIn64twIREQYqMVXLfPtTIfAnkU8eIjcK3KkORzDSCECw8uUjkrM
0/ZTHG6I0nDqsy+z1uegEtJoEysujMtBoyfzIxUw9w7rMtEAEQdvdfkL2vsPBp3e
0oMuq6eXABekr2Zdk8hIBPv8ZLP/OOG8446RavT8X9C3QvM7WJOjkdrAExRxOoFt
z9R5h9Lrwk6ygiIDMamZhJVCy0QZDeFrJLqIvM5rYELD63rAnjf9uGMvMzdiL7n6
7slQaay5QcxoF38aa+bHOAkiudE6sX4gKYD/b7b+0ZWPNrFfHaALBXR4YSVON4oH
awXZGZLhf4j1r+1PCmiKtIhj2NjACwYdW4sQYy3IPqgfEVoPONIbTHRSkcl7Y/Fw
X4u7OupvDFViYk+iYousevddDBf/pBJX5KF88KatopyhoGoXn57Tzh5QqTwsJN31
+qeED0rNGwDLP7xJhQdApClgRrOEimIjRhldYOVoL6WKTxcxZtUbkRaYlOLcZExP
t2cjokE88BJ9v5WzIzCyN6g4f5mhzl7vg6J16sF5sT5NWLUm+kz2y7L5BCZ4yCXy
S+PgOrktjlJP7FsaEvNCqKDgqbEncGE2en48bArDKgThEk4zVaVTun/qB6Gd5xQz
2B2gk7HcCiJ/b9kTix4W
=+wC2
-----END PGP SIGNATURE-----

--Sig_/re0U+mMF+zNVFxVGJFO2LcA--
