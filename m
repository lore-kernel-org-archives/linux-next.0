Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A645B21A;
	Wed, 25 Mar 2026 18:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464754; cv=none; b=E8+Dy4w6cK1yBgPk55aQ3HgavjbB1e+nVYXas3AM750bKUcLxrpLrLeyDI3Yadct4BOw2c24BZVlaGlZypsrSJgmxZjZ9iodQ0f516LJTPQLACMJQ8CHWzGXgpOlkYB1jzJ1+ZIWt09Z3XDDZzLMW06ZZ9SuzxIPIJhPogewh1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464754; c=relaxed/simple;
	bh=ljxI5m8KyPuUNBXY252kSHOUBC5zq+cvbb6TVfVx1zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0thRbiPMXRstE/8YcGd8XxMct6o7Tw/4Nc/EKnvftrk6YFumLWbsclfiUKuAEC1NwlQZnKwg7U92jJzZFNNUQDTwyWAFcptQ+ClCLtKPyZYIaxSgwjDFcL89Fv1OeQf4yfGGcmGzoMBn1rJJZL6wP6BuLdvDw8bSBeeVhIc5IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILl4k2qn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILl4k2qn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848EEC4CEF7;
	Wed, 25 Mar 2026 18:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774464753;
	bh=ljxI5m8KyPuUNBXY252kSHOUBC5zq+cvbb6TVfVx1zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILl4k2qn+qQ/wqG5z6KwShbVTAQfWJIheHPgwC8nYLJHtmhfVjI33So0iR/wC4Z8+
	 IlRNfORRB9YPBPAyrDED1rVECaE/CduzwpY3EeJU6IMps3nGoojq0rr4ta5gxxcFw+
	 p9b0ANEV9OLICg56AUcKutC5WuYE/lCTcptavCop3PmFQnbcTkcKBYWvxtWPUUJt4V
	 CXozrx7F/s5MMZEBnt5iP8QEOHRS3HH/rVGLn0Jr4lQsADGgCtQPzx9gUy+0kQtFB7
	 4761pKWQrY7x/1hMVIdU5Vg85d7Og6GWwia3F5v53XVk65RAHYyeqIsb0U0uR/caUL
	 gd+08T5FwSeTw==
Date: Wed, 25 Mar 2026 18:52:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the mm-stable
 tree
Message-ID: <2eb12bbf-f20e-4ae6-b429-e71bd6049658@sirena.org.uk>
References: <acPtrrkwagtafDT8@sirena.org.uk>
 <CAKha_srZoj2Tk-K4ceserTkH2WH6ewgm2LnEgQPBUDThnwy+vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+YqOTn61Df2FzOxd"
Content-Disposition: inline
In-Reply-To: <CAKha_srZoj2Tk-K4ceserTkH2WH6ewgm2LnEgQPBUDThnwy+vw@mail.gmail.com>
X-Cookie: -- I have seen the FUN --


--+YqOTn61Df2FzOxd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 02:40:15PM -0400, Tal Zussman wrote:
> On Wed, Mar 25, 2026 at 10:14=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:

> > diff --cc fs/f2fs/compress.c
> > index 614e00b8ffdc5,f43ff7ffca60f..0000000000000
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@@ -13,7 -13,8 +13,9 @@@
> >   #include <linux/lzo.h>
> >   #include <linux/lz4.h>
> >   #include <linux/zstd.h>
> >  +#include <linux/folio_batch.h>
> > + #include <linux/pagevec.h>
> > + #include <linux/fserror.h>

> This doesn't look right. pagevec.h was renamed to folio_batch.h in
> 8066a7c76e816 and should no longer exist.

Yes, I did fix that up later.

--+YqOTn61Df2FzOxd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnELuwACgkQJNaLcl1U
h9B1Xwf+NgHB3pkUCp+IEyysZpyK12QXeCfxRhu0bneI7gywa+1ZfX8Erb74mTyZ
7dasctY33SARAoEzykVVDRsrS/WmvMipAMV4LVh/DvT9pPcoP9BMb9bs+mzLRGJh
YdPx2MMBcxJilTSqF65U8W9/WAhKG3SDByHIeH+tOg6R8D1z8nJja9nHRXhBwGnP
7P+jVSh195/RjpSxeALoIzZJgXdh2nPh7wiWokZ7cgP6+NhIbf9cofnoQbdCpH4V
XYKFU0pYIpI4E8IGVCq4lX9XC2bEzIOME31MYQMeVUGVPKN8kpy6U5+cODPGbpoW
G3ZgNdrEb/OupI49RiE8rtH69ehW/w==
=vdIS
-----END PGP SIGNATURE-----

--+YqOTn61Df2FzOxd--
