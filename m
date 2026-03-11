Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E51FA272;
	Wed, 11 Mar 2026 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246334; cv=none; b=HUR8XSLkfmGbBq1rhq/ojMuLylaYII0Mx4uwR8DUL69G0QCegMsVawHKJqPhWdee5KSTFpL+/qCwaHOIAHOFX7E215wWbDJPlMTgZs641rm4XCALcMv9+2ur4BBy+auNUcXM7ea/0ZXWeOd21xCkPNsNKPCdMNWRl7ZCPFW4DKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246334; c=relaxed/simple;
	bh=5IWPVYQb7miSLbS+BCTcLtpIq2UXXAkrqAjn4unGrqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIhkndridnATWfcMPOLvE5HvFBs4xcD8aZKGXWG8Dz9kTc35fTC2TfdA3UNw01YS0Y0BrI4St8e2yYT3zxdP/eGRFvgDDNxq/x01WctaJ4PBtxiR9TD0lxzct3vwmJp+rfJqFXnp0HPgzUu8Mmng29RJNmx8aLCiDU3gmskbWgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIVdXVMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIVdXVMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73361C4CEF7;
	Wed, 11 Mar 2026 16:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773246334;
	bh=5IWPVYQb7miSLbS+BCTcLtpIq2UXXAkrqAjn4unGrqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIVdXVMckEMiWikFyO6yL3cuWsYy+Tx6j7wb/bj+u5JvetbAHROZDdHAyNd9rCNZq
	 EiuXwvPfnqditK+EN9Bm780Q2WjU8YrOEUNQSYFDi35lFqD6NyrtgaHQ4HkyojPqPa
	 WzFxs/oRSP3WZkRTp+0ksF2iKX7SXrGFFFLfwUmV1XCvBkLdjjfU9YIhGA2I5rC0f0
	 T6quG23k/JBFAXiBOVHWAXfTByz6U+hYYog6y4fdtEG2dXarPC463EvzPG47vSIFSd
	 TnpQIHSRCqN7oaUTtNH3sOrN2QAEviK980enfefPFNVflBz4ZgOJlosk2P3p/0DA9v
	 AM9R7KmL/LCPQ==
Date: Wed, 11 Mar 2026 16:25:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	willy@infradead.org, yi.zhang@huawei.com, jack@suse.cz,
	tytso@mit.edu
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <0d21783c-5299-4488-9708-def0b1a4dcbe@sirena.org.uk>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
 <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
 <20260311103743.GK606826@noisy.programming.kicks-ass.net>
 <abF9Ti4pTYnnsMdq@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
 <20260311160904.GP606826@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6HsaIohGmwPXIxWJ"
Content-Disposition: inline
In-Reply-To: <20260311160904.GP606826@noisy.programming.kicks-ass.net>
X-Cookie: When all else fails, EAT!!!


--6HsaIohGmwPXIxWJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 05:09:04PM +0100, Peter Zijlstra wrote:
> On Wed, Mar 11, 2026 at 08:03:50PM +0530, Ojaswin Mujoo wrote:
> > On Wed, Mar 11, 2026 at 11:37:43AM +0100, Peter Zijlstra wrote:

> > I believe this issue is resolved with [1]. However, I think this might
> > not be the same as the issue reported originally as we the original
> > issue seems to be in mballoc-tests rather than extent-tests. I'll try to
> > look into it a bit more.

> > [1] https://lore.kernel.org/linux-ext4/5bb9041471dab8ce870c191c19cbe4df=
57473be8.1772381213.git.ritesh.list@gmail.com/

> I can confirm that solves the KASAN splat; it also cures the defconfig
> hang that was initially mis-attributed to the mutex patch, but turned
> out to be memory corruption due to that issue KASAN found.

> FWIW:

> Tested-by: Peter Zijlstra (Intel) <peterz@infradead.org>=20

Yes, that seems to work for me too - looks like tip just triggers it
more aggressively for some reason:

Tested-by: Mark Brown <broonie@kernel.org>

--6HsaIohGmwPXIxWJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxl3gACgkQJNaLcl1U
h9BWvQf+KZikkGbMQLe8xqSDLn3IcmREN3iRoHsSZD25Gd5bzcLNl5OBatSZTRrc
zi0gzYR5YK7Dh443k5RHjKD62Nyo4fw8pPg52M3zTH+oiuRhQ6DEaeIUVHHCXLc7
1xGT+/lBzMAgWATSTKuG0U7GzL+JSH91tlJAWvkOfWjI8T9YZtFV+jxAlRSqHc5+
Xh4/kxuD54JajJbK7NGkfqobPYwc1Szib4x1/KAELZcPfN6nhuKW9SCirAw3KlwF
tqsQsw30Wxr8ydX344i745Qd3//5iGVcT/1aVjy5050Q0Vk0pXRjsqV7ZLMlukrV
YE7gaLBcyz/kOateXolej/zyPaPnPg==
=4O4k
-----END PGP SIGNATURE-----

--6HsaIohGmwPXIxWJ--
