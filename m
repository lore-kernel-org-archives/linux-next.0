From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Change of the bluetooth-next-2.6 tree
Date: Mon, 18 Oct 2010 09:27:43 +1100
Message-ID: <20101018092743.dbde89a9.sfr@canb.auug.org.au>
References: <20101015001817.GE9250@vigoh>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_Oct_2010_09_27_43_+1100_Kv7owYXeFT+o=nBW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55563 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750961Ab0JQW1z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Oct 2010 18:27:55 -0400
In-Reply-To: <20101015001817.GE9250@vigoh>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Gustavo F. Padovan" <padovan@profusion.mobi>
Cc: linux-next@vger.kernel.org, marcel@holtmann.org

--Signature=_Mon__18_Oct_2010_09_27_43_+1100_Kv7owYXeFT+o=nBW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

On Thu, 14 Oct 2010 21:18:17 -0300 "Gustavo F. Padovan" <padovan@profusion.=
mobi> wrote:
>
> I want to request the change of the bluetooth for -next stuff in linux
> tree. (didn't find other place better than this mailing list to request
> this :) The new tree is at
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/padovan/bluetooth-next-2.6.=
git

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

--Signature=_Mon__18_Oct_2010_09_27_43_+1100_Kv7owYXeFT+o=nBW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMu3hfAAoJEDMEi1NhKgbs9FQH/R56yvGubzLx37th+1McKCBN
I2wx37amdQo6ptpelbV2kAJpzCdEwI2sx1mA5Yp6hZeP7/7buNS8FO0grBH+WAxP
iPiFIPk2HZuO1HBJay/wxq1v/P5ut2kPcIBPdKP6QfeTVSomIB8S0tiHayAFvjZz
jWZ7qEzbAdHIivDqGJERfr/STyN34F+C5gntA1UMJ581uxQpKEJg8g3I87dFwfrK
x53rSeSg3mfFXP4PVXgSelc+6CqR4n5o35V2OyejBGxWBPBMLtq4F5Is9zCqb/Pj
OhXOzqaHqgAPqVxB20J5d7I6sj5YPH7cno9b8+4dcftlZB0dcIR4sBeLYEWjH7w=
=UJ1G
-----END PGP SIGNATURE-----

--Signature=_Mon__18_Oct_2010_09_27_43_+1100_Kv7owYXeFT+o=nBW--
