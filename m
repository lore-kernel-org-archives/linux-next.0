Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2248EBF1;
	Wed, 29 Jul 2026 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339275; cv=none; b=D2n/dzyMjPrcaJebt6wV9fbrdxOAbwh4t7sUy4AvmAjKTGPTSBIy99V4DnaqdAEXp2je/xdJST1oATFDPPzAVqijzE3+dvz0fS+ZERncoeMQTIR8f1isoa48gV8F1A5gZmwv09EJB9X35PIUeh24g9E7V6VFcq3EV3aP0ZzBjfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339275; c=relaxed/simple;
	bh=b6QhRZERM5ULJvIUiSAGX87HuUIdROeN2EQIkW/i6hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nwKSwWePU7dnfJMkltfBr8F7OuOcVoWWC18OQwklV603oRLurl87cAZbk7Y8+MlWOT9dzFd1RCZSGEd+XUSUzq2bWjbKOTzAig5EOZniqWif2mT7QCyZIdYKKmA5mCMPrVhj57FJsUwFcsZrzbqAB37pyi52TssH8FvGQt9WVi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtPouK+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtPouK+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6420A1F000E9;
	Wed, 29 Jul 2026 15:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785339272;
	bh=ytm44Vl+89nTHPiCQXHkuZM4XJUIynH6TG7UuWZeATE=;
	h=Date:From:To:Cc:Subject;
	b=VtPouK+cTMwGcHkDFzmX3nGGK16bYemmgWTg7ylts2bLyc97Xe5n9vTMtN6V2crVj
	 P4HRxNTsgTcpRc+ETIF0+nF1XE1yvT0VpsscJyPNkOO+F4a9Is/nt8pBpX8K8UB1+C
	 TbeN/t/LhlJAYjXFlAsWs7ozOjayMRH2BZkR91FxA+fziASfY7ncHKeQXYfqb28hLB
	 7E540NqQbCNTJtCeor19W48IGwy2wlfQy639LwYYxqJIFL/dIU4M3mZINDpQF2mzhW
	 lzlzl/jlRFuzA0GQkg27cuVkkRHY+j6fKvlHqABROA7kqgeKAMZOag5yd6nDL7pk3i
	 GUs/zIFV93Wog==
Date: Wed, 29 Jul 2026 16:34:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Mykyta Yatsenko <yatsenko@meta.com>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <ff58b01c-3f5e-4d55-be82-609d2faaf12e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P2JGnKbkb1reTBqH"
Content-Disposition: inline
X-Cookie: Captain's Log, star date 21:34.5...


--P2JGnKbkb1reTBqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After in the final build, today's linux-next build (arm64 allyesconfig)
failed like this:

ld: drivers/net/wireless/mediatek/mt76/usb_trace.o:(.bss+0x40): multiple definition of `__bpf_trace_btf_ids_dev_reg_evt'; drivers/net/wireless/mediatek/mt76/trace.o:(.bss+0x80): first defined here
ld: drivers/media/platform/nvidia/tegra-vde/vde.o:(.bss+0x180): multiple definition of `__bpf_trace_btf_ids_register_access'; drivers/gpu/drm/tegra/trace.o:(.bss+0x0): first defined here

Caused by commit

   eadc0725ab8d3 (tracing: Expose tracepoint BTF ids via tracefs)

which I have reverted for today.

--P2JGnKbkb1reTBqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpqHYQACgkQJNaLcl1U
h9DBAQgAhnXE20q+jjv9i2FJ+zMNTa95gRHa72dOSifHoFP3WWSpp5RDpz4myZdh
Rd5c0yWmF8Iuf/barj9cMtgB9Zdg5OynPuK+rBzxJ9ySxXcjNb0UQairsxMUzMCp
KHlvbNBL0IP6YPl3i3KWjWqOU1sUv4wJc9M3gRufydvLE3cX/nNRVEwdqrzrxprr
A69AoHvyS38TFbKMf3XLkBemGfECQydCtK3hP7yu7jrJSwt6Cx0C/rBrzF9p1BS8
UfdoBXE5PXA3u45OENYeRfMUUNrJ8hNSX+MCM+taaMEh0DOG9SIZFYVXzRgdr00f
F0D5w4dhW5dmVS97VfO2sAbMuESpRw==
=WGLG
-----END PGP SIGNATURE-----

--P2JGnKbkb1reTBqH--
