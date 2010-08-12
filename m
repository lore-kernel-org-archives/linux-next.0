From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next tree addition request (viafb)
Date: Fri, 13 Aug 2010 08:57:49 +1000
Message-ID: <20100813085749.ac82e91e.sfr@canb.auug.org.au>
References: <4C640502.5030207@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Aug_2010_08_57_49_+1000_vlbI6r.w6cq9xw14"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37150 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752489Ab0HLW54 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Aug 2010 18:57:56 -0400
In-Reply-To: <4C640502.5030207@gmx.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__13_Aug_2010_08_57_49_+1000_vlbI6r.w6cq9xw14
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Florian,

On Thu, 12 Aug 2010 16:28:18 +0200 Florian Tobias Schandinat <FlorianSchand=
inat@gmx.de> wrote:
>
> can you please add
>=20
> 	git://github.com/schandinat/linux-2.6.git viafb-next
>=20
> to linux-next.
> It contains patches for viafb intended for 2.6.37. All patches that are=20
> currently there have been posted.

I will add this after 2.6.36-rc1 has been released.  Do you want to be
the sole contact for warnings/errors/problems?  Or should I add some
other email addresses as well?

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

--Signature=_Fri__13_Aug_2010_08_57_49_+1000_vlbI6r.w6cq9xw14
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMZHxtAAoJEDMEi1NhKgbsE2MIAIzgD2ahC8KIowTHwAkWEWuT
+vrACsYjnrYhk+qGDOcsuq5UJcnAaCLDZua8lPpCe+8pfu7z6zsSDhCzWAfach1J
poxVxPF77h6pxrglGSzwRSQW/ZQvzP5tXFCcA4elfutE4p11kpBL2IrFXYYNyCXn
hs6YCckpBdntc9ThL1vzGCyb3erEaGzxdgDGrw6/umVGO53vdc1osSRDnnXee3KG
vNyfCBfaf4EsmsguP/1Rok41I2IocR1cgWp4uMRGbKDWoiJjtJewTAVhnO057c2L
nVMmSE5WN/2VfFfJnVLknFLJevcp6bhX8ISkcOxu+gCt62IulptNE28wZtdeVCA=
=3i5D
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Aug_2010_08_57_49_+1000_vlbI6r.w6cq9xw14--
