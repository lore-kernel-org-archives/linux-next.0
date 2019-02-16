From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the kvm tree
Date: Sat, 16 Feb 2019 18:34:33 +1100
Message-ID: <20190216183433.71b7cfa7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hT0TtUrI84sJUehGndQa1v_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, Sean Christopherson <sean.j.christopherson@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/hT0TtUrI84sJUehGndQa1v_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  aa8359972cfc ("KVM: x86/mmu: Differentiate between nr zapped and list uns=
table")

Fixes tag

  Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return

has these problem(s):

  - Subject has leading but no trailing quotes
    Please do not split Fixes tags over more than one line

In commit

  4d3f8e4ff75e ("kvm: vmx: Fix typos in vmentry/vmexit control setting")

Fixes tag

  Fixes: 'commit f99e3daf94ff ("KVM: x86: Add Intel PT virtualization work =
mode")'

has these problem(s):

  - No SHA1 recognised
    The leading word 'commit' is unexpected and the surrounding single
    quotes likewise.
    Please just use
	git log -1 --format=3D'Fixes: %h ("%s")' <SHA>

--=20
Cheers,
Stephen Rothwell

--Sig_/hT0TtUrI84sJUehGndQa1v_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxnvQkACgkQAVBC80lX
0Gxprwf8CWexXHWXQA91GxrA3UJL1hOxOOGpSXagv2JwXVraclf1I1A8UgI3+y7W
Wqk0XXTyWZIjhH6MkUVY3os32Ox3NtXk6ew8K9XuZGPjoSVTAxRRdAdUVQPEyO2q
+asrvQl3k8DbylsJB+w7EqJEEDpuvkKwzkse6SDZAezVbJlH7SW7dJyDgE391HTt
Tjb8MnPW09ULg+79YnKVj7+TMn6/lZBMo4K/3+UHcvTASeeATYVO4rCO8enljzoH
mjxQoYMu3BAVPv5tO+188Shitu20HYQjeLJGwpxgT8DVjltbukvODuSoJKivzGkG
areJk+MDZZJNPntCCGkEihSwCVnZ1g==
=LwcH
-----END PGP SIGNATURE-----

--Sig_/hT0TtUrI84sJUehGndQa1v_--
