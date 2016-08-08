From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
Date: Mon, 8 Aug 2016 11:37:33 -0400
Message-ID: <6a554a80-c3ed-1902-14d1-f1e03adbed49@redhat.com>
References: <20160808115827.6dd7fa6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AM0ihWFP9I07NM5tB0d7T2iUTJNeEIXUn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35118 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752020AbcHHPhs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Aug 2016 11:37:48 -0400
In-Reply-To: <20160808115827.6dd7fa6f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Moni Shoua <monis@mellanox.com>, Kamal Heib <kamalh@mellanox.com>, Amir Vadai <amirv@mellanox.com>, Haggai Eran <haggaie@mellanox.com>, Leon Romanovsky <leon@kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AM0ihWFP9I07NM5tB0d7T2iUTJNeEIXUn
Content-Type: multipart/mixed; boundary="F1gsV3W8xoVwAwMnXwahDpMTUFCEPrfP0"
From: Doug Ledford <dledford@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Moni Shoua <monis@mellanox.com>, Kamal Heib <kamalh@mellanox.com>,
 Amir Vadai <amirv@mellanox.com>, Haggai Eran <haggaie@mellanox.com>,
 Leon Romanovsky <leon@kernel.org>
Message-ID: <6a554a80-c3ed-1902-14d1-f1e03adbed49@redhat.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
References: <20160808115827.6dd7fa6f@canb.auug.org.au>
In-Reply-To: <20160808115827.6dd7fa6f@canb.auug.org.au>

--F1gsV3W8xoVwAwMnXwahDpMTUFCEPrfP0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 8/7/2016 9:58 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> With Linus' tree, today's linux-next build (powerpc allyesconfig) faile=
d
> like this:
>=20
> drivers/infiniband/sw/built-in.o:(.opd+0x1698): multiple definition of =
`copy_data'
> drivers/infiniband/hw/built-in.o:(.opd+0xe5f8): first defined here
> drivers/infiniband/sw/built-in.o:(.opd+0x1320): multiple definition of =
`rxe_av_from_attr'
> drivers/infiniband/hw/built-in.o:(.opd+0xe280): first defined here

This looks very suspicious.  I think you are picking up two copies of
the rxe code.  One from Linus tree and one from probably Leon's tree.
The thing is, the rxe driver is an entirely software RoCE driver.  So,
after I picked it up, I moved it from drivers/infiniband/hw to
drivers/infiniband/sw where it more correctly belongs.  Leon's tree
doesn't have that move, and since you pull Leon's tree into your -next
process, with the allyesconfig you are trying to build two copies of it
and put them both statically into the kernel, hence all of the double
definitions.  Leon needs to drop his copy of the rxe driver and let the
one in Linus' tree be the only one in existence.

> drivers/infiniband/sw/built-in.o:(.opd+0x18d8): multiple definition of =
`rxe_do_task'
> drivers/infiniband/hw/built-in.o:(.opd+0xe838): first defined here
>=20
> and lots of others.
>=20
> Caused by commit
>=20
>   8700e3e7c485 ("Soft RoCE driver")
>=20
> (which was never in linux-next :-()

The code was, just not that specific commit.  I both moved the code to
infiniband/sw and also squashed it all down to one commit.  After I did
the move/squash, I got 0day and local testing to make sure I didn't
break it in the move, but I didn't get linux next as I knew it had
already been through that and a move/squash should not break anything
that linux next is testing/checking.

Leon, please drop your rxe code out of your linux-next area so we can
eliminate this issue (or replace it with the final commit I submitted).

> I just disabled teh driver for today:

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 8 Aug 2016 11:52:53 +1000
> Subject: [PATCH] Disable the Soft RoCE driver
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/infiniband/Kconfig     | 1 -
>  drivers/infiniband/sw/Makefile | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/drivers/infiniband/Kconfig b/drivers/infiniband/Kconfig
> index 0c2e55c5354b..53ef194c5be1 100644
> --- a/drivers/infiniband/Kconfig
> +++ b/drivers/infiniband/Kconfig
> @@ -86,7 +86,6 @@ source "drivers/infiniband/ulp/iser/Kconfig"
>  source "drivers/infiniband/ulp/isert/Kconfig"
> =20
>  source "drivers/infiniband/sw/rdmavt/Kconfig"
> -source "drivers/infiniband/sw/rxe/Kconfig"
> =20
>  source "drivers/infiniband/hw/hfi1/Kconfig"
> =20
> diff --git a/drivers/infiniband/sw/Makefile b/drivers/infiniband/sw/Mak=
efile
> index 8b095b27db87..988b6a0101a4 100644
> --- a/drivers/infiniband/sw/Makefile
> +++ b/drivers/infiniband/sw/Makefile
> @@ -1,2 +1 @@
>  obj-$(CONFIG_INFINIBAND_RDMAVT)		+=3D rdmavt/
> -obj-$(CONFIG_RDMA_RXE)			+=3D rxe/
>=20


--=20
Doug Ledford <dledford@redhat.com>
    GPG Key ID: 0E572FDD


--F1gsV3W8xoVwAwMnXwahDpMTUFCEPrfP0--

--AM0ihWFP9I07NM5tB0d7T2iUTJNeEIXUn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJXqKdDAAoJELgmozMOVy/dhTkP/iCUQBViwhcluuFPLK7UGyV6
GrWLI4v51dZh3CHjb9zweYeBpDaqrbgPiAziCfUwFgxtzB3NRumQ8YQZ//6+TPxz
aIfCM3cThqqlKZHiKFCPLSo4CWtTdyt8Ci5zGeWGvbA2uJczVEUXwUc18v6aPWaA
tkOKbHk5D3SHGmDFm/RShFb83lyvcka2EFqwi3xpPG6ChoiUWyRLizqAdZH6b1sU
CDlXHeYFSZONpD6KltiveOWUnZHejbPLasyVNsQRygZoAG1a4TOxHLlscbjVK7IC
qT44qDk2XvOHMZBSPorg0huiAz3oYcIt+xiIuR5tzBg5Jpxfio46IL0cACMa502u
RCzWE4o7IOeo8nFNitahe2T1vWU4+U6IGZwLnPThyS3D79Pmsjbl1ARu+9y5pi84
tqfm7FOqdCvreoBnRATfqo9IHaeiZHYpL+wn5IRyAqsnfs7YlsQy2dxjZd+vnaAm
vHIr+cRVZKLApmUExpzHM/Jy2ZCwea9RzzsIHuRGZaqrBogMSGvC7icVDEJlKV0S
/ncJWbmP41feDvupumIlIfCL6oSz03oJqy9wTCeGlNNEqGrkYK8oiNMdyznqRLRC
PIjhsRi6lEd+N+UDmkcySZO8rlkW4CCZtm6tXPkkNSiH7+ivJfz7qaVTN0aQRZrI
GkLFiwlM384WlruTC0pP
=go+u
-----END PGP SIGNATURE-----

--AM0ihWFP9I07NM5tB0d7T2iUTJNeEIXUn--
