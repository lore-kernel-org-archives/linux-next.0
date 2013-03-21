From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request the linux-next inclusion for IMX/MXS tree
Date: Fri, 22 Mar 2013 10:12:03 +1100
Message-ID: <20130322101203.5c986794c37e1d072a2fbcfc@canb.auug.org.au>
References: <20130321015602.GA23109@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__22_Mar_2013_10_12_03_+1100_DquMKqQq./5VOSs6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:38746 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751936Ab3CUXMO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Mar 2013 19:12:14 -0400
In-Reply-To: <20130321015602.GA23109@S2101-09.ap.freescale.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

--Signature=_Fri__22_Mar_2013_10_12_03_+1100_DquMKqQq./5VOSs6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

On Thu, 21 Mar 2013 09:56:04 +0800 Shawn Guo <shawn.guo@linaro.org> wrote:
>
> Can you please help include the following branch into linux-next?
>=20
>   git://git.linaro.org/people/shawnguo/linux-2.6.git for-next
>=20
> I used to rely on arm-soc's for-next branch to expose the IMX/MXS
> patches I collect on linux-next.  But it turns out that the procedure
> takes a longer time than I expect to finish, and it causes that patches
> are not shown on linux-next in time and problems are not found at the
> earliest time.

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

--Signature=_Fri__22_Mar_2013_10_12_03_+1100_DquMKqQq./5VOSs6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRS5PDAAoJEECxmPOUX5FEopAP/1+DIYrw4UyvzZGm3SX5f+wr
BZYlLxBWf9Aby29L0LSQnePQ5MOpJTla2X5jXkxyGaHhXO4km8TJaC9K9FrpveJX
wvFJZbhNEBE9AIRD19WdvhbbZpmSqE10dvGdxu5W9522X4dytxsYeZfH4did2NNX
AgPj2JUTj/Bapuk5TQPZFHvPPkFtlfgHxs2oQxCAlCBlHab/E/VilRPHt/dv+WYR
JgRi5dNkGkoYsTdux2Juj23hLe1ADDosCs9a+kbZ3vv9wekg8Sn08ARec0QIT+Wf
VMlCOYuULLf6kdwcGU2SUTzz6sVMxI5f7jKaattkdqpPnLdY/tTo+BcWsZAkkEcz
1jCo5EA1ms2MvFFwqNxHxV0tjzoMCPYFbVZ7dupTj5qKzG0GUq/OMfrH+EljXbXD
9ebMYsTwA6Mu7gNahYErvnEuj4jkL0ZtCwDKs+uoj3+c64FkYpLNoKYCyohjjvRu
rImUmtXxQVHwR+nO+efyO6TTDYUt1S4PeSkVqWxnRhDwa3OJaGd21ouSwtimCzJl
/3AFN9+2t4bR03rL1F7Y0BcHOl8h3Ky5i53ZESIfdhV0Nzx87++BRU67GvRngIqe
3LP6dWBVmwUFNuNsJTkfIC7PqLSog424pKr9AlHM9Jw0W6ZZME1C/1R/wuI7RC2t
FrULH1TJn9cUwYtjerwW
=gfD8
-----END PGP SIGNATURE-----

--Signature=_Fri__22_Mar_2013_10_12_03_+1100_DquMKqQq./5VOSs6--
