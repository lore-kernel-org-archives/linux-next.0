Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384142773F0;
	Wed,  4 Mar 2026 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634436; cv=none; b=Ze/htRW2a857mnzMOaU00WLbMMvq6lhsiuiQS4/R4J56z4QMCMCu/Rv30y8C6oCXpQXqtxJLZApK1z8MIb8BQEwkqghEGvKgjjftDtPQ1oqdwXHX6MZhTH4GEWjk8qxGlx/AmuKcjDo6M6Umiijlk3eQvQQOG4kLTFTMJf1aSb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634436; c=relaxed/simple;
	bh=Es80wMpp1atjNoZqqiG8/9SjgOPQJW7TW/Pe4UalxUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2Uo9RSQduwT2Gpy+wcV0UqB+2W0kvEsr7Fzt3azxnDJN/reCfUjVjTpCNSL0i0xG+0C3D/jEiw4GwwCyMnIv21QHeIVCZrSmFA04pSYHQx89BmEfhotB3uN3Q8TZ0eQjD9Tk7qfDCL0YJv2jRUDFa+lcYrwYyhEUZlRDDIxYZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Akq6zWMi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Akq6zWMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9DDC4CEF7;
	Wed,  4 Mar 2026 14:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772634435;
	bh=Es80wMpp1atjNoZqqiG8/9SjgOPQJW7TW/Pe4UalxUc=;
	h=Date:From:To:Cc:Subject:From;
	b=Akq6zWMimN7VrH4OZdRxecT0Lxvp/xOfecJM39rkSUx++qr4NDHCuEeJg3Srdg5D3
	 7vwz2iiLwsbTMznc66KNIdpHnMiGFxZO6aeqKN5/868rFfDWzyX81o+foR1g65W0SO
	 T+DarO/9H6bEA7gPnnrUS6bfDToMrBH3a7Xj6VAc7481Z56Kh4XtI60XN1pQY2czX5
	 twJVsqr5HEDWZMb4D9IYzLGBjPohVsHoAUoSfX/DdAzmM68iLe6YbffMySI+7GvHhd
	 /J11FwFWSy8YDj9Aoco8jHYDqE/cSBhz23K5jAaiEiTz6TjEU6cBgIcoesU7DcoVS4
	 e/T11An8Mb2ow==
Date: Wed, 4 Mar 2026 14:27:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Xen Devel <xen-devel@lists.xenproject.org>,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xen-tip tree
Message-ID: <aahBPzflrEJ2FPx0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vafmZqH34VLuiaf8"
Content-Disposition: inline


--vafmZqH34VLuiaf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:38,
                 from /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                 from /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                 from /tmp/next/build/drivers/gpu/drm/amd/amdgpu/amdgpu.h:56,
                 from /tmp/next/build/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c:29:
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hw_types.h:221:6: error: 'pixel_format' defined as wrong kind of tag
  221 | enum pixel_format {
      |      ^~~~~~~~~~~~

Caused (I think) by commit

  4e05a08c6f3f3 (ACPI, x86/boot: Remove {set|get}_root_pointer() ACPI callbacks)

which changes the inclusions and I think triggers namespace clashes with
the unnamespaced pixel_format.  I've used the tree from next-20260303
instead but really the fix here is that amdgpu and other things defining
a pixel_format should namespace things, I'll consider if a revert is
more sensible.

--vafmZqH34VLuiaf8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmoQT4ACgkQJNaLcl1U
h9BXbwf+NMgzm+EwZ+oRef+uo7RxieWsON/heDAaLQf7kj0S1+EUF48sTw++m2Xp
iS4EtFT0QNZCVTgH5JbbpxFkv7J9Z+Cycf9M6l9aZTsof8zzGWE1aYvrxXOo3Fw0
0ZXJlPOrxwmJldcQsf3F+rZEVY74BCL24XbQD5qHje5nqKKmlGA+XkjaZXW9KqHL
/icsEcg+PbZR226vH2nrrTcAUj6nX3WVcZw294QDas+N1Un/P7vDr2HOqxAiBzvO
9bzg8mUBf2fcCFQl+rNP88wa6ODwqeN0/w9twk33EVXqcJR86FfMZRvrrdcEc1gZ
Q4CM6t//I3zUfNNsrbV5tb/x3uu4zg==
=c3Fj
-----END PGP SIGNATURE-----

--vafmZqH34VLuiaf8--
