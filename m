Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36C480DE0;
	Thu, 13 Aug 2026 14:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629867; cv=none; b=kDXPADXznzqUzSo3kg/XxDmh5sTocxVAPjI+pLK2i0WEztAFeauX25KodRzOmrtXrMpEuFcC71Ut53b9UmoQ0Q1DodU022QjKGdRpd6sEVnVDvv4+5MdkzlEctAA1ZNm+0nj/9USd6V2wOaum15YYrt5y6LFps6v/qpUBLPGezw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629867; c=relaxed/simple;
	bh=Lx8kj/N0fYh5v17W8cqWdx+6K3v7CM1IIRLfGpDXRbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gKNZj+M0Zu0YLKTucHTufhxPhpBF7bYanz21M6HOWV0YbDGnNNlw9H0BlOBzLLVCSR07KjC1GcjXTjzK0no1I7zcIGeaUCA7WDgSr972obGisMuMTn1sKpw7HcHi9bPUbM+jagpvMZ3byn1lkYCa8p3MkjBBt2BdHt1p48wdFA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yurjhy0H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yurjhy0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9DE1F000E9;
	Thu, 13 Aug 2026 14:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786629866;
	bh=DAWZswFtExMEUPYdzbvTKIDDHNIOgGlTepcIpqdMBTk=;
	h=Date:From:To:Cc:Subject;
	b=Yurjhy0HxDIt2Kbdtdtt7cZWhBaLyOIU1QvrTghUEHC99mvOcBOzAj0mhdW7ep9LR
	 0IVUidPKRnG4bsM551Drr4OqK771qqS156KD5r0PvAmjUSRJyhwMUM9vU6AhRz7bVj
	 Iz4Abldxvd45Bm5genGQdKqthduJj/lK24px/uxbE95GJxYy1o6u4mxxdUNkCfIGUO
	 JXNm+0PJ0t8DuKoq2HP0KyC2k4CpLMkMDOa/8DXqHs3daGFd4sAiXRvpzC3TsV/sSI
	 YV1+rjXOjtlUL4qIT9vznDT4GfcpvDEg1IglkWZxvy7TknrZkaIazw38hfCrNoyIfa
	 SojULALtU2WuA==
Date: Thu, 13 Aug 2026 15:04:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Andy Chiu <tchiu@tenstorrent.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Guodong Xu <docular.xu@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>
Subject: linux-next: manual merge of the kvm-riscv tree with the risc-v tree
Message-ID: <an3O5UpWGl9zGsVs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CQgsDKhOufaK82Px"
Content-Disposition: inline


--CQgsDKhOufaK82Px
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-riscv tree got a conflict in:

  arch/riscv/kvm/vcpu_vector.c

between commit:

  0c5a9ab5192b8 ("riscv: Standardize extension capitalization")

=66rom the risc-v tree and commit:

  b5060a4aa33d7 ("RISC-V: KVM: fix vcpu vector context handling for kernel-=
mode vector")

=66rom the kvm-riscv tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/riscv/kvm/vcpu_vector.c
index 3c3183b39ae2a,bf5c94d8786b5..0000000000000
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@@ -56,9 -56,8 +56,8 @@@ void kvm_riscv_vcpu_guest_vector_restor
  					 unsigned long *isa)
  {
  	if ((cntx->sstatus & SR_VS) !=3D SR_VS_OFF) {
 -		if (riscv_isa_extension_available(isa, v))
 +		if (riscv_isa_extension_available(isa, V))
- 			__kvm_riscv_vector_restore(cntx);
- 		kvm_riscv_vcpu_vector_clean(cntx);
+ 			riscv_v_flags_set(riscv_v_flags() | RISCV_V_VCPU_NEED_RESTORE);
  	}
  }
 =20

--CQgsDKhOufaK82Px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp9zuUACgkQJNaLcl1U
h9AlsQf9HDuPxessvbt+GMMrq/ihGOMRwDBFqAzTBYCC5zMEC4CZDlhRLINuWuit
HZxgWbFuAHrT+XvpAbFK9ZhMnjsBCGBGEzZJAickFNXV+5qgTboBWjoQSebCJU2K
u1kh7KUtlTq+zlS4rXvnnGr8LNDIzsGqReLWbxpQ6NHn2lVH73c59nc/NxbrwpPs
J+HtXFH+pQpulP2zpPFIVn+2aZy3IWSttuS5BUFTPuV7FSXhYLy5ghGyPMcQP4QW
EegA4jvb4q3xzrnTTVlRzLi3C4J8N/xkCpfmWygKWdAE6SLxWA1GZdW/nFbj/dnu
vVKPo3Qee7+ZT4n3UWS2l92fjTCfwg==
=88Fq
-----END PGP SIGNATURE-----

--CQgsDKhOufaK82Px--
