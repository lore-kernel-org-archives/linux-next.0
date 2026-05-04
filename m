Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365343DEAD3
	for <linux-next@vger.kernel.org>; Mon,  4 May 2026 19:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922520; cv=none; b=rR41lJ7VJD2V52W+QhJyZ0qBRSkfVMzBqnevxsstAkp+hUWUKl/a/xslYb9jDD6ilfb3TZQO0hsc53TjM8ElAMD4dEqsqUImgdVDYPr14bpOU6Bcc7qdeL9YEKRSUvnwx3FytfrEPFPCPIAHCgxhvRBknGHd002873PvKkToZ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922520; c=relaxed/simple;
	bh=TPRtdIVJJLyrOzz3r49FwGEY2x/CYpjvOM06MR0Zup4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFnbsdWsMV2HG+CbkG7r/Apr9iIKHcn2WL5i9GHMQ6t2L919hmjFAYpMj4O5jdw6OHZEhHNJ2pQ37yzk7WrqlxVOLDuBcS3QWmy98G7K6UTxJBxRc2GccHd54n09j8ZHgqgjfrQFpXZqSvmJ3YKk8/UGmyKoJ5Y7zGtZwYi0IgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0G2UfN4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0G2UfN4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CDCC2BCB8;
	Mon,  4 May 2026 19:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777922519;
	bh=TPRtdIVJJLyrOzz3r49FwGEY2x/CYpjvOM06MR0Zup4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0G2UfN41ZmoNy1MqydhFKD/TcUlvxraHmD1YEM8Xy4BKt0lRnCAj2kBKidamPcIm
	 gF+BTaUnEfuiPzi1fi5V2s0vpjUNtHJAvmk3NtiUCJSD8tTcSIj5qqs51h8jnezJ/w
	 J83lSAIn5sJjXGTeEwYKBzAqwxozrnqUwB4s/iFhsjVRk3weDxuEZ2t999VJ1+1ZMn
	 3TQ6mO27su2u+gTTPNzMCXxDjDGTpmUtdxYFy+GvYUDnA7rLzGpBnW/bxvFPIEeThk
	 4txNAvmLCQDMLI4I/EUQrgF0D3iROpq7uAia5SZPOKQN9aP66lZPwuqtHSSZ/6JG5Z
	 BRZU+CHb1RIsg==
Date: Mon, 4 May 2026 21:21:56 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Adding NFC tree to -next
Message-ID: <afjxJyTag9YT1How@arch.a226c7d-lcedt>
References: <f50c0c1e-ad33-46d9-a9b5-ab56c82a17d6@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tjaampsy7tzcufkh"
Content-Disposition: inline
In-Reply-To: <f50c0c1e-ad33-46d9-a9b5-ab56c82a17d6@ixit.cz>


--tjaampsy7tzcufkh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Adding NFC tree to -next
MIME-Version: 1.0

On Sun, May 03, 2026 at 12:47:42PM +0200, David Heidelberg wrote:
> Hi Mark,
>=20
> Could you please add
>=20
>   https://codeberg.org/linux-nfc/linux.git for-linus
>   https://codeberg.org/linux-nfc/linux.git for-next
>=20
> to -next?
>   for-linus will typically include fixes for NFC targeting the current
> development cycle.
>   for-next include things for the next merge window.
>=20
> If there are any issues or questions, please let me know.

I've added this from today. I'm a bit behind on schedule because I've
been battling with a new setup, but this should be part of today's
release if I manage to finish it in time.

I've added you as contact for the tree. If you want anyone else (or a
mailing list) to be listed, please let me know.

Thanks for adding your subsystem tree as a participant of linux-next.
As you may know, this is not a judgement of your code. The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch). It is allowed to be rebased if you deem it necessary.

Thanks,
Thierry

--tjaampsy7tzcufkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn48dQACgkQ3SOs138+
s6HUkw//TDhijvYT0dnwo71La8r0b34CjT0EpKCI+e3eL+i/8hl/QgcNyCVV+iua
08qt6NyxDK9iucLYyNrtUllZi1zP1UW2Y+HMitgrfuakj+3HABOxq3LAxAaIYcXl
uXh4FxKDQJkGphzlMG0Zq6qcSI3IAG98zRiq870DzWJCZsDE3HvbltXHP7nYs0m8
QBNEswydIeHZvIN5t/FI7fsG2ZgWS3OSS9F3I8f5DYaoGZHzR7usY8pVxRqA1VWq
kJM083MDqAlvmFJIpU/k71ol70CQyBxdLjcA+eXh+/0PTaMrOhRwB4ZYuFAi4xbP
dla3/84MbGDzK8Xx2//9ofaGnyDHh3ZMiB3obABne8QQRLxslCubFxzawSTeBoL2
hxyCgtVnA7fCMTuVQYTm2SrSh9WSBjxM8nboat3UYFcqG4hKzR570JQsQU+4TfKc
2FvKh9WgJZOcZ8C7AJH/Fh3cVoy/DrsJ7KHEsXyfBQo0qy5hQjEoHAdQSSNM+o0l
uiVylovN+C2PJtvYmNifh0kzvPdkUzqs+ES8Q2Pdzi7l0In7d8kFOv/BN+z1NSoF
HVs3sSZZsByP4MDJGXQ/3D0DzjCYCAEdxxYHwzflIZCvcXnoRMRFXSv8ScO5/Wkg
wYvd1NxlRJuHF1rWCKBpqzeNrO8OEmW0JWcfEEi0Vqe5Vl6zHkQ=
=TI0E
-----END PGP SIGNATURE-----

--tjaampsy7tzcufkh--
