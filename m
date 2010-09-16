From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the final tree (sound
 tree related)
Date: Thu, 16 Sep 2010 15:10:40 +1000
Message-ID: <20100916151040.aabfc852.sfr@canb.auug.org.au>
References: <20100916150948.cc9ebed8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Sep_2010_15_10_40_+1000_z6FWWYqEqd8UKuwr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56198 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750726Ab0IPFKo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Sep 2010 01:10:44 -0400
In-Reply-To: <20100916150948.cc9ebed8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__16_Sep_2010_15_10_40_+1000_z6FWWYqEqd8UKuwr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Thu, 16 Sep 2010 15:09:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:

Actually that was an i386 defconfig build.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Sep_2010_15_10_40_+1000_z6FWWYqEqd8UKuwr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMkabQAAoJEDMEi1NhKgbsU+gIAJJ7uyY/TuAsHlZmKjRZfytp
GlqsuQ3P/g/KsanWv2QJGwvVu5ZO4AW4wwzWL3Az/kCcVqqNveHRxs4zFDCn0DKe
ao/jZOvisNXQbfLsQEVbtSbOzIrsjmIXNAwmcj7+dAXz4aV/Y7j0+QaJe52aI2f1
qsLAeShxnJ1fxnNt2r6Im/ndop6pFAGre4LXYyw0jUc1IQDA8Dm3UXIzNwcdqaON
ZbHzGHDdeJEKIk5ISSvvzZ4X6vXCZSOJmL7/YzzTdORPjdLoNKxDgTqQCoX4MLfW
7RggkS1nY/H59EFWsBiCtdQo+6DRqq5B5q79utcx3osfnLgp8NjOLn28umvcEr0=
=am+P
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Sep_2010_15_10_40_+1000_z6FWWYqEqd8UKuwr--
