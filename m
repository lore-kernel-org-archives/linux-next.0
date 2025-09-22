Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223B82FD1B6
	for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 08:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528582; cv=none; b=P6L6KZt/Fk5HT6/YdrgORLQ5+QdVURyfVMFU/Dux80xrrVxL2lBQtdyYkFCQrPrtWda65Vl3Ow9dkti4DNhhw4laaI/GJXtrj7gejrDbTUEN5zxYEX2PeOHRagk2LmzCjwLn/8vOQzxdL4yCSI/06+UQ/q3/8ixrbQ9AC+jF2MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528582; c=relaxed/simple;
	bh=JfTOrXi41G88GiTMFEWzTNipZ4wOLsnitQ1hLiqxRlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iM06uqc3xfLbtJ3d8xmw95Cgf0b9PiuGJLzbSPD0H8SgdzpnVPYJnaP4+mRrfhsYWMZfRLwwWuTBKdXbjOM5cct71z3C8HiwG9D4I3IhFAzCQbDEVpyppwlNorf+rX+WcsYfl0LRYQR60/dfQW73NrLZnbRRGvo/ckADC0tA8U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8f9stek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8f9stek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BBFC4CEF0;
	Mon, 22 Sep 2025 08:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758528581;
	bh=JfTOrXi41G88GiTMFEWzTNipZ4wOLsnitQ1hLiqxRlE=;
	h=Date:From:To:Cc:Subject:From;
	b=Y8f9stekpReo4rshJmaVcmbCEXk733X04PxG104ZvPllz38KhA2T88/7OsrWl4GTc
	 5JTxAvBWt2x0J96k8CzwmK/VN2MY4yoGfimZByYAn2s7dFzfF1iY8YscKCozYHBAbs
	 kkWZN7mZWj0HoiMxCbmfA2hjwgxLm9fmRNSH4V4A28d6mqSOzeWktfYeZs0Y+jjItD
	 ZzTAVgLWMPm/tSI56ncOAWZlKuNvOaOteeflSDjawD8ujOGYGxoQoewjpkzKijoHOz
	 BKgH6u+iHCVAw98lXDJs4pdWRrmpiuxm5Wf4yXAObXh16+nDqZfPATBguqPBVBkNnl
	 iCEuN7lO7sJMw==
Date: Mon, 22 Sep 2025 09:09:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-next@vger.kernel.org, linux@vger.kernel.org
Subject: Fixes issue in the kvm-x86 tree
Message-ID: <aNEEPyEdykM0QoSX@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kv3y3oVpFS5C3q75"
Content-Disposition: inline
X-Cookie: Filmed before a live audience.


--kv3y3oVpFS5C3q75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  eab8d9779f5f7 ("KVM: x86: Move kvm_intr_is_single_vcpu() to lapic.c")

Fixes tag

  Fixes: 2f5fb6b965b3 ("KVM: x86: Dedup AVIC vs. PI code for identifying target vCPU")

has these problem(s):

  - Target SHA1 does not exist

--kv3y3oVpFS5C3q75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRBD4ACgkQJNaLcl1U
h9CpuAf+NX4bpuf/xM3tF7hE2zimRU0seqIs+X6Eux6QNoBbiSeFAsKQqlBZ0tn7
GX2zQD02pP6RQ7M+ODp3GhvJ4LLxnHB52weQJiGrH/mR+1DSPd3ls2Xei61uLai4
XjQo5rJEy5y0JCyyxGP0ESLLQOEd+1XtIFzgZdpVuYJlI5CKy+puscGkan/+nPix
EV6Dq2rYTHdq4/zzf7zIho3T5lMMAVoyO5kFXYG0SUyIAStJSmiTMezjRsgzrkl/
fTS/GZ8xxDfBDcV0M+yEwNI2Om1sFxEQS4X3yux7h+oxhIGbP+4w7ww9Ns1k7ps8
MHL1JatZczBofkaD9hEL2zctZXFlcA==
=zgGV
-----END PGP SIGNATURE-----

--kv3y3oVpFS5C3q75--
