From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the spi tree with the jc_docs tree
Date: Fri, 20 Mar 2015 16:30:46 +1100
Message-ID: <20150320163046.01ef5023@canb.auug.org.au>
References: <20150320162354.3ed4a511@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lcmltSP9uUYjq8Jf80M0HeG"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39092 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750966AbbCTFaw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2015 01:30:52 -0400
In-Reply-To: <20150320162354.3ed4a511@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Remonda <adrianremonda@gmail.com>

--Sig_/lcmltSP9uUYjq8Jf80M0HeG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 20 Mar 2015 16:23:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the spi tree got a conflict in
> Documentation/spi/spidev_test.c between commit 988b22c519c8 ("spi:
> spidev_test: Added functionalities") from the jc_docs tree and commits
> b78ce7ed5409 ("spi: spidev_test: Cleaned hexadecimal dump"),
> 31a5c5a72b90 ("") and  ("") from the spi tree.

I got distracted in the middle of writing the email :-)

31a5c5a72b90 ("spi: spidev_test: Added verbose output") and
30061915be6e ("spi: spidev_test: Added input buffer from the terminal")

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/lcmltSP9uUYjq8Jf80M0HeG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVC7CKAAoJEMDTa8Ir7ZwVRCQP/A3/wJLkFsEJofx7MR2+LiYO
5tf3TcPr2x+Xi1kNRldTOuBotXZVWhidW+IYOniuIYzXZihBb8gijj7IiGE9QF+3
mSaKUnFyVnvetRBfnyMq3+R4D5nrooM3voQerPjmE64MyF+HZ5K6b5Ogqg+X+duP
pNPs0SJehxQjBrOl97Ld2jQYIloMMJwSJAqJvrQ+ExwwyakXh5gvD7/cK7gJ78Ju
CTQQytPv3SfQxhlnPJYdbPrp4NuSYpdinyW1XTU4/5epPo8c6FJtzW+B+8mx2sGO
2qUyF8p8TnpdTyuQOa/A8zViT0Z40qmjLrlIqjFWi+EGyaaFn61tuQiQnE/FcdeN
5GXHPnmTiwIYOigsnzONve1DDhQ0C87WItAZMt08TWBDWlVRr9Ka/QP0lvfuzkj6
E5P8Uw3TQFvzSvQ2n9lH8IYwLQ/Mz0qN/vGB+FluE8s7BXzttFzHrbUmzvj6ok3r
5ZB7WyZqMiZQFZV+nRON4thIV0POMBgGa2K5NjruKJ7Pp82ygMFyg+BvsAVMpB/l
d1IQ8VD5RnWmBV+e70S882wgHHv4QXsR5tiYPsNWDwEU6e1yUAx5aOH2rboGyTlR
1C9qqy/1n/TI775aOWaOvyNpNBzUrnk0e+yvdMjzI+hCGeMsBIOInPhwVPBebLdT
PqAXyGsDbFa60c3PPADG
=/mUp
-----END PGP SIGNATURE-----

--Sig_/lcmltSP9uUYjq8Jf80M0HeG--
