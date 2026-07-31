Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A20429024;
	Fri, 31 Jul 2026 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506483; cv=none; b=kl2SZ8regMSLu1LWY5DDv/YdbrtLYaUE5lTC+SjBb3Rr734d8z1gF8N/YFHSSdnnAIh54nj5zqP24t5QrRNH3Lf8Rs8DmdD/Il0X3hfgKCPS1VlOzdE19gpWIvAU0LFr1TYLge1F8IvuojT1v8cSrYy1bffmXx6LBk9Ya1Vav98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506483; c=relaxed/simple;
	bh=yTGo5oAsG253yf5OxqgbqXMqAemJ4Oh3FPXwAj8pMlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KAmiwYhixsN35L+R0zxLw26yXMYWJvQW1MYX7oAnoVUOAyv+TaOw06BitR5nhGDRSPqbsl9Xvx369et5Pg3CLuMJZUt08f6+9LBG8HmSGoUjVM6TBsifK6C4eGd5qIx2LYSaVTgeleyHDUDCX3w8UOZkDBHWuo4Xxh7Ns3fPzaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlAZpmir; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlAZpmir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A871F000E9;
	Fri, 31 Jul 2026 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785506482;
	bh=6PZ0WJijRuZuS5TZeBNdrf9a2ym0Yc1z/gytpbGG/Vs=;
	h=Date:From:To:Cc:Subject;
	b=OlAZpmir71NWN2aH9mrTbzDGpUhPnIZ6IxJKnKS2m22kGW3o9STAyMWUHGfv2brXQ
	 lKyDQANp/LLWDpLcrWxOdsjJfMarSuq8cjvqfXPYA3Q9C3dbCss5jP7HNfivOl9M0f
	 4dMLxtb+p4ttq3E+Fga6rqKNWg5rlj7MiE5P7ZPgeemNbwqt41HA8ro6eHRbDC/BqL
	 kqLyN4Z7xrugjxP1A4Dnq+Rm9RV+UMYGHDx/IqdKzXv/tdn0m1fOuo6lkEmi6wSDbE
	 KhnJWkmw0YOKRDVf/ThdXTr0HclucMCg6v3pEpq7B5P4xhbf50t1lVIhsJJfVR9xks
	 kFf4ZfZm7Orog==
Date: Fri, 31 Jul 2026 15:01:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the drm tree
Message-ID: <amyqrsMxV02s7iju@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yQ0i3h5uOsp9R5F9"
Content-Disposition: inline


--yQ0i3h5uOsp9R5F9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  0c0d5174b0964 ("drm/amd/display: Increase HDMI AV mute wait from 2 to 3 frames")
  138531c8850cc ("drm/amdgpu: restore UMD profile pstate after runtime resume")
  1d8cfeb69daa8 ("drm/amdgpu: Pack nested ucode_info struct")
  29c0f7c655f47 ("drm/amd/display: Fix divide-by-zero in calculate_mcache_setting on zero viewport")
  2e8e9963cd5c4 ("drm/amdkfd: Handle invalid event type in CRIU event restore")
  314d49abe315c ("drm/amdgpu: enable mode2 reset for SMU IP v15.0.5")
  3ee6561f8ae0a ("drm/amdgpu: Update driver if header for SMU V15.0.5")
  414da24137ace ("drm/amd/display: Add AV mute wait frames to dce110_set_avmute")
  482e2cadea8c3 ("drm/amdgpu: Update message IDs to PMFW to correctly gather GFXOFF residency logs")
  48e1d1e6e8798 ("drm/amdkfd: Add bounds check for CRAT subtype length")
  4c8b8472f85a7 ("drm/amdgpu : update mmhub eco sec lvl for vcn5_3")
  4db4c5ffd5585 ("drm/amdkfd: Fix missing authorization check in KFD_IOC_DBG_TRAP_DISABLE")
  5adb54abe5a8e ("drm/amd/display: check if dml21_add_phantom_plane() is successful")
  5dafdd649280c ("drm/amdgpu: cap GTT size to physical RAM on APUs")
  6f16fcbb0c46a ("drm/amd/display: use proper context for logging")
  757ba0790bafe ("drm/amd/pm: use milliwatts for GPU power sensors")
  764f241ad227b ("drm/amdgpu: Fix __rcu fence pointer accesses")
  862333bb48693 ("drm/amd/pm: fix torn gpu metrics reads")
  8ba869e852d4f ("drm/amdgpu: skip clearing empty freed VM list on GEM close")
  8c990ee9daa29 ("drm/amdgpu: move debug_vm handling to amdgpu_cs_parser_fini")
  a107f74c38edb ("drm/amdkfd: fix QID bit leak in pqm_create_queue()")
  ae443117b742c ("drm/amdkfd: fix uint32_t overflow in EOP ring buffer size alignment")
  b01e244c82c5d ("drm/amdgpu: Enable support for PSP 15_0_5")
  b7d51d65e4f12 ("drm/i915/hdmi: Poll for 200 msec for TMDS_Scrambler_Status")
  da8609eef18b0 ("drm/amd/display: Silence link_dpms I2C retimer failures")
  dcc27ae309221 ("drm/amdgpu: Fix NBIO 7.11.5 offsets")
  f6eed7acfd300 ("drm/amd/pm: fix pptable use-after-free")
  ff57e223ab105 ("drm/amdkfd: hold event_mutex while checkpointing CRIU events")

--yQ0i3h5uOsp9R5F9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpsqq0ACgkQJNaLcl1U
h9CwAAgAhhuH4/xqwPwdWggtToAoKxB/0FmWv8k/4XbPBQSszuNJ1TzIoEBVs+XD
pdokfZ3YtTZpPxZrJSw2PDFb5ptei6yqxGAtELwyfoeSnsmOiucCaJaFazRdvk+u
6EJ2TL/rhkvrXaxbZCN8501WWoE/TPzCc8SWwNxuFDbCzTadsr4pTHqh3GaM97xT
Ge9nvewRWH0esD/vtMp0KXkaRU+shvb8tCUykjoUuvLvq8BFZrBoph+uyDFaiLyx
SMSzpPUvWVx1POKCHzetgjuH/76TZYrXNGSrXGt+qmOeIeguYWM8CajuNPtyKRzN
Q+06+5dVfXRUOgMYf+xSqxZuJN8IrA==
=jmnf
-----END PGP SIGNATURE-----

--yQ0i3h5uOsp9R5F9--
