Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF9437B011;
	Thu, 12 Mar 2026 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336116; cv=none; b=B/8Pd2lPg1Fdj5iHtzBfBdYGkjbm/CvSll2jut+z1SXMfLABnGtose5ayv0roLkYkURf+RH7L/5f1rxkqMYdtyKYJzM1/McKZIYYdkExZdawmr2WKnb5eVE7njKGBzhY8jrsI3hbiAYxfRfjIsxwOUbG8xg6xvLEZt2+6hRKq2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336116; c=relaxed/simple;
	bh=ZnumChsu9TL5PS/aR9BWNSOOjJabFh6+lF4CSUCedBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=chWcNLE1HJhlWWLjXY2nCPEE36pBZBZmM11LSgZnXoMlWfm3ydZwQhKAsKaLl9mIEVAYDz6+n9brHbpnCvRWXT5Zep/Sj/BGyXyFGWsg5Y7iCSkEkpHFzUTgPTApTRZ/AqZg+qz0s+yEF262SypypF0FVZI4eBhfZRh07T9HF8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvRO3h6X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvRO3h6X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347D0C4CEF7;
	Thu, 12 Mar 2026 17:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336116;
	bh=ZnumChsu9TL5PS/aR9BWNSOOjJabFh6+lF4CSUCedBQ=;
	h=Date:From:To:Cc:Subject:From;
	b=MvRO3h6XNyXrx0P+B0NKShdYtmdbRF0e68FxACw1CeucHx/C0nZTPa1IL3cqGunaO
	 OM0zC2Mv3edAX0VT3k8PCfqdlx+X7s/JwV5vAtVue6OStQJd18BDG7DLGxpDul3VZm
	 CpcgZC82WRZl+NSocC4rZLY78lFrqYWZlsTVgfabYAeS5ST/yfvYnmBNg8NKIColjp
	 CehX31fz1fRqZDwjyOgPtViqQFxA92hL4ujBtVWIK2oqhAARnqfzf2iU37xYnn6wni
	 3ToPMkY5bIRftox+i7BsgwS1Iu+OMT4KxDuhL7buyt0t76ca1V1P2gl6hSPnyBUqmr
	 eDxeGwUtLyxMg==
Date: Thu, 12 Mar 2026 17:21:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Yosry Ahmed <yosry@kernel.org>
Subject: linux-next: manual merge of the kvm-x86 tree with the kvm-fixes tree
Message-ID: <abL2MPhXKOn_Zdz9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TyqfN1doM8m6JuYM"
Content-Disposition: inline


--TyqfN1doM8m6JuYM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/kvm/svm/svm.c

between commit:

  6b1ca262a943a ("KVM: x86: clarify leave_smm() return value")

=66rom the kvm-fixes tree and commit:

  84dc9fd0354d3 ("KVM: nSVM: Cache all used fields from VMCB12")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I suspect this may be flagging an issue with the merge I just posted and
removal of the check for the cache...

diff --cc arch/x86/kvm/svm/svm.c
index e6477affac9a0,3407deac90bd6..0000000000000
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@@ -4880,15 -5030,11 +5030,11 @@@ static int svm_leave_smm(struct kvm_vcp
  	vmcb12 =3D map.hva;
  	nested_copy_vmcb_control_to_cache(svm, &vmcb12->control);
  	nested_copy_vmcb_save_to_cache(svm, &vmcb12->save);
 -	ret =3D enter_svm_guest_mode(vcpu, smram64->svm_guest_vmcb_gpa, false);
 =20
- 	if (nested_svm_check_cached_vmcb12(vcpu) < 0)
- 		goto unmap_save;
-=20
- 	if (enter_svm_guest_mode(vcpu, smram64->svm_guest_vmcb_gpa,
- 				 vmcb12, false) !=3D 0)
 -	if (ret)
++	if (enter_svm_guest_mode(vcpu, smram64->svm_guest_vmcb_gpa, false) !=3D =
0)
  		goto unmap_save;
 =20
 +	ret =3D 0;
  	svm->nested.nested_run_pending =3D 1;
 =20
  unmap_save:

--TyqfN1doM8m6JuYM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmy9i8ACgkQJNaLcl1U
h9AAYwf/YyDGa+La636B6s4xTFBNFpe8wgyRDEdVZxarfqYSZRYPkRJ3iI+460ng
oMr6aGni3aUNeT1o2AcUp9M7kmGfOEeeCZCSa7aWzBtucp2tQaBHFE+oncAAOx64
u3f2nZ8QDYLz4v4z7evn2GyGaTa2obKTa0IjcYdHJA6nYkgFF8BknpW1lq1V/Hkl
gGs14NSJwtvgrsjnKxrbXhwgVBSx0Fgqb0Cq+GI5ahCdwz5HfxnwlC1JSD/0mNvD
5dKHskk9KFKpQF8I47vB965gSVa4y8diUfeXTPVmCp4v5/+BoysSyX5nAeQOWbTg
piQuKVvniFZ51iMcXGE3KZz4PZaBGQ==
=b/tF
-----END PGP SIGNATURE-----

--TyqfN1doM8m6JuYM--
