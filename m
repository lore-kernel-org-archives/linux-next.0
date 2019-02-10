From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the tip tree
Date: Mon, 11 Feb 2019 07:36:57 +1100
Message-ID: <20190211073657.7f9cd5ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cm2GOr_pcomVfrNTZWho/dW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/cm2GOr_pcomVfrNTZWho/dW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f6783319737f ("sched/fair: Fix insertion in rq->leaf_cfs_rq_list")

Fixes tag

  Fixes: 9c2791f936ef ("Fix hierarchical order in rq->leaf_cfs_rq_list")

has these problem(s):

  - Subject does not match target commit subject

--=20
Cheers,
Stephen Rothwell

--Sig_/cm2GOr_pcomVfrNTZWho/dW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxgi2kACgkQAVBC80lX
0GxwYgf/dJUpDStgEnfD4253+gOLoY3yx7LeY5XeH2KbBcmbdrIQFaJpimWMEMuR
o7Cg9SedWCi1erjEGPCqgBwNuSw/q8am76NTGFKX40BNAaiPDJrNxrFmQZgR/4jb
f1kwIKZsyy4V16K2QUo8lHG2NMDqcU1s/Py+EMVs7YKuxojXnScvhB3yRwudVfZU
TmEOTeLDEMNj9JicTXurdZ3ofMcxAhE+5PzBO/UALNG6qeFRMgYezpWRM1KaM4nc
S5c+Xy7Qzg1cXSyg7uhCwNXaKZaBdzGF12MT0AXdpwhN86DeeKCpfNPJgEaZpud2
4Lxl5ADXbOXjzkg9Inl1Dw76ysomiQ==
=ToQm
-----END PGP SIGNATURE-----

--Sig_/cm2GOr_pcomVfrNTZWho/dW--
