Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UBnbg6h8"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E842103;
	Thu, 30 Nov 2023 19:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701401140;
	bh=DIlkwIVngCXUlbUdYKDCc4nalkRk+ZcOp+5ydaezr4Q=;
	h=Date:From:To:Cc:Subject:From;
	b=UBnbg6h8UVJT1iiQhKI1VIuigZr0tj3aESzjV+zmRe0JNtstcqXLmJ7IOgWv6R+e1
	 i0tJxc89yf9WXVOITXZqQwhNzQKCAo04uhyNXmV+PSWuLcVjiYRqCwQUmhApV+xFIR
	 dZdUO416m4So09jZU4vAB8PsmJOSrge5ecv3pDvKyd8ppGUNvL3AWINZHCvshXoLgp
	 k7GOicil3BCJgArF0iRdDogFGI5vf9yC3RNuFd8otzM/UmoIJv1B/OJgpqXdur8xpg
	 ROI+GqnsD1orfG4ATOr//+i2zobLR6iVkSpalMzbcTiuldif5QGUKsGE3zHQNSp6js
	 syWyS02QAT/mw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ShJNh1n4Vz4wdD;
	Fri,  1 Dec 2023 14:25:40 +1100 (AEDT)
Date: Fri, 1 Dec 2023 14:25:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: David Matlack <dmatlack@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the kvm-x86 tree
Message-ID: <20231201142539.7519d330@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QN9cPAROIKfrVSW.Nqu+9.z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QN9cPAROIKfrVSW.Nqu+9.z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7cd1bf039eeb ("KVM: x86/mmu: Fix off-by-1 when splitting huge pages durin=
g CLEAR")

Fixes tag

  Fixes: f2928aae8b9a ("UPSTREAM: KVM: x86/mmu: Split huge pages mapped by =
the TDP MMU during KVM_CLEAR_DIRTY_LOG")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: cb00a70bd4b7 ("KVM: x86/mmu: Split huge pages mapped by the TDP MMU =
during KVM_CLEAR_DIRTY_LOG")

--=20
Cheers,
Stephen Rothwell

--Sig_/QN9cPAROIKfrVSW.Nqu+9.z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVpUjMACgkQAVBC80lX
0GyDtgf+OpTfmqyAzEdFzJGgf2YSYfiBgtKMcDXaQqKwFvXAs3pQ6FcudtKGtRvE
qmvJS55kzr7qC8r5eEMT4sG2EZVWrs3jPZiyJTyEYvvB9wv4Ao2hOubI0Hl6YUcS
M/AnWlnsra2UQ1lewRdvLLzlNh2led98sPbi9ZxH/z9/XQdQzFuiIufLIK3h48QS
UAMVHVw/TikUvhGoej3dR6b1t/PHiDryWQD9XiRhwQLfilRIeLaK9YO5aDVmVEW3
M3aVR2yjov42uBt6mOllbJVvByrsO7kVpabp44sqqNBihr7vOMsdi56TF2Xli9tC
FximdTW9XytRPUf3gNmxK+Dra9qQeA==
=ITZB
-----END PGP SIGNATURE-----

--Sig_/QN9cPAROIKfrVSW.Nqu+9.z--
