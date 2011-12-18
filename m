From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Missing gpio/merge branch from linux-next
Date: Mon, 19 Dec 2011 09:40:31 +1100
Message-ID: <20111219094031.971e5fb9a1104ca1eeeb6d7d@canb.auug.org.au>
References: <CACxGe6t2QR2P3_gsaCeSo4npgHVurkVqV5uk1k7z8NZ3N62QJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__19_Dec_2011_09_40_31_+1100_DLrEfQUAsr.Jnz5r"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:59249 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752029Ab1LRWkh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 18 Dec 2011 17:40:37 -0500
In-Reply-To: <CACxGe6t2QR2P3_gsaCeSo4npgHVurkVqV5uk1k7z8NZ3N62QJQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next <linux-next@vger.kernel.org>

--Signature=_Mon__19_Dec_2011_09_40_31_+1100_DLrEfQUAsr.Jnz5r
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

[Have you considered removing the "-2.6" from the tree URLs?]

On Fri, 16 Dec 2011 09:30:29 -0700 Grant Likely <grant.likely@secretlab.ca>=
 wrote:
>
> Can you please add the following tree to linux-next:
>=20
> gpio-current git git://git.secretlab.ca/git/linux-2.6#gpio/merge

I have added that tree form today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Mon__19_Dec_2011_09_40_31_+1100_DLrEfQUAsr.Jnz5r
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIbBAEBCAAGBQJO7mvfAAoJEECxmPOUX5FELPYP+P6RxivIPe13Kz3a0u2scXKC
dAdxE79yXmMXzVzvW+Xe0nkaJJYimXMIlc+ptF7gRnBCvcYQqi7XZLylz0LRrXR9
W0q6TCs2+DRkF61zsB2LvmYm640k8iApQQWc/VpO/a1SBc7CskkwVBsV1Hs0ZqzO
cz3aNqLhg/ELr4TOYhxVECUmpTphQi42lkOhkdoR9wwrZ/fE3qxS3Bu7Ba0f+avV
LyPHseb6fnpE7sJRN6M7unX9BrZ86I/33olg0BuGA0uP37sEOqRgt7urIsWUSE0y
y3yisZ13rLG1j4MtBQWfRpTt1OJ7AWg8J+tYrwskDRPSIOEanReu2K64vvqWx9TB
bruAkgpVA4p8HqP580j3EJppKqB163I4SDTIkj9nEL8JkqE+PK33hna5GUYIyIp3
RqGElENGuEUq2EZ5DmUxtcypWAJUaPMHG4HOx21asUJql0OpHfuJ3PajX05+2gHT
wc4b2qAEGNRGe99sf3rhr0cnAvZySB8+6N4BVBc3y3CHhHlHqMnT293faoxvGYYs
kHrRx9D4Sf/RNA+9xvHZBHHMsaRMulj14nYk6kI4euyDpcPe6cwE/w5Vij7p37JM
n/HsK/VpCXN7TF0QXfGCSvzqIEzrZepdOghtz//bzbP2kMHcx7rPr/EPtm8qapxH
iUVWO397yEBqKE/ylUA=
=zQj+
-----END PGP SIGNATURE-----

--Signature=_Mon__19_Dec_2011_09_40_31_+1100_DLrEfQUAsr.Jnz5r--
