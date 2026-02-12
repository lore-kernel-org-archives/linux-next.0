Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A634AAF9;
	Thu, 12 Feb 2026 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770905302; cv=none; b=elLdfWruk3rR65L1oB4Rv6NwlQfIv057zfFT9A45EPESiXLk9XEjyZ7ELEml31YW2HfdSpk6Sbe8JmbdFoPMnHEbqzj05RQXa9owP3OSHVciVBRxSBA/WJMNV3JObOdWDjgA1DM0xRmAkDOSfSm/4x+yZcKOWqscSSzAfEX94UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770905302; c=relaxed/simple;
	bh=8qKk7LI7ir6CHOiBjLv29GRUA53VGm3Z6g3KOe4jiSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hU3CFCZjUYj9IHgU5HqEmAiuEsyHgKzbJ3mP043WxBr4DzFRsXu3bPw7VXnMsq5pSvkfXvDX9/Kn5Pi7zYo4/3OD4eNq7fkICRNvjAxGLeU42cNCPTD8VgaHazKawv0RBSTNAmbI5PHwTahZZr/2MqbEvIzUgP6TLdXVPagQR1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVQFds26; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVQFds26"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2BEC4CEF7;
	Thu, 12 Feb 2026 14:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770905302;
	bh=8qKk7LI7ir6CHOiBjLv29GRUA53VGm3Z6g3KOe4jiSI=;
	h=Date:From:To:Cc:Subject:From;
	b=BVQFds26HOUOapJJ9gcDm8pY1aQZz58uOY1CVj0Zb+thnm1Fhm/9l+rpDzyjUf8/w
	 yWNynL3K6cxRD5HAvDw0Z5ObxPz7/j+Juqw1y3V4wviT/TKzsv86YMQgdY1q9E764j
	 bIH2iB5XUe0x8JGiiRd6J/U5D5RPS7IZPdVsTt0Nwn6KGQj32uHp+J/uG3ZwZlZl+/
	 VBP4CQ3BDy+Lq4fDfmrNDDLxtxUR65l1lQQ2FszjYEcqec3DfW4Jp3wiHcycwDtuO0
	 /Q/I3eTMPCYG8lqEzPSf/r9QuL10hbIQ6szIGiITw7b9zn2oX/w8LVn53N7NIMbY1B
	 2zS7ooFDPSn9g==
Date: Thu, 12 Feb 2026 14:08:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the kvm tree
Message-ID: <aY3e0hIT1UDqLcvK@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jKU4F4zZ+VvvUtiW"
Content-Disposition: inline


--jKU4F4zZ+VvvUtiW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got conflicts in:

  arch/x86/kvm/svm/svm.c
  arch/x86/kvm/vmx/vmx.c

between commit:

  9e03b7caf4e65 ("Merge tag 'kvm-x86-misc-6.20' of https://github.com/kvm-x=
86/linux into HEAD")

=66rom the kvm tree and commit:

  f8ade833b733a ("KVM: x86: Explicitly configure supported XSS from {svm,vm=
x}_set_cpu_caps()")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined arch/x86/kvm/svm/svm.c
index 8f8bc863e2143,5f0136dbdde6b..0000000000000
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@@ -5389,6 -5389,7 +5389,6 @@@ static __init void svm_set_cpu_caps(voi
  	kvm_cpu_cap_clear(X86_FEATURE_MSR_IMM);
 =20
  	kvm_setup_xss_caps();
 -
  	kvm_finalize_cpu_caps();
  }
 =20
diff --combined arch/x86/kvm/vmx/vmx.c
index 967b58a8ab9d0,11bb4b9332274..0000000000000
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@@ -8247,6 -8247,7 +8247,6 @@@ static __init void vmx_set_cpu_caps(voi
  	}
 =20
  	kvm_setup_xss_caps();
 -
  	kvm_finalize_cpu_caps();
  }
 =20

--jKU4F4zZ+VvvUtiW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmN3tEACgkQJNaLcl1U
h9Br4Qf/Y3NzyM87g6GnYRrALgRN5OLouaZbnZE7+Cl6tqiFTC8I05ZNqM8WbM3D
08uES7aCMB23sYUiUQx4IByCUG6NH4oO/sqSn13nk3jLGnkueh+pU2PXHeBpueVH
VysCy3efpBulOtM6PXQbbIGAFMp6jvIqKyYIqdd/Zq/hk44ZRq/98fkVgIjeH8W7
o61tEj+fE5hh7g4S131dcQkr1AIlkZ9+SnTcOND0mGrUZn0uZri0Q4NiBwYNmFML
/C9w6I/S8nV6Ci277X5cQNj5zJJ9DN6DR6vdwLCfc9+trIdvJ/ORUqXx3VYViryT
gbNQo2GPjWqHXU6AJFb0fLmcV0O02Q==
=XCrX
-----END PGP SIGNATURE-----

--jKU4F4zZ+VvvUtiW--
