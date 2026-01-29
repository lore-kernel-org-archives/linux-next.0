Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47AB3816F1;
	Thu, 29 Jan 2026 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769695912; cv=none; b=I0dIkFvVqJuNnNC+DDpSeeOYlXUxAtoXV1C52F7QfxJx0imISLwhT4gjG6/0pTAGYe2G5z15fpGDSJutjIyVrnELOkPbTXycuz64togNw91j8+3psDQyVgBW1XmWu2dJcme45gjN2sDZjKcjWpmDgN9UJ8F279rCkSiYz6I4F3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769695912; c=relaxed/simple;
	bh=rt792cxRsRoS7WXwtbogcEkG7RT3QhQSeXlAzaE1460=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h7Ve7JHfS/nnmxnLpx90SKAydC64GI2I8AvWxfS+TKtGlYteczgco2Vmyw3NFlz8Wpp5Y8Mw00iTpx2CK+bhobjst1RavAJvzXIQrEydoc5SwomwcMGg7V6GIwfRfmB0/vTI/1+9hsfOCsQ7vOzY5ripnqAojLpsnKcQj9lhq7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4f2ie91; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4f2ie91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAE4C4CEF7;
	Thu, 29 Jan 2026 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769695911;
	bh=rt792cxRsRoS7WXwtbogcEkG7RT3QhQSeXlAzaE1460=;
	h=Date:From:To:Cc:Subject:From;
	b=u4f2ie91V8SKtnnROeWVRNjwZkX6Jc+PIgPDcqzAgAQq/+GeqnhBOZJbE5tp5A3UG
	 tw8kwOyXUQ67oE3EPWQBAGDRaisROsgrkydlG4Lz2qUlt4z93PT9jW4fPIY9a9ERZ9
	 GPDRkjIzTBPmdHpZviWmlffXz5dK8yZNhvH75/+rDXKyTNZrsCOnK/0BCDpxVM/xt8
	 R0aMFp9u0p/bkvYUCIkWsQ2/Vbca0tOxmm3S9K6G1UcrrWmsav8pcqL5EVPo3nh2fH
	 Jrds/8LFB1uwGUiaKhCpdvb2OfXGliAUgJOxHQEwPBULdF7WaJuo4k4qUyWmYH0WOb
	 BwQY61vMuSsdQ==
Date: Thu, 29 Jan 2026 14:11:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Hanjun Guo <guohanjun@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: linux-next: manual merge of the arm64 tree with the arm-soc-fixes
 tree
Message-ID: <aXtqo7r3bSDMNBek@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c5rvKRlEFFMkgLhc"
Content-Disposition: inline


--c5rvKRlEFFMkgLhc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  MAINTAINERS

between commit:

  59e82a4237cf3 ("MAINTAINERS: Change Sudeep Holla's email address")

=66rom the arm-soc-fixes tree and commit:

  e97e3e31d8988 ("MAINTAINERS: Update the maintainers for ARM64 ACPI")

=66rom the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f0cc26c652f6..72628180aa3a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -336,6 +336,8 @@ ACPI FOR ARM64 (ACPI/arm64)
  M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
  M:	Hanjun Guo <guohanjun@huawei.com>
- M:	Sudeep Holla <sudeep.holla@arm.com>
+ M:	Sudeep Holla <sudeep.holla@kernel.org>
 +M:	Catalin Marinas <catalin.marinas@arm.com>
 +M:	Will Deacon <will@kernel.org>
  L:	linux-acpi@vger.kernel.org
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained

--c5rvKRlEFFMkgLhc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7aqIACgkQJNaLcl1U
h9CtZAf+L+6kV7cJsKLxEKbGzc8UtyB3fYx+IfHn93SFm4lxmbzkwf3mTvfTkW4p
C1mZU5+6Kmwxph5kMlRPGu+hyINvysHvO7aLResBY1pjl0RTGfUbtGedH3aEfL64
bqXp49dkHJGEsO50x7Wv4FMpjR8onCbwfmJisiWLmSC/3jfaw/3KXUcomeJe7u6R
rluldkRDbnrz4N3TVvzTAc/FHFdnqYpfg+dU38rzNjKASzY8zD6ep1iIDzk1AwWZ
Gdz2kqEG9FsIB99TQhPs/n69G0cxHXsDl3Vu5JhepSg2LI4IcupjqEomyykvMdVB
i/v/9WLZ4KlcRq9l5wF8t2j5EtSE2g==
=eGh4
-----END PGP SIGNATURE-----

--c5rvKRlEFFMkgLhc--
