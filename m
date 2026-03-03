Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B4434252D;
	Tue,  3 Mar 2026 23:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578951; cv=none; b=LLxhlaGfkQFbW5/seuegMiJc7czY5qRWVCm5sAgm0LYbzmL7Rsb52jIOFysTHPUMDRPOv98x6hntOKei8/04781y9nDiv9dqtfxx3/3minbIMkDzpw0LKab2to4iSHJkZ92uhIRwcgy7thAxBk4s/hf9120Er3COVWSUb6sTJzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578951; c=relaxed/simple;
	bh=LB8CL5q9eGDLCjX7+/HPwDbCV78Sg55CFzTwPVYy7WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHTagKnF/wfJCmZUFXWT/coL3iN+DxD0Nlk7n6NB+hHf8UoOUargN+Q2RWqc9DTitr/wHm0CARkykgxojms+Cfp/VNKuzDXwjpGcewSCfrpPADvu8nRVwCOLQboH9LcNn+k0mjPbu9eMddLUkH4nEiwx1TpRdAx/kNsDURVtj5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzouPMpi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzouPMpi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2621BC116C6;
	Tue,  3 Mar 2026 23:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772578951;
	bh=LB8CL5q9eGDLCjX7+/HPwDbCV78Sg55CFzTwPVYy7WI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzouPMpishaBH14bl49zR3ockQO4x1Dp8W9DXjJ3Fyx8pw6/JdUJVLd8MH1C8kft4
	 Jl+eaW2xtZOoDxFV5KZph3cDHw42w4RGn7I9yMXh/LilzbmHxKiDbIYx5+JLm20el8
	 2medXnExP+A4QAMiG94U5bo6qKMpo6hU4aCV8ZKPZLfRms4RqrNmpafH9j+lrySDf1
	 XEEBnmFRdEMYcvbzR5NoSnbB7RHe9mplcVFDNuWslz/VLjwyCnhyB29qIePIXK/0lO
	 oLjqUbNtjto8JzNDBrOR3Ivety0s1bz8MrZpy08kqLP8s+UxH/Q3dSoFs73wLq/9H0
	 SpEZtvDeTGAkA==
Received: by venus (Postfix, from userid 1000)
	id EDE79180D07; Wed, 04 Mar 2026 00:02:28 +0100 (CET)
Date: Wed, 4 Mar 2026 00:02:28 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Davis <afd@ti.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the battery tree
Message-ID: <aadn_VyAcUIIFTwn@venus>
References: <aaboD-MS-2BbfEty@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgufvaorwtzxmime"
Content-Disposition: inline
In-Reply-To: <aaboD-MS-2BbfEty@sirena.org.uk>


--fgufvaorwtzxmime
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the battery tree
MIME-Version: 1.0

Hi,

On Tue, Mar 03, 2026 at 01:54:23PM +0000, Mark Brown wrote:
> After merging the battery tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> /tmp/next/build/drivers/power/reset/keystone-reset.c: In function 'rsctrl=
_probe':
> /tmp/next/build/drivers/power/reset/keystone-reset.c:137:13: error: assig=
nment to 'int' from 'struct sys_off_handler *' makes integer from pointer w=
ithout a cast [-Wint-conversion]
>   137 |         ret =3D register_sys_off_handler(SYS_OFF_MODE_RESTART, 12=
8,
>       |             ^
>=20
> Caused by commit
>=20
>   a065176301754 (power: reset: keystone: Use register_sys_off_handler(SYS=
_OFF_MODE_RESTART))
>=20
> I have used the tree from next-20260302 instead.

Thanks and sorry for the noise. I've rebased the tree and replaced
the patch with an updated version. Apparently my local test config
did not enable that driver, so my own build test was actually a
nop :(

Greetings,

-- Sebastian

--fgufvaorwtzxmime
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmmnaIAACgkQ2O7X88g7
+ppBWhAAgLIUbTg887VEY16JjTW9YIUd4mw1ye6wMrxg/987yaXPoduuqSKa59fR
ymGxh7kQWEFedoZqntRHK3Se7ZUU/8fS+2vJSUXzWyu49m7KE3ZySO7NG4J6n9cT
anwNwDaxfa+zxdCOWyPxgNxWLTNwnBLGn3EngypcrOgdFfe9qGN7n5+CHAYYHwRn
1r8jwRcknfwR66fDBf/rq8VT6YRA6Q0bgkNOR+4nhh6ebS1XmxxTZlC4mCnL0Dev
eESv7GVK6VdVrohJzbJo5BbJTBxm7DJzV/shlvgOwlyyFm5WUYi3qbmO3cZp5Dqd
EeRzfLbIVS9KzzHRzHCajRxgjjXOr0aHGeXpEqs0uhT6g7SxDbBKFi3iQHoQgrm1
QfFzRFKEcfzxsUPaN3Ps97WteB2+xNmwCgNl75GQsn7jW4QhjSkea8Xq+qxiPp3E
6Nh4MD4jkjSEuJ3M81cqFXPMAHd7Xlzs1wfsyV2dyptqraTLAzHoJp54/6A8ny2w
28KvjkF+TuTVJBFiE4sdzH50v7ho8YTX/jzKuuPHGzwDVwlTrrCXxwlr5qRca7/Q
0lDH+BXJ/CQ5jOst7W3gaSjeAWkqrnVdtU1heQwm+GNmZ6Id/+g7OkRY4t6ctVcO
6lyMCeSZE9YywqR8Go4etNA+ajrxHTyheLiGFWLZ45x5ikGuMKo=
=ThlX
-----END PGP SIGNATURE-----

--fgufvaorwtzxmime--
