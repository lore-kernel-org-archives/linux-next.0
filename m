From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the kvm tree
Date: Sat, 22 Dec 2018 00:57:46 +1100
Message-ID: <20181222005746.4bdd1553@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MqaFIW.=CR6_b+Abyrdj..V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/MqaFIW.=CR6_b+Abyrdj..V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  8cee58161eff ("kvm: selftests: aarch64: dirty_log_test: support greater t=
han 40-bit IPAs")
  cdbd24284824 ("kvm: selftests: add pa-48/va-48 VM modes")
  696ade770f08 ("kvm: selftests: dirty_log_test: improve mode param managem=
ent")
  fd3f6f813976 ("kvm: selftests: dirty_log_test: reset guest test phys offs=
et")
  6498e1da84da ("kvm: selftests: dirty_log_test: always use -t")
  d4df5a15602e ("kvm: selftests: dirty_log_test: don't identity map the tes=
t mem")
  b442324b5815 ("kvm: selftests: x86_64: dirty_log_test: fix -t")
  bdd303cb1bdb ("KVM: fix some typos")
  649472a1694f ("x86/kvmclock: convert to SPDX identifiers")
  9b7ebff23cb8 ("KVM: x86: Remove KF() macro placeholder")
  788fc1e9ad8e ("kvm: vmx: Allow guest read access to IA32_TSC")
  9ebdfe5230f2 ("kvm: nVMX: NMI-window and interrupt-window exiting should =
wake L2 from HLT")
  e081354d6aa7 ("KVM: nSVM: Fix nested guest support for PAUSE filtering.")
  7a86dab8cf2f ("kvm: Change offset in kvm_write_guest_offset_cached to uns=
igned")
  f1b9dd5eb86c ("kvm: Disallow wraparound in kvm_gfn_to_hva_cache_init")
  ba7424b200d3 ("KVM: VMX: Remove duplicated include from vmx.c")
  b85c32dd2749 ("selftests: kvm: report failed stage when exit reason is un=
expected")
  e87555e550ce ("KVM: x86: svm: report MSR_IA32_MCG_EXT_CTL as unsupported")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/MqaFIW.=CR6_b+Abyrdj..V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwc8VoACgkQAVBC80lX
0GzPrgf+IouKYZMUp4e3N+rt8u2edrS4E9vH3RYktELFMwlGPm56bOkTlqwU/fwd
LZ92N3wni6UwcSm2snuJ8GySZhwCOC/8WduAKG9L1Bx0KmL/vlAYA5S0HK8mr4s+
BaFAEbVO5ZyyTLiP0YOVoqvPK+kgE4D/B1Y+nxEBsVFNLAQArpBfJtHPZIIZcXl0
SAKHAc3FcEMmA6ng0xRY2Tan3dvZMtvjywebBXd/ymL/C6r72SueB30IL86Ff4TN
B8EateHu2z7fqzg1A93T3BP/VSGPTBCo1UeMWn6MeXJZLDB+MMzHJ0gnaCTiyoit
BFENbajY5IHHydVBI6sc9NFvbH6cdw==
=onlo
-----END PGP SIGNATURE-----

--Sig_/MqaFIW.=CR6_b+Abyrdj..V--
