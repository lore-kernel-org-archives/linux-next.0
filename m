Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED04397691;
	Thu,  4 Jun 2026 12:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577961; cv=none; b=iJmYpOar1Ngkt2eQgte9EA/SyUJnpoe/VGnusm9C/I23gY4A/4EXcdGmvV7Z0WN4Iejm+19jVC2PNiY5x9SVW/1WCaDbg8X7xcHIdHXkcaBpfLgYls/xfkgZ1sINGH6zAkwTAF/0xV71Br5dR2S04eIZbB3zYK1qm0j14AGl62w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577961; c=relaxed/simple;
	bh=b23fY377JRFBuWx6LAw0qbD6tqyGXeHYEg74gGek+ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LVNkLgRyTfiqLHYPGj5bDvRV7k9QMQ8zA6TRaODAXjrZ1GGVH8vZ1arEF5VMLph4pj3gyrTQpEnMwwkMug9ti0Ck/pFQljziGv9z0QN7j2ETb9UxX4DCaTtpEi3Ss33dwDqwfjALtmv1wLaf3lTZvHZNJdUZ+Fie/efisLizRHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1qGPkPI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1qGPkPI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF431F00893;
	Thu,  4 Jun 2026 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780577960;
	bh=eyibRmLds9dLBE32l3OHzWdEyKiGLTYtUtPAJHdOS4Y=;
	h=Date:From:To:Cc:Subject;
	b=l1qGPkPIaQNB5+su1PGzvRhnA+naQH8hbOufgfaFNIziGlSZcJpVRGSPd5RCnsWnJ
	 PbYOJ99NsQqj34CGuB91hcP5eHQFQsg2sIHK64f30RIOKtln+RKPAGIQ7V3VE0Cqbq
	 cMtm0X/bYDMDxm0zzk7nwyWr9Oc36ataZOL2miinN77iAAr/2N36iwmcyqFnToJYY6
	 J1zN2+v1iWDBRCN0Y3Xqbs33GTsVc/sXi8ozEiEWg5yb6qo0SH+LsOly2hG1OEtPMI
	 8mXSzBQMDgjNMndAFnWkpj5JE2ryLPmadupcmupaHk6qvxQV67IG/roaj2dPXaBHCG
	 F2wID7HldYEdw==
Date: Thu, 4 Jun 2026 13:59:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: linux-next: manual merge of the arm64 tree with the origin tree
Message-ID: <aiF2o4cf4wstWbxN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uNlBcslpRNHnc5PQ"
Content-Disposition: inline


--uNlBcslpRNHnc5PQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/kvm/hyp/include/hyp/switch.h

between commit:

  8372633074898 ("KVM: arm64: Correctly cap ZCR_EL2 provided by a guest hyp=
ervisor")

=66rom the origin tree and commits:

  e1b163e405534 ("arm64: fpsimd: Use opaque type for SVE state")
  2768101b39765 ("arm64: fpsimd: Move SVE save/restore inline")
  1277531fca43d ("arm64: fpsimd: Split FPSR/FPCR from SVE save/restore")

=66rom the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/kvm/hyp/include/hyp/switch.h
index 320cd45d49c5a,1f12c4ba295a4..0000000000000
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@@ -468,10 -466,9 +468,9 @@@ static inline void __hyp_sve_restore_gu
  	 * The vCPU's saved SVE state layout always matches the max VL of the
  	 * vCPU. Start off with the max VL so we can load the SVE state.
  	 */
 -	sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
 +	sve_cond_update_zcr_vq(zcr_el2, SYS_ZCR_EL2);
- 	__sve_restore_state(vcpu_sve_pffr(vcpu),
- 			    &vcpu->arch.ctxt.fp_regs.fpsr,
- 			    true);
+ 	sve_load_state(kern_hyp_va(vcpu->arch.sve_state), true);
+ 	fpsimd_load_common(&vcpu->arch.ctxt.fp_regs);
 =20
  	/*
  	 * The effective VL for a VM could differ from the max VL when running a

--uNlBcslpRNHnc5PQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohdqMACgkQJNaLcl1U
h9AngAf+M6xbUe60zQOvSdxf3yuP4OEazsvB92SjkrFyVDCWPFvmpl41rbnsvsvL
ugwuZhTtt7tizvSWsm8IvsLTSqutMhU6GGBslF6i/vYWICzF6yzQArG14vm4CFPP
6YvUgh77a9MPnjS4QgISB/HgTcRU1aQ5ZVY9xFz+wlJPJUEzt2ny1EFLYQHb4G3K
D97BZ4Sk6aApu1rNtB8c56MA1NZXDGPr5mBjLJRHygspHmNMcZCQ4Yq9V0x7BBv+
RjLaV7jtdyDu6zWe58GHoYC9VAhb4cipV0XI70ypznFUA6hqJ6Zof/um+vftQkUr
0sRXd5LcxTaVEBOu9sN6jOp5E80OVA==
=YHAX
-----END PGP SIGNATURE-----

--uNlBcslpRNHnc5PQ--
