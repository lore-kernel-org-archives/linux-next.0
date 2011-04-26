From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Change in DaVinci tree for linux-next
Date: Tue, 26 Apr 2011 11:09:21 +1000
Message-ID: <20110426110921.c4add660.sfr@canb.auug.org.au>
References: <B85A65D85D7EB246BE421B3FB0FBB593024CAE3412@dbde02.ent.ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__26_Apr_2011_11_09_21_+1000_HwN/zuC+2DJSYXHE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41076 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756272Ab1DZBJ0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Apr 2011 21:09:26 -0400
In-Reply-To: <B85A65D85D7EB246BE421B3FB0FBB593024CAE3412@dbde02.ent.ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nori, Sekhar" <nsekhar@ti.com>
Cc: "Hilman, Kevin" <khilman@ti.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

--Signature=_Tue__26_Apr_2011_11_09_21_+1000_HwN/zuC+2DJSYXHE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sekhar,

On Mon, 25 Apr 2011 22:51:15 +0530 "Nori, Sekhar" <nsekhar@ti.com> wrote:
>
> Can you please change the davinci tree in linux-next from:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-davinci.git d=
avinci-next
>=20
> to:
>=20
> git://gitorious.org/linux-davinci/linux-davinci.git davinci-next

Done.

> Kevin recently added me as the co-maintainer for TI DaVinci support
> and I would be taking over the job of actively collecting the patches
> to be merged from the next merge window onward.

I have added you as a second contact for problems with this tree.

> I have made sure the new tree/branch is an exact mirror of Kevin's
> current tree so the switch by itself should not change anything.

Thanks.

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

--Signature=_Tue__26_Apr_2011_11_09_21_+1000_HwN/zuC+2DJSYXHE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNthtBAAoJEDMEi1NhKgbsLcUIAIOFQ7+OxXI7ZqFANKiT9bb5
vx1/an57vXd4do8QDNhR0ra2Gs0+rNjELJ8mzvxvvwkFAARnqCqDM7DWRckjXOPG
Bfoh5ZvzObx2bsKdwNp/wLO1XlQRnTKThmwNfyUNcAIFBepmNKdT3ST8T12oJ0TO
87SWIXxh0mfo8y6D3euxE/EVqr0iSytQhYlSe4H4OiyZwXK9HJjjAmNm5Xuszxo3
/mjZV7B/b65r9V+j9oJb0BVTfhzR6vcgVC8NUE05dl65RAgVzu6raO9bx0beG/PW
KtZxxJcyJ5yPH4/yGAoOtfmEQDN4KdQ2tmULWa9gBm1LL9xH4O0odlHZTA33ZRQ=
=ZGGE
-----END PGP SIGNATURE-----

--Signature=_Tue__26_Apr_2011_11_09_21_+1000_HwN/zuC+2DJSYXHE--
