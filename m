Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392ED192B90;
	Thu, 29 Jan 2026 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698844; cv=none; b=UzRJn/6nhaSrwMX38ul9fWtgFOeMmsRFQdqwHr1JdtPN5cOgZpBUWUHXDWkyJOTc0FGr3mGC+/KItA2xxVbxmdBShYocUAq9G4yG0FREGVE4L4hFbJxJyvMudmXky5owMZgijwLMF3u+sIucq8o0Gg3oaWw5ufGM6bKhLKi7dmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698844; c=relaxed/simple;
	bh=zyHoDOQ2BElbZnCszVkpyvzIlEwtMJEe1Hh+xfSphpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIXB8UitqbSTqQ+YJEH+sPZGNbfRspYU/9AYFoU6hg65GEmD4ehdaVl4ZZlj7StCKAbb8RP2G6fdHLE11KHuaDlftpg9yxxh3sjxqfPvmUTas/hJL4ePBcYy3tpOzy3AOmOWe+triRcnylXt6GVIPTR0SUO3AB/6P1DqRT6f3Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obEoujsx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obEoujsx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA13C4CEF7;
	Thu, 29 Jan 2026 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769698843;
	bh=zyHoDOQ2BElbZnCszVkpyvzIlEwtMJEe1Hh+xfSphpM=;
	h=Date:From:To:Cc:Subject:From;
	b=obEoujsxBcwY01FtAJt8+x4IB3ZGCSGY8z0GeRoeIHo6YahM+STXDOUPmSDO5WWMB
	 XdUFkO5NZjX7+Cp8IE9pEjrBFMVAVifCT+IbV83K91C1soE5fx59MTx6tx8Rj9yNNt
	 Dkd4YxluJCuo0UE6X+H6EwboK5v+3vWNgVT4Z9ybPRrybKmvH9Mh+m/hqsSOWT82Gl
	 Z+F/LcE/BwgDXMseKuxjWTaer6VPPZcMub90dEHz8qgKXaM8lBQG9+br936WCMAA1N
	 1gq4+fHJzH+scMe+GiIOBBweAjIqQ0ROI4/XAQ5UeJD1rY2frn2B80tBcioiGvCo3t
	 wILADnwDHHjzA==
Date: Thu, 29 Jan 2026 15:00:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup@brainfault.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Wu Fei <wu.fei9@sanechips.com.cn>
Subject: linux-next: manual merge of the kvm-x86 tree with the kvm-riscv tree
Message-ID: <aXt2F2jIm5YK8LB1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OC7PgvLGfSkGD0Vc"
Content-Disposition: inline


--OC7PgvLGfSkGD0Vc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  tools/testing/selftests/kvm/lib/riscv/processor.c

between commit:

  7631f7b1ccc9e ("KVM: riscv: selftests: Add riscv vm satp modes")

=66rom the kvm-riscv tree and commit:

  9f073ac25b4c4 ("KVM: selftests: Add "struct kvm_mmu" to track a given MMU=
 instance")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/testing/selftests/kvm/lib/riscv/processor.c
index 373cf4d1ed809,e6ec7c224fc3e..0000000000000
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@@ -64,15 -68,15 +64,15 @@@ static uint64_t pte_index(struct kvm_v
 =20
  void virt_arch_pgd_alloc(struct kvm_vm *vm)
  {
 -	size_t nr_pages =3D page_align(vm, ptrs_per_pte(vm) * 8) / vm->page_size;
 +	size_t nr_pages =3D vm_page_align(vm, ptrs_per_pte(vm) * 8) / vm->page_s=
ize;
 =20
- 	if (vm->pgd_created)
+ 	if (vm->mmu.pgd_created)
  		return;
 =20
- 	vm->pgd =3D vm_phy_pages_alloc(vm, nr_pages,
- 				     KVM_GUEST_PAGE_TABLE_MIN_PADDR,
- 				     vm->memslots[MEM_REGION_PT]);
- 	vm->pgd_created =3D true;
+ 	vm->mmu.pgd =3D vm_phy_pages_alloc(vm, nr_pages,
+ 					 KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+ 					 vm->memslots[MEM_REGION_PT]);
+ 	vm->mmu.pgd_created =3D true;
  }
 =20
  void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
@@@ -220,14 -212,8 +221,14 @@@ void riscv_vcpu_mmu_setup(struct kvm_vc
  		TEST_FAIL("Unknown guest mode, mode: 0x%x", vm->mode);
  	}
 =20
 +	max_satp_mode =3D vcpu_get_reg(vcpu, RISCV_CONFIG_REG(satp_mode));
 +
 +	if ((satp_mode >> SATP_MODE_SHIFT) > max_satp_mode)
 +		TEST_FAIL("Unable to set satp mode 0x%lx, max mode 0x%lx\n",
 +			  satp_mode >> SATP_MODE_SHIFT, max_satp_mode);
 +
- 	satp =3D (vm->pgd >> PGTBL_PAGE_SIZE_SHIFT) & SATP_PPN;
+ 	satp =3D (vm->mmu.pgd >> PGTBL_PAGE_SIZE_SHIFT) & SATP_PPN;
 -	satp |=3D SATP_MODE_48;
 +	satp |=3D satp_mode;
 =20
  	vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(satp), satp);
  }

--OC7PgvLGfSkGD0Vc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7dhcACgkQJNaLcl1U
h9Bi+Qf+NT3KpU0jt2+8u8w9wQ44E8bB+O7UHXxhi5LdANq6lpyQqkryI5J9HzZk
rsooKbScoJj5kFByqYz0GSh3v6cvNZweE+9OZRaLtZurfbyupcC79YNbJkyNyEEL
6r9g8ARuP7biRLhRZP/fA2KMf1wEarcem9quJdKpb53vQFXLMQn2gz3X/FHyJ1bB
khQ0eTm5EIq+qoyCxqEiovL6OxT/YOojMk2C3gH7p+pZbaOW7YdIP6OC1LhF/2fZ
gcsszVHhw8CvdYxI5XmrUQ1RB619zO6pggC0aWFNeQoFZaN9evnSVY6CFEN/Uv0Y
u/tCThJBo04cBsY9ihhqdseExyzZbQ==
=HC68
-----END PGP SIGNATURE-----

--OC7PgvLGfSkGD0Vc--
