From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: ARM64 HugePages for linux-next
Date: Mon, 17 Jun 2013 10:02:20 +1000
Message-ID: <20130617100220.0070ebf433010b5e41906a69@canb.auug.org.au>
References: <20130614112908.GA4660@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__17_Jun_2013_10_02_20_+1000_PGvysljnMZ+BX/D0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:36625 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755502Ab3FQACf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 16 Jun 2013 20:02:35 -0400
In-Reply-To: <20130614112908.GA4660@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve Capper <steve.capper@linaro.org>
Cc: linux-next@vger.kernel.org, catalin.marinas@arm.com, akpm@linux-foundation.org

--Signature=_Mon__17_Jun_2013_10_02_20_+1000_PGvysljnMZ+BX/D0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Fri, 14 Jun 2013 12:29:09 +0100 Steve Capper <steve.capper@linaro.org> w=
rote:
>
> I've been working on a patch set to add huge page support to ARM64, this
> includes some changes to mm and x86. I've been advised by Andrew Morton t=
o get
> these into linux-next asap:
> http://marc.info/?l=3Dlinux-mm&m=3D137115843813005&w=3D2
>=20
> Would it please be possible to have the patches from the git repo below p=
ulled
> directly into linux-next?

Added from today with you as contact and called arm64-hugepages.

> (I've just merged them against linux-next/master and they build and run f=
ine
> for me in an ARM64 Fast Model).

Thanks for testing that.

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

--Signature=_Mon__17_Jun_2013_10_02_20_+1000_PGvysljnMZ+BX/D0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJRvlIQAAoJEECxmPOUX5FEzwEP/jv5FWI1gJRtbASMlFT8cds2
SQnWAuLTqyY+XdkeusHX6z3Y9vljj9vKZHfPthIhaRPhHvuzkjl9SV6SRzuj4dYL
2zdD5qVG3FIYO2c4CtfwSaBDieVM1kFSQxDeHF5OHzSgyOiqtAo62c/iIrwjvajt
C4lkOzb373BrXV755NoKhn7MIskMj0dH+V5V4xDpOcEZFhExz5SHQDK/cGPl2dR4
nL52/TDKDQm8zGpOnoWwhVJPHbpBSKDD7x0WVuc9IDVnVLbg0jE4/aCD5tbaLmxf
tLI3L3KRaFah5yMtJsoIa7iXAfWnbvdd7sA6G47oRfQWYX/aRuZ6jT1WQUhHTV92
KLVaCVjwv0PHKAcd64mlcQerToVZu/Rrq/YSFORhfH5luQeMGNwAxTFnqqqM6mfR
/T8gkub2ysznP8groZz09ignva6nXHwzgX8LjseuFWcKrX5AZ0xR5wgb/lpZF6SC
aIiY+lO/O6EMkmnfJrSs0oX5yPQ4DQyuQW+azRTvcg5km6I8ZrXERmX2WxFR/jsi
QMupK48hKUoTMlcsnhw7v5ng9ThszSHFNitKmHM2E0X52ivcNlDTZXIvlMw5SLCs
/lEKch8Ez48HJRJQ/cGaadwC/xHI23L8IYnj8RZoeUGUhaJHd1ZzCBtZhdfQxlf3
TuKczt29MEqDeK48nXEy
=TBig
-----END PGP SIGNATURE-----

--Signature=_Mon__17_Jun_2013_10_02_20_+1000_PGvysljnMZ+BX/D0--
