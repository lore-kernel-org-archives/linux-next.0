Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FF42AE78;
	Mon, 27 Jul 2026 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152344; cv=none; b=Gst9IDUgMEi6uSYko84Ez5MpstC5adWh/5JtumHxiAiMkYRxfjGxqkcKXLvx0D7t4M8XiSTb3tsr+Ko+6VF1vrCwngdmLu6IH65g2Ayw56QV6V/WsCrIt73SUbCORefBwhQtrgUwVMPGmY1x9kLCU1MaseYWKsfc7wT6+3fcU0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152344; c=relaxed/simple;
	bh=k8+byG+xjYk+w+Tt6jCN/t0nMuYbhvKVJpj8X4732Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7YM8upg/+YQg16u/7qtWeLhfzoaRAm5J2PYeLYJbqkLcv/wDa57H3siWqhnEIjwV50GkCppkiWakLd6a5ccfC6G3tcqDNO78Iyb6iGqTbHZvhseBdRzeQa9aIMXMHcP91XPm62p/cA9VASVG1EntZDtYgvuqQ9Sa9DuFsfs338=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8yHxvS6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8yHxvS6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8DBC1F000E9;
	Mon, 27 Jul 2026 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785152342;
	bh=Hk91jiaYrqqT7+O7ZOxBDHcYcQVK642OqzqdmWmTRLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X8yHxvS6PNPz+YCQocyJfMb6TyJ9upLBiDsmy8e54AEGa7bK1LxaRwCIrticzGwoN
	 xAgoazxViXxuDNG8b/PP/0N7UQ531xm/XuDyQKpP6CZajz7w9OpEsTZ2MSI5pB4gKE
	 rfgqrXWPALEI9ErywGRtqGGt0iadQK9Iy6llZKhB/p72mSg8N9FE6+oizoFpo32m33
	 f9ZT35gtCWccBWHEBahgpipbQDOJSjGVF3FG0N2z8yXW9xiTbZtEEohxlNtZauZO8w
	 0Qi6L7Emg2QsFA4r77uMmRCdr5/YgeM+mtrp/Lzv9w3nt/3P6w2h04Nt8SnhV6N8uz
	 BgCbvUQJQ4HTQ==
Date: Mon, 27 Jul 2026 12:38:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the
 mm-hotfixes-unstable tree
Message-ID: <76ef8225-1d4a-49e4-a3b9-5e341ec6a057@sirena.org.uk>
References: <amZ9QR_9NYqq6JMy@sirena.org.uk>
 <ambxL-NxiYZ3vmpu@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IniqoBPIQKGzkG/7"
Content-Disposition: inline
In-Reply-To: <ambxL-NxiYZ3vmpu@kernel.org>
X-Cookie: It's OKAY -- I'm an INTELLECTUAL, too.


--IniqoBPIQKGzkG/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 08:48:31AM +0300, Mike Rapoport wrote:
> On Sun, Jul 26, 2026 at 10:33:53PM +0100, Mark Brown wrote:

> > from the mm-hotfixes-unstable tree and commit:

> >   5fce67641a3ed ("x86/mm/pat: Don't gate cpa_lock on debug_pagealloc_en=
abled()")

> > from the tip tree.

> > - 	if (!debug_pagealloc_enabled())
> > - 		spin_unlock(&cpa_lock);
> > + 	spin_unlock(&cpa_lock);
>=20
> This should be

>  	if (!debug_pagealloc_enabled())
>  		spin_unlock(&cpa_lock);

So essentially dropping the changes from the above commit from the tip
tree?  Should that commit be there?

--IniqoBPIQKGzkG/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnQ1EACgkQJNaLcl1U
h9CZfAf/SdOELLHfsIhGvAEDDI1u6ScB3ntfZXaPRlFQiDSO3NjmmkuVsVjvs8EG
uxSVCl7YNVtfstKaJu7cr0QEvP8dWM+lMAUnbKH6fOBTSpM7Uwek4ja+s2wQ/eXv
z/JPOr+JvZgf4T/0zI/pdBAOWP/Zd3gOKgm2K0hNvpNzUGzQdfYj3XRD+10RExDg
zyOi70yxF/XXa80wgVh7rBM52D2Gte5cUroPzCaC4yTu65E3Q2CPqN4jffZLMZak
6TMCj5cFAaZ0oeR9b5stY5qhEy14hO94QDoL1U58/P9Qzap+DH6CqQpClb0KMB54
79xWDb+DF6Dj2hPnx8yK3u9ezQLdlw==
=GA3N
-----END PGP SIGNATURE-----

--IniqoBPIQKGzkG/7--
