Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE8318EF6;
	Fri,  3 Apr 2026 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775227383; cv=none; b=CHkHvhWOAbj9GfaaZt4e5uxzyF44uXcvsVycffHUeGNhbc3QZhL8IAlbJUQNM+v314eUqzQrMYQKAG7W+Mdyqo8fNRF6zbVAwgV4NrcrXwqiTNUUOjBFfHdVsW7DQivvILX6EU6wvqhj1+Sae1JDgm6gEIFOUmYCN+RaBnjdPzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775227383; c=relaxed/simple;
	bh=NNeXi8Y4j3OaaEEhCLtpPPABZ7ksrCmCHM6oFxZr7ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ld5zRcxqyVVxHAjZ4ULiVYIOXd2BeWi0Qm4F5ovnqFQ/krlgmHc3wJg6j4Yk8rvakpcmupBBq5nbojMk0MWW90PT6p1EyQ675cw/f5QphFN8ycFK7KIpE3hJkCCBfNcenbZMgknf9jjZu6tiAWJCeDh+GRg93D+o2e6W2KRoCK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPc5wVSL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPc5wVSL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B77C4CEF7;
	Fri,  3 Apr 2026 14:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775227382;
	bh=NNeXi8Y4j3OaaEEhCLtpPPABZ7ksrCmCHM6oFxZr7ZQ=;
	h=Date:From:To:Cc:Subject:From;
	b=XPc5wVSLe2DX/BryhtBCN3l8gxsfcHoFE3DxUhDHtpz5hMLUGGFK51guKmkkSYVQB
	 B2gkGvsHs2QgFunONZGWk5q4QhstTCvzO7qnHPUitjKy39NeKMBojoTQqakP2tGoev
	 6JRSDJeJ6K3lUEkdUr7Qrs2E2hsv09rctF69yQiPSkVY+JcMcMJscw0lxqqWMTTlUh
	 54cp3BAnSxiPSPo7MCRhMnNBkTby+e3oERShOaGFpeS86eeBWGcja/ZtTuUprF1N1K
	 WvS7PtJu+lA2rH1iTt8gdQDNFcyH2fLcqKcmSRGPA/RBSEAlnDmYExH+VQ+EXY1W7X
	 ER9zp3KMVNFSg==
Date: Fri, 3 Apr 2026 15:42:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the powerpc tree
Message-ID: <ac_R8cR5A-YtcRpi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cSeJNcjFaJG2ggMQ"
Content-Disposition: inline


--cSeJNcjFaJG2ggMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/powerpc/kernel/compat_audit.c

between commit:

  f26ad12356a27 ("powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENER=
IC")

=66rom the powerpc tree and commit:

  9b444349a2e96 ("powerpc/audit: Directly include unistd_32.h from compat_a=
udit.c")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Deleted the file as per the PowerPC tree]

--cSeJNcjFaJG2ggMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnP0fEACgkQJNaLcl1U
h9AyKAf/dpJkjgmieexeeafjOojG6WBKQQmCTyWgj3yfGPujALL/kNbFFZqM/WNd
TIH9S8sEzUtz7k8v3AMy234XKip6DJ+tBR/PbGB2NYizdf37UuNkPwURKAjqK63g
zn14+9VhPG5pGMhpmA6EFolwcp/Kq9lX6H5eFUJ5JyJr+PO11KGrsQtNPOzx1+OR
FLpxXj1MouupVfU/0R+VGUIQ3Uo07nk+kvB1VkugyvbwZOWov5K1UfhsCryyQ8wW
+hhtrA7/mxODzVK8yVZoqOhoDhJB73y7z77z3iFNwKKpYPy8tHcV6sbmouuDw49E
m5+GS/ddspPiL3mOT5V9RzdXwnqYrg==
=/qGW
-----END PGP SIGNATURE-----

--cSeJNcjFaJG2ggMQ--
