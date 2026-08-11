Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D612F335081;
	Tue, 11 Aug 2026 14:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786459864; cv=none; b=RIoXjVdbQY073ywSVJokKbRWWtGFPCcJJAyzQrv9meAymP6bZA6ZkIAhbxIwjsO7zZkqf5M7yl+BCjlvfZtZ/yPcmTd4hH9igK0/xpN67/fnyJEcC1qkPUbLfen9aOPlmSt/mG7l1+KdmbzMz2CQCqZl5Y2s7jHaR2xi/wM+Zso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786459864; c=relaxed/simple;
	bh=xzwYX9/LYT3m2zvht9bQpl4E44gjH74FpCNqQ+0keBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MF7nNuk4sn5BUlSyb0GnHpPgeW7FSaloIf54sxQeVPUBuuQnPhlyQlxibKCb6baeWKtsQ0pJ3Smn2IzT5V0zq9JVBdpvc179w0ZfjaikB8dNf3RoPXBAY4Bs2C/YDo3osXebmuHDbmzW3kXiztQXXURdL29E/UD2YitIUVAa3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aieD9pNA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aieD9pNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119561F000E9;
	Tue, 11 Aug 2026 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786459863;
	bh=lZLEFxwHnTjcUy11TS0BSHGRkQLA+a3EgdMErVx/zXM=;
	h=Date:From:To:Cc:Subject;
	b=aieD9pNAlfAvIfnZwOK/VicCryOoCk7Cr5csvdOJlpEUrm2V+mMAbr0gB/n+XXQXb
	 yDTpMJQ7cQsSYYvR5nsDviRNuVcpoIXc25uBIDL43dvh57WiCIiXySKIAAjE+BcWSD
	 jR0FxNTzTmLzdZgzoX2bAJiTvZyxi4YVK3vF11zx7j8sby9lJiYMLY83/No1RXeRy4
	 cW2HOuypxODydNal39O9qHF00/O/ZztkaeuXHDwcG7uphlHGDc+UWu9hdK9DTYo+qZ
	 NUv1zWFupIcgZVuh1jCoD8JlGqFJnTC7xJY/PfxJZx876ouI1nIMFsQht5FhfJyhcz
	 N5FKiFg/zeCFg==
Date: Tue, 11 Aug 2026 15:50:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>,
	Congkai Tan <congkai@amazon.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: linux-next: manual merge of the kvm-arm tree with the powerpc tree
Message-ID: <ans20_e3b_8XJsvA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cWzzLaUfllgGqgQe"
Content-Disposition: inline


--cWzzLaUfllgGqgQe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  ac3e65ddddf31 ("KVM: PPC: Introduce KVM_CAP_PPC_COMPAT_CAPS and wire up i=
octl")

=66rom the powerpc tree and commit:

  ad220e275c398 ("KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature")

=66rom the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/uapi/linux/kvm.h
index 70e36e6a0ad4b,9fc8dfdfd65ff..0000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -997,7 -997,7 +997,8 @@@ struct kvm_enable_cap=20
  #define KVM_CAP_S390_KEYOP 247
  #define KVM_CAP_S390_VSIE_ESAMODE 248
  #define KVM_CAP_S390_HPAGE_2G 249
 -#define KVM_CAP_ARM_PMU_V3_STRICT 250
 +#define KVM_CAP_PPC_COMPAT_CAPS 250
++#define KVM_CAP_ARM_PMU_V3_STRICT 251
 =20
  struct kvm_irq_routing_irqchip {
  	__u32 irqchip;

--cWzzLaUfllgGqgQe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7NtIACgkQJNaLcl1U
h9BhNwf/QYsGL2KxD2WMeeYcQ1th7fwdr1zUEbUMbE5ljcnaiMjrLtV6I9VG0OWb
0X+hce4hNRh8IMJjIxUW2ygGetQ1qxzycpEhuwfE9Dp587MA8VJR5Q6Ml9RSVpbX
X3lTPtJpZ/V/l8Jvmh7Uyw2/PENPUfFSaY5BDNdR9ziKmnSxaLDFupwPZ1IPFXR6
rs2kmRAVADg4G+zttIiTYgKCgVKEGBKZ+w+fzjpSK6nrN3jdnxj+0MYM7XmDZgd+
RG145dO7MMqJ1RrYe4t+47g55hNFw1WRKW+lFB5uIBf8F82zbyK/MQUK65OSN4dK
+/l2ToOyxO+o4rQZps2YfvQf7D+5Hg==
=hvw/
-----END PGP SIGNATURE-----

--cWzzLaUfllgGqgQe--
