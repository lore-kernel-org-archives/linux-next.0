From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add bcm2835 tree to linux-next
Date: Mon, 29 Oct 2012 10:07:04 +1100
Message-ID: <20121029100704.37f017de8b0ed0173c5d68cc@canb.auug.org.au>
References: <5089FD2F.9090507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__29_Oct_2012_10_07_04_+1100_3t.fVIQmNjUTJFl3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:59282 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754836Ab2J1XHQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 28 Oct 2012 19:07:16 -0400
In-Reply-To: <5089FD2F.9090507@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org

--Signature=_Mon__29_Oct_2012_10_07_04_+1100_3t.fVIQmNjUTJFl3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, 25 Oct 2012 21:02:07 -0600 Stephen Warren <swarren@wwwdotorg.org> w=
rote:
>
> Could you please add the bcm2835 ARM SoC tree to linux-next. It's
> available at:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-rpi.git for-n=
ext
>=20
> Its probably best to insert it into the list somewhere after the
> existing arm-soc tree. I also maintain the Tegra tree, so if you insert
> it right next to that, any issues related to me will be triggered at the
> same time:-)
>=20
> Right now, it's based on v3.7-rc2, plus 5 patches.

Added from today.

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

--Signature=_Mon__29_Oct_2012_10_07_04_+1100_3t.fVIQmNjUTJFl3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQjbqYAAoJEECxmPOUX5FEzr8P/0fOZ47o7sNM8wAbl1gLUeRx
4ZqvkS2FCQoAnOUsG/mCEHd4JBmm044xjGwQvDoK74tmTdBt5FJ+J6wH2JpnKIYG
ErPxopShE0YsFBjMGB5T6CzsMqJIMD5DaWWTYlXEtpcHslIKO1nV59cHO66lpMjG
OQmohy6KHJv9j66Gm4zaoXxZJS+AY4IN+qcbwCOJq7hP+D75SfNgiK5zbKpwWYvP
5bEMasNSkdWbsrgABRAFRe9Lr/FOJ5QqmjizcdJssJNvlsvp3eAnx7vkbMTiTOZY
wm2I+EZssVWieMH/oDjioUFVN5cw1purawsAQW8SBFTnQ+HYSzAX7zGdwscQhZZR
6jLuKIrFqpxes9xrZtMcRGBXXn99EDz9dFzI++NvLnVmaeutm77qyUNVgnxDwJF6
YvI8uNT0HOEzBHExq/aXSt4Z+Fy+eXxS3FMd4LhOf+UmEQJ5ggP3oPecOd+wZ31o
HUCWrQ+NWODVOxUS8pfnhCV+aEacnkEEydpNRxADSnFIg5Lx83dImK0kp2bXWdyj
y/Of3hlEqQSYSPQgcrCpPBa8TXPUFVVCzgC9dafqvZIZVzs/z2G0pyF8iKBhlkUX
OrkS28F5YmkrCNOUB0R0Z9rcxudbRB+RdefJZWtMNR/GsLVW94DNsFaTVchvxQ3D
TPnF8DFZOrUXNGKcwONA
=s4ge
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Oct_2012_10_07_04_+1100_3t.fVIQmNjUTJFl3--
