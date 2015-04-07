From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the mips tree
Date: Tue, 7 Apr 2015 18:20:11 +1000
Message-ID: <20150407182011.2838c4b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XNkPHGvHRap1AL8IQ3wbBh4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Maciej W. Rozycki" <macro@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
List-Id: linux-next.vger.kernel.org

--Sig_/XNkPHGvHRap1AL8IQ3wbBh4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in
arch/mips/kernel/genex.S between commit 6e81b3c78949 ("MIPS: Use
`FPU_CSR_ALL_X' in `__build_clear_fpe'") from the mips tree and commit
64bedffe4968 ("MIPS: Clear [MSA]FPE CSR.Cause after notify_die()") from
the kvm tree.

I fixed it up (the latter removed the code modified by the former) and
can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/XNkPHGvHRap1AL8IQ3wbBh4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI5NBAAoJEMDTa8Ir7ZwVJD4P/0OiRnd5jGriWP0ylDTvCpDI
XVCuCqJ0DQCMBrkDTgPl+F/Thv9nPlAxyCugvy6f3P5rDhlzBP6cdIFIJdgYmIVM
VAWxEbswRVg1mtIVImkKsB7+L0D9caZvno+qeAknteZEtiR4BbQVDDnJ6r12XQ9Q
yiXaI+c7G2twr94N6oEzed+tgCUpvQm38NmGq657hoRZ3zipiu8cdKgRlstSWGCp
gEQx8Kj7gjhjEa7omVhP22ZXPlmqDlhj2mNglgjc6/GAYCXXv9f4QUrm64jszE/h
3KuX71JpTqv1xBCScr04ouNWrEgjKFui0es1wjb1LBigOBmJN68Uf+H9KpQr2LPW
MdOX9efyRJKJjMIEV0T3yiPBkQA1JUCQXECvr5DEhwwOv7QoX0qgkPRtTZgYo8fq
7h44xPqQ6KGzsLUsCxVm6mmkk7tZU6IbXzVgzxsqw7acnyf84/VxasYNe0nCInSy
x3PU13FxWRc/41EOUIgTv+DpT3B8z0CdfNm9JqKiiPTFl3A6yJV4gehl1jR1u13X
Pr5o0bfQC/g6CgVUpuErGbQXiYrkl/42j6zGCqqSuo6lvoU1taoFQo7qCfnvpfzS
NLSWn30nC20Ry4YeWby5Igcb5Js5cv52/wC55IUEEEkrLC0RErPp+dra0QR3L1VM
lnaZXRNWvs7TynPieXW0
=ZU+A
-----END PGP SIGNATURE-----

--Sig_/XNkPHGvHRap1AL8IQ3wbBh4--
