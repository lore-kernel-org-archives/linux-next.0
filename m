Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE2C227563;
	Thu, 29 Jan 2026 15:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700000; cv=none; b=g7dpSU6tqyB4jzyjVPxh9sxJIEqbXiB4yND/Joytk7Fo72/vcCBXH7yFDKgkKCEamnp83geukGjj0UxtDaV/StvHeJrWF1IFjmeWqNBzohDiQVhNOMQCiWj3lu6+uI2koOoUhjOe0yUgBAWqcgE5mV01qJ25H/8iEZEJvozDHm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700000; c=relaxed/simple;
	bh=u9HpuymB4jnQsWOHqBJ7eyGnxrVbHZmh9qRqhQi99N8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBjOYdi9G/GTPQ9VGX1/cmbOssnb3KEgIfLZiMX0wfweuUXZCk/b7dIFiBFFza2e9Xsd9i0/4zIUpA8Q6MqXbREKZiZY+yuNSfPLmgyXTYImTZ3JR0b3gciyU2/VUrB/EpMN6b5k3SrlktoCHzfP+1/yIu0ii5P5K+4Oln7Puqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0+iV1pU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0+iV1pU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7B6C4CEF7;
	Thu, 29 Jan 2026 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769700000;
	bh=u9HpuymB4jnQsWOHqBJ7eyGnxrVbHZmh9qRqhQi99N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0+iV1pUYi+7u2bvs2tDWZww/ItvCjdiATm2wDlF4Bcaj4z1YLoj5Z1KJbgSgBWW0
	 DrcUZJhN8iyZc4vij53UX0/u1Tkxv53p9GMABNUBOUbdOT7MprpVr3jggBgK1K4HmK
	 7LFVifFhQO1Q/iwFx0s9K4UEdUh8KC78rnvWQIIAZzsxs65cpQ8K3f9wuCIuknQbUy
	 Ugy51fIQY7Ci08Am8oo9+R6fhwCCwxP6lRAAKl3FfvkSpugUkoGlOh2E/N7VWVMuJR
	 rsVpT6McN31MOJP46Q57EV0iKlMO0zzQxF/cik1kRVyzSCdY0pxyEvQ0fO2MJTPsDF
	 6IyE6Npop447g==
Date: Thu, 29 Jan 2026 15:19:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup@brainfault.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Wu Fei <wu.fei9@sanechips.com.cn>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm-riscv
 tree
Message-ID: <1b6ee2e4-c880-4d8f-af16-aeeadaffb1ae@sirena.org.uk>
References: <aXt2F2jIm5YK8LB1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="28sTDVHcnSsrXys2"
Content-Disposition: inline
In-Reply-To: <aXt2F2jIm5YK8LB1@sirena.org.uk>
X-Cookie: You have taken yourself too seriously.


--28sTDVHcnSsrXys2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 03:00:39PM +0000, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
>=20
>   tools/testing/selftests/kvm/lib/riscv/processor.c
>=20
> between commit:
>=20
>   7631f7b1ccc9e ("KVM: riscv: selftests: Add riscv vm satp modes")
>=20
> from the kvm-riscv tree and commit:
>=20
>   9f073ac25b4c4 ("KVM: selftests: Add "struct kvm_mmu" to track a given M=
MU instance")
>=20
> from the kvm-x86 tree.

This also nsees the semantic fixup below:

=46rom 11021bad2a6d62224d9216da62023e1a79cdd0dc Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Jan 2026 15:12:25 +0000
Subject: [PATCH] KVM: selftests: Fix up semantic changes

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/sel=
ftests/kvm/lib/kvm_util.c
index 265e173b73709..1959bf556e88e 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -359,17 +359,17 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	case VM_MODE_P56V57_4K:
 	case VM_MODE_P50V57_4K:
 	case VM_MODE_P41V57_4K:
-		vm->pgtable_levels =3D 5;
+		vm->mmu.pgtable_levels =3D 5;
 		break;
 	case VM_MODE_P56V48_4K:
 	case VM_MODE_P50V48_4K:
 	case VM_MODE_P41V48_4K:
-		vm->pgtable_levels =3D 4;
+		vm->mmu.pgtable_levels =3D 4;
 		break;
 	case VM_MODE_P56V39_4K:
 	case VM_MODE_P50V39_4K:
 	case VM_MODE_P41V39_4K:
-		vm->pgtable_levels =3D 3;
+		vm->mmu.pgtable_levels =3D 3;
 		break;
 	default:
 		TEST_FAIL("Unknown guest mode: 0x%x", vm->mode);
--=20
2.47.3


--28sTDVHcnSsrXys2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7epsACgkQJNaLcl1U
h9D+/Qf/Zyv1XKrqO8blTdg/U8Y1D8SAvyLs7XKVt/Yh5C07kxAn1VsS/1Oif/BF
0XhBtH7cuxe0PIpDYOAllYzC4cdZpsfX+lIIOzlE1tpjv+Sq5o+LEIl6BifwNJJ1
Zqin7Mzl5N2PcUYD5Vbc1th412qIE4mO9rCSK1ymF6/u+sjT4mwAH27pXAEAbtOt
NBc8Oj2vS5Nq4YWT1MBA5nKyaZLgLbPKWPc+mqMeyaDepfB9urFppU7qOHJ331R9
UoUUDMbFShrQrvoFUVOh914GeQSDr2ej7XCKTlrgg8ot9WfdBsdorIP3A8t7gyDz
pb5pOkXrXlyKAZ8wQMj9Cg3g/ppCbw==
=JpFf
-----END PGP SIGNATURE-----

--28sTDVHcnSsrXys2--
