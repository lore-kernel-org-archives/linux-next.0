From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: add slave-dma tree to linux-next
Date: Thu, 2 Jun 2011 09:57:20 +1000
Message-ID: <20110602095720.ec407b9c.sfr@canb.auug.org.au>
References: <1306938694.10976.73.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__2_Jun_2011_09_57_20_+1000_75_fNemx.3YZvavY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55258 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758202Ab1FAX5W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Jun 2011 19:57:22 -0400
In-Reply-To: <1306938694.10976.73.camel@vkoul-udesk3>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Koul, Vinod" <vinod.koul@intel.com>
Cc: Dan <dan.j.williams@intel.com>, linux-next@vger.kernel.org

--Signature=_Thu__2_Jun_2011_09_57_20_+1000_75_fNemx.3YZvavY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Wed, 01 Jun 2011 20:01:34 +0530 "Koul, Vinod" <vinod.koul@intel.com> wro=
te:
>
> Since I am managing the below mentioned slave-dma tree, it would be
> great if you could add this to you linux-next.
>=20
> git://git.infradead.org/users/vkoul/slave-dma.git next

I have added your tree from today.

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

--Signature=_Thu__2_Jun_2011_09_57_20_+1000_75_fNemx.3YZvavY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN5tHgAAoJEDMEi1NhKgbs8IcH/23Ek8lCo0pWLAHDWd9DZlnx
jGHHGnnpZI+WuyWSkcryczzSWkz7U0g8TldvcrsnY4MqK5WgOAMLn1XQz9yE/Cw/
QMX0KAR0R3H8UxJFXCoaXCX7gi6dYjRWmNPQOuroEioIZvzs/caUIgNUNQx8GhmI
Cqb8CEWSK3YarTf5LBq0pElzaeABXqP7W+T+VOXlwxcx+y/FJu4noEXgZ9y6zFQc
frwMykw+DdQ5PQyV6h8nsZfRfcuX0xRql9HPfQpVmRBUeCjlJToPa5hWVR5yeGa3
sIoiwL72HGMQmPG2X4lTS6Djfw48dKxt06/y7ke4gfb5zlhBGbiDMggLa4Cmffc=
=xznR
-----END PGP SIGNATURE-----

--Signature=_Thu__2_Jun_2011_09_57_20_+1000_75_fNemx.3YZvavY--
