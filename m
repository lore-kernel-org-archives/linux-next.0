Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEF9217F33;
	Fri, 23 Jan 2026 22:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769206261; cv=none; b=rKqBghbtJIKBGkOlyIee4lYX2EXL1K6XqheIZ1EcopFqtR8orjFvMliTDyyQt4b/prlgydwTrkXEe+TVsA080UZnNDNDy1XvDDCTpSQV0lcwz9jQzGx2rp0Py67RlFhHn7E8pAhBdfgw29GJsStH4y9YgHZ07V6LNEW05KL7z3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769206261; c=relaxed/simple;
	bh=4plKoS1QILsl9OqieUoLH72/QrGeF0mnam7CydKHYd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=px56wdjl8JVWzHAjc9C107xUIiR56c82io5+ehjiL3RAOM4QtVUcxxeiX+eP8WwBVIChL6PuJsPLCk0y/3UZYS8AVbTtNW1O/LzyfcjuX8Kjspuex+59bmkeDwz2y5C+98+MN7GSN17E3nqIF/nnhfItiWiDFm0Gi6oSfVMq328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfaDX16Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfaDX16Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F030C4CEF1;
	Fri, 23 Jan 2026 22:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769206260;
	bh=4plKoS1QILsl9OqieUoLH72/QrGeF0mnam7CydKHYd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MfaDX16Q6/TNS2aJq1672Stcscq55cDJgA86hCp/nOf0USrdzok6Q07pL3UMTcSB+
	 DoohNrz52pwfdDfmMgN0KjOYUvkhiO8zMzAkgkqurPqLghcJiTt+cWhIzxMczYqprB
	 2c7146N//RIyDN3PpmmXQXcyEzRBBD2rpSx/sY+Phiiz5PXKG4/dsOhxknpwo9w+8X
	 z70AkMtl86t/w/6Y7ITZ3Agsr22pBOfUj59y7HEBewNMzCyOWsoqr5bXUMlRpiqeCn
	 RvVIwdQZ/4fh6Ifs4jZKYg5bp4IKhoUM6YgzeB+fO4QM7eXd5yf7Mk4yViN0GT9HxV
	 4VzbAg7mwtJdw==
Date: Fri, 23 Jan 2026 22:10:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <f0a1812e-4235-4d32-ac72-f2d8f1cb0d5d@sirena.org.uk>
References: <aXPso7beaFvlUYiP@sirena.org.uk>
 <aXPudNLOPmXd-U2O@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FSSNg6mUMZaDKASn"
Content-Disposition: inline
In-Reply-To: <aXPudNLOPmXd-U2O@smile.fi.intel.com>
X-Cookie: HAIR TONICS, please!!


--FSSNg6mUMZaDKASn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2026 at 11:56:04PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 23, 2026 at 09:48:19PM +0000, Mark Brown wrote:

> > After merging the random tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:

> > /tmp/next/build/arch/arm/include/asm/smp.h:73:43: warning: 'struct completion' declared inside parameter list will not be visible outside of this definition or declaration
> >    73 | extern int register_ipi_completion(struct completion *completion, int cpu);
> >       |                                           ^~~~~~~~~~

> Wouldn't adding

> struct completion;

> at the top of arch/arm/include/asm/smp.h fix this?

That ougtht to do the bulk of it, though I see there's also at least:

/tmp/next/build/include/linux/dma-fence.h: In function '__dma_fence_is_later':
/tmp/next/build/include/linux/dma-fence.h:501:22: error: implicit declaration of
 function 'lower_32_bits' [-Wimplicit-function-declaration]
  501 |         return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
      |                      ^~~~~~~~~~~~~

and

In file included from /tmp/next/build/drivers/power/supply/tps65090-charger.c:10
:
/tmp/next/build/include/linux/freezer.h: In function 'try_to_freeze':
/tmp/next/build/include/linux/freezer.h:58:9: error: implicit declaration of function 'might_sleep' [-Wimplicit-function-declaration]
   58 |         might_sleep();
      |         ^~~~~~~~~~~

in there.

--FSSNg6mUMZaDKASn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlz8e8ACgkQJNaLcl1U
h9A9IggAhM77J2EmiqXw40Gw2iuBoBu/hzo8nY6OkvxmJwKnQlSYWrayLgzBH/JG
u2jZ6EsTggpf9vI6wbiqxzKaUQnLuTISWu4GVXNsVcF2QAEGET3pCD8l1dzPAqDq
l8bPFRfbEskjYQ0l+5GDsVZV55Ka9X6Y0jbv8xyF2/qZXkJ62sKz/Bia27VpHjJC
M+pFHnrDa6fa7Fv1Snu1Fyw75MfsNExCTa2rdMFDNaG8E9Y8Kcnsb23dR3JmNwo6
1wJMnJcvhLXBrqK/xWwrW/0HlqRJbGmKn6SdzxpAOjLie2YScKdZlt2LVqhDeBxW
9KkJ4qvn8LiQM1M9MrQT3xyEZ/70UQ==
=O/Z9
-----END PGP SIGNATURE-----

--FSSNg6mUMZaDKASn--
