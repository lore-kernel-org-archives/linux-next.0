From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: the return of jfs-next
Date: Mon, 17 Sep 2012 10:20:51 +1000
Message-ID: <20120917102051.440fb6a55d1eed00bc48c701@canb.auug.org.au>
References: <5053A83A.9000802@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__17_Sep_2012_10_20_51_+1000_.ia5YIwjv03_xdT3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:56691 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752068Ab2IQAUz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 16 Sep 2012 20:20:55 -0400
In-Reply-To: <5053A83A.9000802@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Linux-Next <linux-next@vger.kernel.org>

--Signature=_Mon__17_Sep_2012_10_20_51_+1000_.ia5YIwjv03_xdT3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, 14 Sep 2012 16:57:14 -0500 Dave Kleikamp <dave.kleikamp@oracle.com>=
 wrote:
>
> It's been a while, and I've never recovered my kernel.org account, but
> I've got some jfs patches for linux-next at github:
>=20
> git://github.com/kleikamp/linux-shaggy.git jfs-next
>=20
> Can you please add this branch back into linux-next?

Back from today.  You will, of course, need to use a signed tag to get
Linus to fetch from that tree.

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

--Signature=_Mon__17_Sep_2012_10_20_51_+1000_.ia5YIwjv03_xdT3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQVmzjAAoJEECxmPOUX5FEGU4QAKSGNCT/gEw1pdazeoEm/X1T
htjjEYB4HR1mgClK+2Ei9e2X7r+TNcrbOEebwCMuCRFQhiUI2+su7lph2247BKP/
oscGANOD5VUZ7hTuJccJNO9dWScZvciqM7+61aW4Ru7l2XpcVxLeWXR8RQimd4Fw
Pg6bW8wfixP3mha1URsE47Zssso3dwR/KLaLxh3o6aan8HGwOWcHvHduLVLW+9UM
ntERO030N+wdfAsEaDJmxGt9kGmvPydavByhQ6V1GMAgmI+MAQjqa1lKg3rar4WH
c5riZklkyA1/Rdax2Da5tyCQCdP9nfJJx6sew7/Y+cHWK5LZ2xyQJVlfiYi8BhLO
KzFrFl7VzXQgLj/46FSlxSKbvUsDUq4fngx25jpfAZqhkAl9uQhXI6pJ63+R5ioP
floHuiQdut/A0HicBs3YhmBnpBPab+2X76Zj6Yo4Ct7evtE3ZPS/qS68TYmYZHMU
8p7icuMROd+6AZhti9JLsMPkIY3+1CjgnmrxMWi3yycirW65M4JbDzy5xFoCXJ+Y
5BCFvGxpNcLqxsXBtvM9TmreOpFDqm0FxifPajAj3cTFx2/ot/zRksPdR4lvkcIb
Wu+xGyVNKz5X2h+5qEKuOrPNTJjThFvUX/IoDpdEfWJSHhVDR/W01ABC2vuSGWFZ
EsKxF3+fyEbAvCSc+Tq3
=cZCW
-----END PGP SIGNATURE-----

--Signature=_Mon__17_Sep_2012_10_20_51_+1000_.ia5YIwjv03_xdT3--
