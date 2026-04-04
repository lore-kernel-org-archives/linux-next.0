Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5562459CF
	for <linux-next@vger.kernel.org>; Sat,  4 Apr 2026 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775315135; cv=none; b=HAFuanlZz6pAdqoMktuw4ZvJsSxTJVTuW51ElPihyE3a+YZL5JltofGosml8i3Ctib9HZ9Apu9inK6RPVn1KYzyZ/+1j7/t5Q6hvDZTQslXam47MsnuRTtqARsGDAgT13iWIyEuM6MaTuBVq6OZVax1PfzZuIlmI9JdRf7HehQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775315135; c=relaxed/simple;
	bh=TSc2jAHYZsT77yaTv2TXe7mO2GpddArozVJmyzC2NLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzeaQTEYBUIsQMdig56BSa0SFchU2s+qZJjdjf7/rmg0m1+cOqAFxQefyZE38ugSJpVFxh4JuDMHeeTQGi9uiVDJf4fzDVyRTm563CkQVxupzoRlJDHB8RkXiDtmy5OHden1pNp2SMdarGaMUsLdVLcIukRur4Fjc6/9cVHIbW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlUr2Mpx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlUr2Mpx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9A8C19421;
	Sat,  4 Apr 2026 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775315135;
	bh=TSc2jAHYZsT77yaTv2TXe7mO2GpddArozVJmyzC2NLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlUr2MpxTeJ8Wg1WwTvQMyMqCy/2o9rDkS547xcrAXFJy5gvgGIYiaDv8XYUx48W1
	 sfsedVjB7gmdt+luscOM3JK0+A/R4BH5nXAUOT0hBX3SOdcGW4V+sYWzfv/Ah4dc5I
	 ItlGWQReStTf8kMvBXJXJHEd6GcQ/xFriZX6YNJwd/n9cTvAuMzkBwenME2SpiSxrW
	 ugDoZfeEam3Sij3AF01cXybMTv1p2YcY7sxWNNQM6iyNstGRHgPWrVwcJAxVJqfUKR
	 Lzpf9sYerq1/RMMigU06zvb43j+otySl4hzGcVAwGb82UgMQlaklLwk1HRVuP6KA6W
	 XKkWGrodIZlWg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 985941AC52C7; Sat, 04 Apr 2026 16:05:32 +0100 (BST)
Date: Sat, 4 Apr 2026 16:05:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Subject: Re: Please add rust-i2c-next and rust-i2c-fixes to linux-next
Message-ID: <adEovA9D9FxlZbbq@sirena.co.uk>
References: <02908210-0ed5-42a7-b725-8bf70f936828@linux.dev>
 <20260329105919.73dea963@canb.auug.org.au>
 <b239bb2f-15d3-4d30-9b3b-8008864d8d62@sirena.org.uk>
 <ec1752c1-a170-4473-9ecf-d6d93b31dcd6@sirena.org.uk>
 <e41bf6d6-810a-455d-81cd-9104d205524e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aDvzLaFM62YmNpVX"
Content-Disposition: inline
In-Reply-To: <e41bf6d6-810a-455d-81cd-9104d205524e@linux.dev>
X-Cookie: Are we not men?


--aDvzLaFM62YmNpVX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 04, 2026 at 03:50:59PM +0100, Igor Korotin wrote:
> On 3/30/2026 2:12 PM, Mark Brown wrote:

> > BTW I note that both trees have the same content and that looks like
> > -next material, I would expect the -fixes branch to be based on Linus'
> > tree and only contain bug fixes.

> Both branches currently have identical content because they are newly
> created.
> If the -fixes branch is expected to be based on Linus=E2=80=99s tree and =
contain
> only bug fixes, I can rebase it accordingly. Please confirm the preferred
> base branch.

The fixes branches are generally expected to contain things intended to
be sent to Linus' tree this cycle rather than material for the next
merge window, they are merged first and published separately as the
pending-fixes branch before the rest of the merge proceeds.  People then
take that branch and do testing on it independently of the rest of -next
so if it starts acquiring material that's not a bug fix intended to go
in during the release cycle that might cause confusion.

--aDvzLaFM62YmNpVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnRKLkACgkQJNaLcl1U
h9Dp3gf8CI0H77O5Xm4sBNnu5EXjUXi23WTnx3nA2KAWH06DdJ+1eWH8F8d1UZsO
bHdzg0YEsjvqBDxG0h3gXsEplTJkV7+3V19UVitRgxA4a+v4c08swS+HymPBKm4a
muI6W35MPqyUF3qWNgkMHtMHYaPE7EJuZfgP3E9fJ6taLzvH3TnUNkAgA/ew4Tll
hvgJc/5qJbYtLrvIP10mDGowIsznIV0W79FMTpEz478nlm06h+ojqzzOWg9wXH5i
w2enzryMonGn4UNThBsU7ofQA3+RmYLib2NK0uiUnwKmz1muREenJy8n1nV026K7
LeivPWqopp+wS8ZzyFwF24GugXiB2Q==
=c/mB
-----END PGP SIGNATURE-----

--aDvzLaFM62YmNpVX--
