From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Wed, 11 Mar 2015 07:57:04 +1100
Message-ID: <20150311075704.7086515c@canb.auug.org.au>
References: <20150310160728.7213b9fa@canb.auug.org.au>
	<20150310150815.GA28071@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TJUxc1M3Vi05BpMd9iWH6UP"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54972 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753737AbbCJU5N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 16:57:13 -0400
In-Reply-To: <20150310150815.GA28071@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

--Sig_/TJUxc1M3Vi05BpMd9iWH6UP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, 10 Mar 2015 16:08:15 +0100 Greg KH <greg@kroah.com> wrote:
>
> Sorry about that.  Yes, I know it's a mess.  The build error on ppc
> should now be fixed in my tree.  The build warnings are still there
> (some are gone).  I should just go fix them up myself, and will do so
> tonight if I don't get a patch from someone else that does so first...
>=20
> So it should be safe to enable again.

OK, will do.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/TJUxc1M3Vi05BpMd9iWH6UP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/1qmAAoJEMDTa8Ir7ZwVyoIQAIhqMMwztHCbLxJU+WWPXRok
Q0yZpBi3KzbK21RjZt9KCAdSzoKZEB/I/IxqTqwP5hviJ3+6WJWOXwqAzmhY4SWq
4JTfBeCNUZhfEcU/sNEulT6XeKK/517Ag0ZeKgQlo/FjvWARCzQrixIeFGItSI8K
ixwp//ZXLd7K28ryxCysNwEFln3pPP/RKc0YslD/2EjDi9gpi1YgwjtMnOvuG8Nu
LI28WX8OCkYnzypFAWoI0ebs4FUbgliPA59YKHyNwIQE4h6/4fUPLxhuCyq1MX5i
CfnmbP/5+uqr4oS3flMzVHd4MUB+hcSuX5tJtkFmB6iS51fhWuAXmEo7YQigDJ4w
bVspuLKsIWj0Fj1IanahXinPCLcW4QEV68iP2ybDdcHhIC7RfUIEspWvff8jFzbP
KR5bIei+TsVEdS0HJ0AZOrcMA9Tv+kUXy2LwnfysDFM7/pssoNGvsKHVU2PAO7MG
yOAMAsHAfgYhO07Qp2s3sXMXfSKVp+OQg32AyhbTBOJ7IST0bEaiNCmyC3qck9LF
1peumRO+9OkzFh/cyCBCMKyNzolA5recG6NyVgC4ALpL0AdPWVN5HPKfHSp7QMTk
gM5N7lKCTa7S695tMXxGMJtC92pIS0FICERKXvKQvzE7gxkDd3m+JBf+iBYX79JT
JPdORIh59RGBmKTFe66a
=yxgz
-----END PGP SIGNATURE-----

--Sig_/TJUxc1M3Vi05BpMd9iWH6UP--
