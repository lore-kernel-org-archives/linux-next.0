From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pm tree
Date: Fri, 8 Jun 2018 10:30:35 +1000
Message-ID: <20180608103035.266fa61b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ncqmE76IGCiWNItKgM.lURc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ncqmE76IGCiWNItKgM.lURc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: vmlinux.o(.text+0xc5b83a): Section mismatch in reference from the =
function __intel_pstate_cpu_init() to the variable .init.rodata:intel_pstat=
e_hwp_boost_ids
The function __intel_pstate_cpu_init() references
the variable __initconst intel_pstate_hwp_boost_ids.
This is often because __intel_pstate_cpu_init lacks a __initconst=20
annotation or the annotation of intel_pstate_hwp_boost_ids is wrong.

Introduced by commit

  f50f70793d78 ("cpufreq: intel_pstate: enable boost for Skylake Xeon")

--=20
Cheers,
Stephen Rothwell

--Sig_/ncqmE76IGCiWNItKgM.lURc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsZzisACgkQAVBC80lX
0GxW8Af+MqOShKPW6Heab/wr9NodJgskeQtpfBsuThDeKewEt39Qd8LncT3JmBhF
hoRenM305b5fnvz6Y3pXWX7ydpvaNODEL8rZ95x0unK9SeE91uw+5g1LL1pb1eu/
K8CMyRNh92/Hlcx1jqMI421T6KR+v4NLXGEfaAO0sSwaqqjuaH+Q+EAxwNswNQL+
yc5vN8XeTi+syGixf0V0vKdo1naeKimFTpsGVxxhO7LEtotasXRserhexaPL+PHO
Nqp6TXBA2xPJl/7+NgvUmoUCZEflWTtbDSFiWwnmhIgvhunNyJKoBHumd2gMWCO8
E23+y71CJJIf9SViNRndUl4COvMeNQ==
=yyjF
-----END PGP SIGNATURE-----

--Sig_/ncqmE76IGCiWNItKgM.lURc--
