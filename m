From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: i2c merge conflict
Date: Mon, 19 May 2008 17:51:15 +1000
Message-ID: <20080519175115.79ae9a15.sfr@canb.auug.org.au>
References: <20080519130235.ce392f62.sfr@canb.auug.org.au>
	<20080519093706.50ef0c63@hyperion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_May_2008_17_51_15_+1000_cEcD3A7JjaqSh65s"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58395 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751903AbYESHvU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 03:51:20 -0400
In-Reply-To: <20080519093706.50ef0c63@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__19_May_2008_17_51_15_+1000_cEcD3A7JjaqSh65s
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Mon, 19 May 2008 09:37:06 +0200 Jean Delvare <khali@linux-fr.org> wrote:
>
> On Mon, 19 May 2008 13:02:35 +1000, Stephen Rothwell wrote:
> > Today's linux-next merge of the i2c tree got a trivial conflict in
> > drivers/i2c/busses/i2c-nforce2.c because "i2c-nforce2: Disable the seco=
nd
> > SMBus channel on the DFI Lanparty NF4 Expert" appeasr in both the i2c
> > tree and Linus' tree.  I assume that this will go away tomorrow when the
> > i2c tree gets resynced.
>=20
> Correct. There are more than just this one patch in this case, BTW. I
> will resync the i2c tree in the next hour and then everything should
> apply again without conflicts.=20

Thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_May_2008_17_51_15_+1000_cEcD3A7JjaqSh65s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMTF3TgG2atn1QN8RAvFvAKCVn7aDZbl32U/X4I06hKg7zsvOwACeOcyi
nfbbgEBsRDQbk9mteTtSDY4=
=1mlW
-----END PGP SIGNATURE-----

--Signature=_Mon__19_May_2008_17_51_15_+1000_cEcD3A7JjaqSh65s--
