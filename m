Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C76383329;
	Mon,  3 Aug 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774930; cv=none; b=bNSooEcjTptkVkfdLTIQjH9+TnLZJFaPuOM13DV1fgIiAvckWzsRguKvyaroeSTPCFgL/+hi83uuiQvz8QIG+GWonIfJKYaYCyZM/EEgOxgxh/ivENF3Gj4fid0l/Yovffd3mmnmMZhPl5LDodpKSA4V0xfPdXkibUgJV8+dDis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774930; c=relaxed/simple;
	bh=7R0Ht5zWBho3ambjxTNo8ZdJDpZiQACese40LznCdeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ/HHqa/yhgpzXARM6mO9RSJRaQB4k1/QbqYLEuAS5sHTuBq2tonCrNmecJ0sA7uCb3j3brsDNYFPVIeYO0cqm9NJ96xTCcNzYkEvzyucEhNsRSMNMItsvJ1ktCFglGIJUtGRfQkvqtp88iRKDhsAjbJ3utwv9ZVENl9jSu3JqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4Ghm795; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4Ghm795"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC501F000E9;
	Mon,  3 Aug 2026 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785774928;
	bh=7R0Ht5zWBho3ambjxTNo8ZdJDpZiQACese40LznCdeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q4Ghm795klv51VNXEahz6md1fCtCWjX+Et24gfDbcDpmQKzfUWuqWuV9gKP/P2/AB
	 yjAaGrj8nrHFCBEG4iD4I5ybEF3bo0dCodiLEsrCK8btSqc1kMfSeL3RPxJFD8MMhp
	 0d6LG21SF0/nQjOQRE/pkXie5plGDIsgiS/+OucDaqGU/Icg0+3jGMvoNxoHdapWjM
	 Z7Yi6pTaStQJ4A5o1JzFjhx+En+tQRzmkrR/lPHjQhePWeeg6P2W1b0fstMO+zDNhb
	 dCXKnLFt2gU+MJ/G/rpHIYyY3QHlPEcKD/SADKO4ihyikfCI0XOYt7Sexx5KS0N8Yb
	 Ntd4LJjtrcNnA==
Date: Mon, 3 Aug 2026 17:35:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Mykyta Yatsenko <yatsenko@meta.com>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in final build
Message-ID: <ff3c03f5-fac1-49e2-be18-66f5ff773596@sirena.org.uk>
References: <ff58b01c-3f5e-4d55-be82-609d2faaf12e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jrejyUtzGRw/kI87"
Content-Disposition: inline
In-Reply-To: <ff58b01c-3f5e-4d55-be82-609d2faaf12e@sirena.org.uk>
X-Cookie: Do not flush.


--jrejyUtzGRw/kI87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 04:34:28PM +0100, Mark Brown wrote:
> Hi all,
>=20
> After in the final build, today's linux-next build (arm64 allyesconfig)
> failed like this:
>=20
> ld: drivers/net/wireless/mediatek/mt76/usb_trace.o:(.bss+0x40): multiple =
definition of `__bpf_trace_btf_ids_dev_reg_evt'; drivers/net/wireless/media=
tek/mt76/trace.o:(.bss+0x80): first defined here
> ld: drivers/media/platform/nvidia/tegra-vde/vde.o:(.bss+0x180): multiple =
definition of `__bpf_trace_btf_ids_register_access'; drivers/gpu/drm/tegra/=
trace.o:(.bss+0x0): first defined here

This issue is still present today.

--jrejyUtzGRw/kI87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpww0wACgkQJNaLcl1U
h9Aw0ggAgxa6W6eH9AfVzwxwr3j6c1upWkCPa5LMZDMVed7EQIhkQxg3kF5lPtRe
9/BNnfR13p89OGJIOkqv/bQtuuqcdGCHQVCF6usYcnFKpnbVcqZja2Xy7mRtiwyW
eZj7+bzM3LOQCWCD6psIrPiKrFulfhqRXJqIB4xxmxCIForOLdgCSRkTOnnKgeN9
03JyRaMJI0OoNPjxIrGNnLIzXsml/S9gmEl9zJS6lsKaSYQORAx9OZqkiymOdwwg
LZIpeMFL15Y0f8/cvhvOCkVbK3cCGNKVgs0jPWykCAF0Ca62mDjmFWLPiDv3f1cS
QWOLQ0NneXVeL8lJYAV1g/rLbzzV2g==
=3Ezg
-----END PGP SIGNATURE-----

--jrejyUtzGRw/kI87--
