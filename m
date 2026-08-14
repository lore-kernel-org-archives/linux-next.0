Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79E93A9DBA;
	Fri, 14 Aug 2026 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723987; cv=none; b=KuTc1sAuQAOQ9PpVYEv1ktBNf4zLpozmooEu8tZG4s5z+g1n8nx33AuVJFqxX3fJ5JIqHL/m4xsWoE85QavJ7v90pulSU/0S93kmqP/TVERBf3+Cjyp1vAvW/bG3PCN2avRmkkAh3Q92qQcqegtlA/oJ9/6iWOWU3Auo1Q4Ds3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723987; c=relaxed/simple;
	bh=EYOxkd4UHYqJKmtjtQSSn7b8tPqa/mnCg36OtGGysBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/nWyw752twOFf6VSSw84/pEi4ls2AJYiSu2kvYA6tz2tP60Mu8+vPb5eQ3y4AC8riBuDxgqZC0vQCi91RffJ1YVqlKdASB+0ToKlnKk5g1Uuj3PD0MBKT/g23Tga37XcXQJCt868GUcGDfBu7TzM05ZmM8e4mrh88eppHAWTaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6Wd8tcL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6Wd8tcL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0541F000E9;
	Fri, 14 Aug 2026 16:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786723979;
	bh=0GUK+NGdlu7jSk4REVUite5f3pFmQ85eHnIH2kij4TM=;
	h=Date:From:To:Cc:Subject;
	b=b6Wd8tcLVZxeO+bTVz7MBo0X6wrblmyvHMXIu8hwJGlsFkHkUEgglR4LTM+C7aV/G
	 wFK8dgSWivgi6/TC4e3IQAyXjT4vKaGd95pqLL7d88DHJhlID6Mtywob3EpX0FMfmp
	 6gQxF13iQK5sB/pYYAX1L3L6zXPYDI6Ftru84GI+zA/fBlG/hlm4HQxpNV/qtNDozD
	 LFXJCB/Lb80s7LJ2Q4HWDMukJW92TZMbc85GHDLqvlt8TZ0w0EAccmJ7MPFwunCR5X
	 Sh/Ojq29Sp6L9uxgatY0c5cVtXMU/XpfZwK/tz/W+aPocbsU3S6D1VqLpMpI718VlV
	 8dyOt01UeKo+g==
Date: Fri, 14 Aug 2026 17:12:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Helge Deller <deller@gmx.de>, Shixiong Ou <oushixiong@kylinos.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the fbdev tree
Message-ID: <an8-iMG1haqotufX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pL/hq/iVhCWufopW"
Content-Disposition: inline


--pL/hq/iVhCWufopW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the fbdev tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/video/fbdev/aty/aty128fb.c:2027:6: error:
variable 'info' is used uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
 2027 |         if (!pcim_request_region(pdev, 2, "aty128fb MMIO")) {
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/video/fbdev/aty/aty128fb.c:2096:22: note:
uninitialized use occurs here
 2096 |         framebuffer_release(info);
      |                             ^~~~
/tmp/next/build/drivers/video/fbdev/aty/aty128fb.c:2027:2: note: remove
the 'if' if its condition is always false
 2027 |         if (!pcim_request_region(pdev, 2, "aty128fb MMIO")) {
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2028 |                 printk(KERN_ERR "aty128fb: cannot reserve MMIO region\n");
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 2029 |                 goto err_free_info;
      |                 ~~~~~~~~~~~~~~~~~~~
 2030 |         }
      |         ~
/tmp/next/build/drivers/video/fbdev/aty/aty128fb.c:2001:22: note:
initialize the variable 'info' to silence this warning
 2001 |         struct fb_info *info;
      |                             ^
      |                              = NULL

Caused by commit

  99c188b02c281 (fbdev: aty128fb: Convert to managed PCI and ioremap API)

I have used the tree from next-20260813 instead.

--pL/hq/iVhCWufopW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp/PocACgkQJNaLcl1U
h9Bmrgf/TJj74cqgh1MCqTvgZC4h9K812jEDgKGQeCTxSlVRJKRFNoHPdDG69Tol
6KsJTwfg9PBk+Me9Hf1BnG9Ed3lQ5MbNVBB9hZGfi9TH5S+rIbYC+sSxTg0FAqWt
9saTBi2TJ9CzXI7cZ8yPBShWYG0wMW3cOJe0YrBXlM+pHkT56zBEWcBiAepIblBX
1P6R5KjY/jGqn0v+YJakP26cDJESop77gwXuURQ+B3MABRG2fvaVxDAZ5B7u7PZV
ga6eM8aFRf9vzVYvqwNHO5EQgfVRkTnwXzZGDHZ/dalrH4z+y/RWtdGjncghaN2x
G5/EnZD6ui4wVUXBafMwAjWMpiQRXA==
=Vdos
-----END PGP SIGNATURE-----

--pL/hq/iVhCWufopW--
