From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Changing the audit tree
Date: Wed, 22 Oct 2014 09:19:10 +1100
Message-ID: <20141022091910.4b679f97@canb.auug.org.au>
References: <9758761.m8PZOHvPUF@sifl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HK3rlxmg9zH2SqkJx5cic7A"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41760 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933394AbaJUWT3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2014 18:19:29 -0400
In-Reply-To: <9758761.m8PZOHvPUF@sifl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-audit@redhat.com, linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

--Sig_/HK3rlxmg9zH2SqkJx5cic7A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, 21 Oct 2014 17:00:48 -0400 Paul Moore <paul@paul-moore.com> wrote:
>
> The audit tree has just changed hands and as a result the git repo has=20
> changed.  The new location is:
>=20
>  * git://git.infradead.org/users/pcmoore/audit next

OK, I have updated to that and have this address as the (sole) new
contact.

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

--Sig_/HK3rlxmg9zH2SqkJx5cic7A
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJURtvuAAoJEMDTa8Ir7ZwVniAP/jgnYaruYk3/nBpyktk17UU6
z8UHFMrVMkBZvQKvkf47DKWJ/mpIa0P6pY2+MS29miqGhe1c10skieKzqWT61ply
TdPest89+9nB0tcL9faTtV8XdWt8Gho7qhNRq7qCqMjkV/QjP2ADMjUdsOraaXmh
jLhLPhIa6bjMBCrAcM3H50SOMA1H0k2ehPF57XDqahPu7pT27yg4nxg+AQ7YkM1v
TCFJHmq/yUyV+Lde9wJAtZX82Sv7mAi1PhhP8o1N1LikzXyZkOy3yr9zAjLpNTtv
38udjx6aSvOW3GePy8NhCAJzHfDbrEAtLl70QhxmxjQlkFT+hHKvlJipZV7pmByb
q5ANtz41LG3GJqXwHoLH/BIaPM5LOsJUP4pjrVWooRv+SKRKHR2Wh5AupZiFirsM
8105e7p2Ome68tMPy7iPAtaP8o8xdVNfq7aZCKj9qzBfXSfrHjO0KF/mq2cdf38T
+TdxDi26/Ow9HjbfaIWM8JyMj2cWGDIMI74D26MC0cs1oKUQpP3bDWxb+7bINPjU
n7PC/MAdQrL/eslj6k4dy/mTZP+mXiWR5O7j+0Zd2C7SpF6sXx0M6Gyt+6VRGyAv
5SPEPhjudzPFJlSMHjg5B2OqrQ5g3rwaFRvkEc4VE85a1Gi8W/5ITUQLzuxG0CkS
JXunmz1O8/3iq2jABadx
=WZ5n
-----END PGP SIGNATURE-----

--Sig_/HK3rlxmg9zH2SqkJx5cic7A--
