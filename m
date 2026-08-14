Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A48367B6F;
	Fri, 14 Aug 2026 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786707866; cv=none; b=PlKtiCQDHdTawRUBOlR4Ulrh0UCPJVBGITjpmv1UVndA3PRuTmaWh5nMszFRXWmabACg6t9Aub/GjdNa2cK8++4OxJe/PGercKezSwrylAU8ZkYC+jWuNcaA8EtKZFMja2KwyiPfHiLXNLN5aS0Ov7NxJK8Gc+BcoX0fhSTW1aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786707866; c=relaxed/simple;
	bh=RaTXsMqDwD3+eN5n7ce8EbU4e4m6I1AUj93dmWIQdDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uR8c/BySKcXKnz2tYk53bD4pWYyv7U+RfBzBjZeWyeJ2jrKFpQT7jGhSdlgC5txN5/an7OnBnIByWX+lUJxb3PntHlx70I3+HHqsU6PFg0wvz4YPJizw25qoIDaeCMTNVFS30bhYe83JAsXXMp1Q+PxFvq5tl0ohixTbMMuQWlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0A9fEVm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0A9fEVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8EE1F00A3A;
	Fri, 14 Aug 2026 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786707865;
	bh=z54yRtlBYFLcR2mn3AcOEhGFKrqMNFY0qu1l9OWqllk=;
	h=Date:From:To:Cc:Subject;
	b=V0A9fEVm+IFYnbbLnZX/y1OBwJpJI/GcotQUmPBVIo0ErkBuQWxJdW49FLMNVZ533
	 MmYIODTll5RwGyQ6VSG7pPapMy/zcodZabld08Wkhvf1vnA4NzijY3rRmHiEltAnKb
	 CIxEp6Lsm6NjY1s5tDvK5BABRwOSj5UQVxcU7qhECHLpyebmmyhUjLDAfLaZLxappM
	 yq6ztENmyOlUDtUbOZxmeKrCjiPzALlXA6vqz8WDEBTO+i5Ofs0C5Rhj9CT1JxB/dE
	 KFtALkWcWq0eb6j5fTKFsry6Pjb/L4ui093mlFxjvFsd8oGBUMbyA5j+wheopltauw
	 WrFkPpet8zReg==
Date: Fri, 14 Aug 2026 12:44:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the ntfs3 tree
Message-ID: <an7_ll65komhYG0O@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lzk8Hy19PHUtIp8I"
Content-Disposition: inline


--lzk8Hy19PHUtIp8I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  b594c9962b005 ("fs/ntfs3: fix out-of-bounds read in read_log_rec_buf()")

Fixes tag

  Fixes: b46acd6 ("fs/ntfs3: Add NTFS journal")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--lzk8Hy19PHUtIp8I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp+/5UACgkQJNaLcl1U
h9AUNgf+KRNNYp+7kwl6iK1ONtKJBTa1p90PxtcokptPM1FsYMhFQqA8cSiDZKP7
n8dbmKJTEGM3orV9ZCYL+AvqkLWjAekJ3e3XeYoTervjBGGzPt/Hbj3QvwonC8TL
haEQtQjfXrOzW8MCUupP5VFD+qnnd3P/ToPc9/IXStMwOvw4z/E5B5xneTo63/n5
883gl+AaKR9zEeNMbAOjUp/t5cpnxJYxwWZkiTXiYHM1TTvy52DStZgoMWQseeUW
Q6Ajp5tfPjXMu06cW05jMlHcECcOLdQ9zqHIrfoggTSKc12vd7R0JZeR48ezumuH
YxTufWNUIgDAI6/GkOZkFOzXUkfsNQ==
=vmNZ
-----END PGP SIGNATURE-----

--lzk8Hy19PHUtIp8I--
