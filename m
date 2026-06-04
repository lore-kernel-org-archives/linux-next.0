Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F553E0083;
	Thu,  4 Jun 2026 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583731; cv=none; b=Aipj1VZB8zLZNe/WTpLv0+ebYrmlnPNnmDRHkvieJB5RccriPe9dGANlE5MDoWuR/Y55V2bc1H2UUF+FLpJvdizJ4z8+xEy8QbbnI2rlkp2SlKXqr5022+7gsHUKUE2zGrd60txNL6vnAg153dNYIfYKzYm7OXDqnQpUkwkcMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583731; c=relaxed/simple;
	bh=QcP9JsDmOYhltMwcexkHi9Yv/3Aq2kN0nIUFXIU9scs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkUkY9KQeagOVPxOiKtYHHC7xiEn7JC827Av+LzuJ+MiQoHPZNNOxHPBzOF1m8vpO5M+by8T6OqqJtbOFLz4c1wKKa1V8jaw4lvYTI3Aw8SsjvoAh4F4bcs5vqulOb2zVbUIgA/5rgGSzXSvovVu2mMKnexFJo3uKWOgguAoEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXBXZltl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXBXZltl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F175F1F00893;
	Thu,  4 Jun 2026 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583730;
	bh=iOa5VnaaFRt7AoRrt2xOQahUhgEKGAe1rmhbwSOZ7gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hXBXZltltTsYMkxXR526wtCDe1ky7JiHZ6sV/Mo2FNNhDaaRNbLWxLdoZqb9tzavh
	 kAtJb6XCVjAofStqcXjOQxDnsOIr48pioRTlu5tzBp4qQdFEffASsYWXa/U8hX7Nnv
	 5cvgMwAASRUYireuvCnGw3zs5ntCpeOZ0i22HIMDIhZh9iivjd/8C+TiW6x5CwaSdp
	 WmXl3yE6vwSAyLDgoQ/irpg9Y1w96E3qwlCdXXFgJCxamT541Yy9sU/Kz6W3JOvkCi
	 PMP1bQiYGL2N5JrW2q3Eae9gwY7pNi8rmFMtA49xWhKkkCl45QCImbVmx3GF3tI2zh
	 I5K0xj+KsWd9g==
Date: Thu, 4 Jun 2026 15:35:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>,
	Gustavo Sousa <gustavo.sousa@intel.com>,
	Violet Monti <violet.monti@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <bfb0dee8-b243-47ba-a89d-71472b0d51c5@sirena.org.uk>
References: <aiAz4DmtngY0r6Cx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="To6FoYMKyK/YpjoU"
Content-Disposition: inline
In-Reply-To: <aiAz4DmtngY0r6Cx@sirena.org.uk>
X-Cookie: Q:	Are we not men?


--To6FoYMKyK/YpjoU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 03:02:08PM +0100, Mark Brown wrote:
> Hi all,
>=20
> After merging the drm-xe tree, today's linux-next build (x86_64
> allmodconfig) failed.  Unfortunately I fat fingered things and deleted
> the logs, assuming the issue remains I'll report proprely tomorrow.  I'm
> fairly sure the issue was due to:
>=20
>   5ff004fdc7377 (drm/xe/rtp: Add struct types for RTP tables)
>=20
> with some of the fields in rtp_to_sr_cases[] haiving non-const values.
> Sorry about the lack of clarity here.
>=20
> I have merged the version from next-20260602 instead.

The error message is:

/tmp/next/build/drivers/gpu/drm/xe/xe_hw_engine.c:361:6: error: initializer=
 element is not a compile-time constant
  361 |                                  blit_cctl_val,
      |                                  ^~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/xe/xe_rtp.h:461:41: note: expanded from mac=
ro 'XE_RTP_ACTIONS'
  461 |                 XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))=
     \
      |                                                       ^~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/xe/xe_rtp_helpers.h:56:108: note: expanded =
=66rom macro 'XE_RTP_PASTE_FOREACH'
   56 | #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(P=
ASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
      |                                                                    =
                                        ^~~~~
/tmp/next/build/drivers/gpu/drm/xe/xe_rtp_helpers.h:57:80: note: expanded f=
rom macro 'XE_RTP_PASTE_1'
   57 | #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_=
, FIRST_ARG args_)
      |                                                                    =
            ^~~~~
note: (skipping 11 expansions in backtrace; use -fmacro-backtrace-limit=3D0=
 to see all)
/tmp/next/build/include/linux/compiler.h:204:39: note: expanded from macro =
'__is_array'
  204 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
      |                                                ^
/tmp/next/build/include/linux/compiler_types.h:610:63: note: expanded from =
macro '__same_type'
  610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                                                               ^
/tmp/next/build/include/linux/compiler.h:200:84: note: expanded from macro =
'__BUILD_BUG_ON_ZERO_MSG'
  200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_=
Static_assert(!(e), msg);}))
      |                                                                    =
                ^
/tmp/next/build/drivers/gpu/drm/xe/xe_hw_engine.c:416:9: error: initializer=
 element is not a compile-time constant
  416 |                                            ring_cmd_cctl_val,
      |                                            ^~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/xe/xe_rtp.h:461:41: note: expanded from mac=
ro 'XE_RTP_ACTIONS'
  461 |                 XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))=
     \
      |                                                       ^~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/xe/xe_rtp_helpers.h:56:108: note: expanded =
=66rom macro 'XE_RTP_PASTE_FOREACH'
   56 | #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(P=
ASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
      |                                                                    =
                                        ^~~~~
/tmp/next/build/drivers/gpu/drm/xe/xe_rtp_helpers.h:57:80: note: expanded f=
rom macro 'XE_RTP_PASTE_1'
   57 | #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_=
, FIRST_ARG args_)
      |                                                                    =
            ^~~~~
note: (skipping 11 expansions in backtrace; use -fmacro-backtrace-limit=3D0=
 to see all)
/tmp/next/build/include/linux/compiler.h:204:39: note: expanded from macro =
'__is_array'
  204 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
      |                                                ^
/tmp/next/build/include/linux/compiler_types.h:610:63: note: expanded from =
macro '__same_type'
  610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                                                               ^
/tmp/next/build/include/linux/compiler.h:200:84: note: expanded from macro =
'__BUILD_BUG_ON_ZERO_MSG'
  200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_=
Static_assert(!(e), msg);}))
      |                                                                    =
                ^
2 errors generated.

--To6FoYMKyK/YpjoU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohjS0ACgkQJNaLcl1U
h9CnWwf+O77M32YVp/dhKinqen1oOsTXuoC05UdKUg/16LQoLJBz5pP2Maonh4Z4
vAR8GPtm1Pu03jvkDCGrMIO1wMKK1km572VVWrS6hBVIp6Eab1s3a6gA3uLhcWf5
oQVoImG5yNgN5Mmriuau/hfzdA6o8zN4uj6mp2qJ807QSLcnqUDA2GIofaKYgvGv
4JcAmx9Rf+C15dCjvIzM7o5dOu72lZhBNV68Jo1TD728XNNbMEgHKEPf2791Vpzl
DhoNtV8X4HK8nhKpya/S8THUOpakQfqnxgeqEY5BpvlS04AyJ2yiasyE+NqUtsdw
oj1QN9YYzHh2fZwRIky/+1imYFqMlg==
=58I0
-----END PGP SIGNATURE-----

--To6FoYMKyK/YpjoU--
