Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A231D6187;
	Fri, 27 Mar 2026 20:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644115; cv=none; b=pokHpQVw7J3vHk8y+EakDegb9H+Dwqv9bcpMbYGHU2PpHU8rs+Fr3sfIXC6f3+ecidnRBht/h0nly7J9lUu89bW/i5/DLAea12FDwKBUlSkNpPMbsBbnzRGBy2uEQTvw2ZhL6w8NU1Qn/VL8N5xUngA+pipurBWxvYsIAJmw1yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644115; c=relaxed/simple;
	bh=ADGQzWbUNM6m9F+4muW8xXtClUK4rUgG+tqdRUizb3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZypwTGtNu/IBrcyDh7caLIR3Mw9r1Gx52ixOvSIlTNNNNtq+yHdfRBOaDM72f72i4J1WVBYPDvHeJxfJPXzooW998uRHMC3sChhrrETfmPXig33WSXEKur7jSL0z7rVLPd4l5OifdYdYBoL9i7S1klKz22LJnYmbMo4x69VrAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LII5tpdM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LII5tpdM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B88AC19423;
	Fri, 27 Mar 2026 20:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774644115;
	bh=ADGQzWbUNM6m9F+4muW8xXtClUK4rUgG+tqdRUizb3Y=;
	h=Date:From:To:Cc:Subject:From;
	b=LII5tpdMuO1eKTrbrdnROAtFQTZQ/WjHy4uhx3iZUx9y4uwbTYyoCBTPfZ8Ay3Gn1
	 TyJ28KadYGQhvVLoyi8KDOVAoRvQbmzA3LehWwjDX6WiQq8eANxwz5KnT7XV9FDCbG
	 CfPrvaVW9hl0VPbzKnvPGCyGFvxQ9ym9joc2JY4Pw1H91ZZNCSkppcFb1ZjpJ0HByY
	 B0K594SX/MBymIXdH5Xod3luobTiH38rxAamFGwE/Q3b/83pFOyCJY1lpMAw7gyls0
	 Y51aO51Mu4GNn+qEEPGc8ZaTjyNN/oBVA9wSjPF52Ry94NlQJnJK5i3HSFk+X91m0n
	 t2w6TEIUVoDFQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 858201AC589B; Fri, 27 Mar 2026 20:41:52 +0000 (GMT)
Date: Fri, 27 Mar 2026 20:41:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <acbrkFFGPIVppK0B@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a/jcryRj6rMzbsOR"
Content-Disposition: inline


--a/jcryRj6rMzbsOR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:
In function 'intel_vga_disable':
/tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:68:9: error:
ignoring return value of 'vga_get_uninterruptible' declared with attribute
'warn_unused_result' [-Werror=unused-result]
   68 |         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:
In function 'intel_vga_reset_io_mem':
/tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:93:9: error:
ignoring return value of 'vga_get_uninterruptible' declared with attribute
'warn_unused_result' [-Werror=unused-result]
   93 |         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors make[7]:
*** [/tmp/next/build/scripts/Makefile.build:289:
drivers/gpu/drm/i915/display/intel_vga.o] Error
1 make[7]: *** Waiting for unfinished jobs....
/tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:
In function 'intel_vga_disable':
/tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:68:9: error:
ignoring return value of 'vga_get_uninterruptible' declared with attribute
'warn_unused_result' [-Werror=unused-result]
   68 |         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:
In function 'intel_vga_reset_io_mem':
/tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:93:9: error:
ignoring return value of 'vga_get_uninterruptible' declared with attribute
'warn_unused_result' [-Werror=unused-result]
   93 |         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors make[7]:
*** [/tmp/next/build/drivers/gpu/drm/xe/Makefile:207:
drivers/gpu/drm/xe/i915-display/intel_vga.o] Error 1
make[7]: *** Waiting for unfinished jobs....  make[6]: ***
[/tmp/next/build/scripts/Makefile.build:548: drivers/gpu/drm/i915]
Error 2 make[6]: *** Waiting for unfinished jobs....
make[6]: *** [/tmp/next/build/scripts/Makefile.build:548:
drivers/gpu/drm/xe] Error 2 make[5]: ***

Caused by commit

  dc582b5ed4b749 (PCI/VGA: Mark vga_get() and wrappers as __must_check)

I have used the version from next-20260326 instead.

--a/jcryRj6rMzbsOR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG648ACgkQJNaLcl1U
h9AShwf5AXw3zrYYUIsh7A3Pu9Jv+arGDFSgZZ4HiUQe3czjsOKqGPbriWl1MsEa
fryC7TvPIea2JvObDpC4aa6yTUcSQ/6hi2Ohb8l/KtP+xgCHCGNzNzMnCyHfcbEZ
KvxjtvbZ5wug+ftqSATpDb6uoGw5YEeUPY4YCVvp3fK3si1gxUprlYmJxmeEkifH
PPuTixJwg0dTPnX+hXAJ/KUiRHnAuxxXr3uYRb7MHFIJJVoRbKj/n6dpU0DN5z6M
rHr5zY2m8kPrkTrdiv0wYe6waA0D3Ugc4B/jihEkq/vxi2hhcg3GGMOfwxvUQ15d
MUGWSMAcBHNLwDWEcP1wCWSURPVlOA==
=FKQ5
-----END PGP SIGNATURE-----

--a/jcryRj6rMzbsOR--
