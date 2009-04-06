From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH next] sysctl: fix build breakage
Date: Mon, 6 Apr 2009 17:11:12 +1000
Message-ID: <20090406171112.dcfd1dc3.sfr@canb.auug.org.au>
References: <20090406070152.GA29032@orion>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__6_Apr_2009_17_11_12_+1000_HZFB6BZNiG7PLl6s"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55274 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753059AbZDFHLT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Apr 2009 03:11:19 -0400
In-Reply-To: <20090406070152.GA29032@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, kees@ubuntu.com

--Signature=_Mon__6_Apr_2009_17_11_12_+1000_HZFB6BZNiG7PLl6s
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Mon, 6 Apr 2009 11:01:52 +0400 Alexander Beregalov <a.beregalov@gmail.co=
m> wrote:
>
> Fix this build error when MODULES is not set:
> kernel/sysctl.c:545: error: 'one' undeclared here

Thanks for this.

This is a result of the automated merge of the security-testing tree into
the linux-next tree getting it wrong (but it is unreasonable to expect it
to get it right).  I will fix this up tomorrow if it is still necessary.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__6_Apr_2009_17_11_12_+1000_HZFB6BZNiG7PLl6s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknZqxAACgkQjjKRsyhoI8ywwgCfbWdprGxNj52RaBwhk/D+PiqH
SVEAn24Jaeg5KYngF0gqaoR6R+bLGAhT
=JF+j
-----END PGP SIGNATURE-----

--Signature=_Mon__6_Apr_2009_17_11_12_+1000_HZFB6BZNiG7PLl6s--
