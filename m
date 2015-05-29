From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-perf tree with Linus' and teh
 arm-current trees
Date: Fri, 29 May 2015 11:14:32 +1000
Message-ID: <20150529111432.397105d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MnRmBDOE5u2SNKDAjQ38kSi"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35733 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754130AbbE2BOi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 May 2015 21:14:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>

--Sig_/MnRmBDOE5u2SNKDAjQ38kSi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Will,

Today's linux-next merge of the arm-perf tree got a conflict in
arch/arm/kernel/perf_event_cpu.c between commit 338d9dd3e2ae ("ARM:
8351/1: perf: don't warn about missing interrupt-affinity property for
PPIs") from Linus' tree and 8d2812849acb ("ARM: 8357/1: perf: fix
memory leak when probing PMU PPIs") from the arm-current tree and
commit 64d0d3943e14 ("arm: perf: make of_pmu_irq_cfg take arm_pmu")
from the arm-perf tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/kernel/perf_event_cpu.c
index 3b8c2833c537,50f245bf4e05..000000000000
--- a/arch/arm/kernel/perf_event_cpu.c
+++ b/arch/arm/kernel/perf_event_cpu.c
@@@ -301,17 -306,12 +306,18 @@@ static int probe_current_pmu(struct arm
  	return ret;
  }
 =20
- static int of_pmu_irq_cfg(struct platform_device *pdev)
+ static int of_pmu_irq_cfg(struct arm_pmu *pmu)
  {
 -	int i;
 +	int i, irq;
+ 	struct platform_device *pdev =3D pmu->plat_device;
 -	int *irqs =3D kcalloc(pdev->num_resources, sizeof(*irqs), GFP_KERNEL);
 +	int *irqs;
 =20
 +	/* Don't bother with PPIs; they're already affine */
 +	irq =3D platform_get_irq(pdev, 0);
 +	if (irq >=3D 0 && irq_is_percpu(irq))
 +		return 0;
 +
 +	irqs =3D kcalloc(pdev->num_resources, sizeof(*irqs), GFP_KERNEL);
  	if (!irqs)
  		return -ENOMEM;
 =20

--Sig_/MnRmBDOE5u2SNKDAjQ38kSi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZ719AAoJEMDTa8Ir7ZwVjU0P+wVFvfWTs0lBfboPI3NaJUXt
FdWPd/k8uF1NdAPGNxX3f3ksbnwrB0YaT53gb+L6xTGJdm3Eu3hV3FTXJbogLfyk
+VUKhslliNE2yohmPGYCgjvjxUjztZasytvNdBAfZ40fl9WBtR+E03fjZoNzFF8S
/EhY9CHgm41V+Qcl87bbTAUteoOPK00WmNfaiOBwOKt+f0pgXXqdNlL/wR02gsoj
mmx9cvasosQ0KUdWda+73N2cu4KgErSfsE0fh7hXwXY8bVW8sbRmvAm6LHu5XUX2
AaQaNYoKiVLMdXHA8JwfVCq9OsG8sFX0Pnp04EhSVIALWILo+3KLRPjh0/QogT0N
V+n/9Io7q5KITjtJHKvwHuPlM+JvPVyrN37xAKIFlMwqGSKnppQu+oap+LsnqM4G
+e6oiIyeFkU+QO/01kmPbyO8FxP+bFd1YyExi/2m5jTf8UBnszWZr5srqsYjas4p
GFvcIKUyDiru2y7uodqn9/aVX1Z4qxaoLbNoQcIx4USohXq/AxXOvVIYKHmvu4p2
+iI1kch8uPgYr1Di1g9B5c6yywT4CPZl0yKTXmwIgbvNkfTs2EydxmEZ+jgJ37WO
CIrFBkF3DXvsKiggrbeN8jntcJsFFDQ0DNN8QLTO7dVVlKjmtH/Ibf0eYkMj5Nm8
fBWkNX8bad/xY/9HKx7y
=xKCZ
-----END PGP SIGNATURE-----

--Sig_/MnRmBDOE5u2SNKDAjQ38kSi--
