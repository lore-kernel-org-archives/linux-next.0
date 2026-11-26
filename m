Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709995;
	b=AVuBhU52pFmzrTa2MLzsDDNLlqPytFuLB8liAMgpQhQqjj10wjBq9qvzj4UQ/MNY75AU
	 h9bnN7jOEY4s0QIY9/o5AeD4SO9afeEDPsH2Uz3JnvY0YId2eIU72XbqxRB3V/N8ApgEH
	 p/HSfuStSeGH25mrlCMjRYUCJ46vpUiKwk90Ml2wHKh53h9wumjMLSJJYXavugfLiPxrQ
	 S5iUk5iZKPgxyBV4hlubA1Ceo7iYKecwaWqvM2EzmBRzh51LyQxPgIpXkDHeNgqKpwQJg
	 7od13b5HQvhcuXbI1W57HJTn4ild6OSo0nkdm3DR9951lOSauTeT8/Ubd10HYc/AFBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709995;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=pyA6BrWRGqBT9InERBycylr81NGVwDNi1NcN77e1IJo=;
	b=JSa6fILu+k5WlpFDuexrIgIxAImImH0MBcTGGCJ3jl0LkJrX6V8BQHfYF0n1jxn7Y1cM
	 5Gh4Ki9bMNFseASC+WVvR5xrx09dlWnq6YJB/1wfmNrpqye341tc3Jnk9KusSawbA/RKp
	 2Nq8CXMtg3QMCuOm4jS2UmM1TxTFQvR2T2TGIqUpt5bbO2IVdVC5m4RFWbgIw58+qPnx1
	 UA9NA4beM36NTk1pSwaW0W2RSaGIfnDHkLKlDVrCIJ7G3BtbioPaAMcXKtzlcyFQ1G/vO
	 552nEiDW+7RjpH08KQi/GEiSzXYy5clmsyBhVoNvIRpefoh2rMIgJ350Fn5Z3p7qdGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XIT+E6O3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF33606A333;
	Thu, 26 Nov 2026 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XIT+E6O3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7F51F000C4;
	Thu, 26 Nov 2026 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709994;
	bh=pyA6BrWRGqBT9InERBycylr81NGVwDNi1NcN77e1IJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XIT+E6O3QkSAIeSdQUWbAieX64eHJW2apQe7OExqFcnOz051lI+JenPRrjSlYH5XQ
	 QhKsTt/wafUqyMfWE0dGzGpFyjpzDe4jnLUdntu40sNW91jaumOU4h/2ACGbm4Y33+
	 Xu8GqitGD2j5egDkk9XHPVCe52obOrZghYb7iYuboVaQqulVP9I3JnEoHstxDgWSet
	 gghICGrhC1WsR9eQnqkGIa1fHqBPeZwfFzL966bgmaK17A3VFUg4IF6GDwPdrCu6W9
	 LJpybgQ48uQUsxNLJTkUKV1qtYbTN55SIMtUFhg8SVriJ24SBFNI0GLGj5MaN6pEKL
	 4TWPfjKjm9AIA==
Date: Thu, 26 Nov 2026 16:19:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Please drop the kapi tree from linux-next
Message-ID: <413af506-a99e-4d82-8078-89b8ca5543f2@sirena.org.uk>
References: <20261126150925.2347325-1-sashal@kernel.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FZeC48/CZXojmDZA"
Content-Disposition: inline
In-Reply-To: <20261126150925.2347325-1-sashal@kernel.org>
X-Cookie: Sank heaven for leetle curls.


--FZeC48/CZXojmDZA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2026 at 10:09:24AM -0500, Sasha Levin wrote:

> Could you please drop the kapi tree from linux-next:

>   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/kapi.git spec

> Linus didn't pull it, and it isn't going in the way it is now.

I've updated the config, it'll be gone tomorrow.

--FZeC48/CZXojmDZA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIXCYACgkQJNaLcl1U
h9CFCwf/c5sEIiko5m89dseJtE1bGPP5vlqIoLLYQ5hmdZTfQokCiJi0h0VdBm6d
QRfi/eyny5rKvw6wGHS6iBSgUOfmoQTc+vVl1DYHhh78EMi+wI70KFbPD/4HYrI9
9w/pWh74/sE0X4dqejbW34Vx3jUrTDpqXYOWTqHnAlvii0tH/tSKYpEKkBjXSSY7
v8pH8fnuMI+ZzLyXS4sif6n7yj6r3I2uzsApS1+8hS54bdCYHL8YzSazpyS8ZaA/
XJ4iwHi2bOzu/omXOIY2DmyOhZeqiWR0UGesUOVc7PU24uRjWUUdcGC4fbcoe/fY
jBRmMvmc3l4mDkbxbiFV+zcQaHXZtw==
=B/H9
-----END PGP SIGNATURE-----

--FZeC48/CZXojmDZA--
