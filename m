Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609461C84B8;
	Wed, 25 Feb 2026 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772023285; cv=none; b=mi6EB+GhDnO+yMXYODUWlXwF5cgN2Lv2gyzQ1i8yi67juoqL4p+IvhCXs9gwEcVom0PksaqgER0+1eGC/V1oP7fHSgbiKOnVGuN9BNwdch7QkL7FhcVN/ssyy2SJ8lyMaOOME+I0Hj8UAPGngt4JYGPKNwnquvjzhmb1h6utQ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772023285; c=relaxed/simple;
	bh=Oly1PLc6JSM0QRpE3DI2QsrcTF3N+jFY1AnQ2y+sVEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1dVx26YIeiuh0mVgp+5JJtZsbhyD+chICAGmj2mljFzRTNX7g2KLkJxmB2AWz4ObrfgU6BBaA+NvExsUVrM0kD0nAPbTnVGJUgN08sFTdZh1SpJiV+8oM55WcpQOIBXoVb+I00nRw4DLZg8nr18ekEB5PeKfeM6Xe/YSIblLUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AM/VGfG+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AM/VGfG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1050C116D0;
	Wed, 25 Feb 2026 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772023285;
	bh=Oly1PLc6JSM0QRpE3DI2QsrcTF3N+jFY1AnQ2y+sVEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AM/VGfG+yinud/HOzIx5asNqQMCPzIF4x1ziQzRUFZpKd6FdRE45kNd9F3voEiS66
	 aS4xvgm4woS6X1OfQhv2iyrQmv2DX31NJ3cnvlPAFn8fYyN8mLFx6VmDZmMU51sj5z
	 1K6VLdbN3Q9ufUS3an/s09J8XhUf2baNZZdkuRd4igoksesaYs3kUD1saCx5th5ZvL
	 MVTJ66P8iAJjEhKFRXtjNiGgAYEgmVdcYX22qAQruqJdgLkJhlHrA9sP2JkABqU2KN
	 9ddDpYB+Vp+WpEjj1bB49Liu8lhFhwJucVULx98gE1kll31LRBzclvQC/rjdHNlx8c
	 3SOh6VskUqiDQ==
Date: Wed, 25 Feb 2026 12:41:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next inclusion request : ntfs filesystem
Message-ID: <ecada199-b746-426d-9207-c2d6da2c2034@sirena.org.uk>
References: <CAKYAXd_rfwTt+uhOgBa4mEO5j0CQhZdTp=YcoU2RCng+scDbXQ@mail.gmail.com>
 <1dc54be7-f8f1-4555-9004-8e15437023ef@sirena.org.uk>
 <d4e59537-f51e-4860-bc66-8fe5f9f3e66f@sirena.org.uk>
 <CAKYAXd-M+apvWoQUD=ucj0zhz3bN=Efi0GV8h+LtEhQZC4PU1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WH1H+MWrIr9CS8sO"
Content-Disposition: inline
In-Reply-To: <CAKYAXd-M+apvWoQUD=ucj0zhz3bN=Efi0GV8h+LtEhQZC4PU1Q@mail.gmail.com>
X-Cookie: From concentrate.


--WH1H+MWrIr9CS8sO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2026 at 09:01:59AM +0900, Namjae Jeon wrote:

> It seems the build error is caused by a dependency on Lorenzo Stoakes'
> recent MM change ("mm: update all remaining mmap_prepare users to use
> vma_flags_t"), which replaces vm_flags with vma_flags in struct
> vm_area_desc.
> I will update the ntfs tree to align with this change and ensure it
> builds correctly against the current -next.

I checked again today and it looks like the tree wasn't updated - if you
could let me know when it is that'd be great.

--WH1H+MWrIr9CS8sO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmme7fAACgkQJNaLcl1U
h9At8wf+MD1W9jzNJTWGvUDUv6KJmQkXj7kKINpk1HSqQORaJtA24XuaHq5Pg4VZ
c3rZrW37L8YEsO4FKYq9K9fjU6us5DVABjWD/CmxXkrmuB7Ru10ZoHHeyNgR9rk2
zIe88AZRGscaCPtfVa1pNz7b1HvwR0NbrKA0LFD0Co67olqex463+MUdRbUIK2PP
SE/QfAu/21YfeK9XbKWJaNlFP4CQTDTKwS+HZvhhwIXxCPI1m1eUhYbwmQLUvBct
zHQ4up0GkD2TBoNs4N6FETXzeAmIQE6q+1BIpJdQ6rrqsGEVB+BOtTP4xxCAgyf6
xEvcWJvThNxMoyGrn2bAo211X712oA==
=xU3u
-----END PGP SIGNATURE-----

--WH1H+MWrIr9CS8sO--
