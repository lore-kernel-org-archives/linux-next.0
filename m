From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the net tree
Date: Mon, 29 Dec 2008 14:53:00 +1100
Message-ID: <20081229145300.0a86e1de.sfr@canb.auug.org.au>
References: <20081208144851.c02cc7da.sfr@canb.auug.org.au>
	<20081207.232658.64516148.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_14_53_00_+1100_FA6SATssCOIrm332"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46980 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751449AbYL2DxK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 22:53:10 -0500
In-Reply-To: <20081207.232658.64516148.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, johannes@sipsolutions.net, sam@ravnborg.org

--Signature=_Mon__29_Dec_2008_14_53_00_+1100_FA6SATssCOIrm332
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 07 Dec 2008 23:26:58 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 8 Dec 2008 14:48:51 +1100
>=20
> > Today's linux-next merge of the net tree got a conflict in
> > arch/sparc64/kernel/idprom.c between commit
> > a88b5ba8bd8ac18aad65ee6c6a254e2e74876db3 (sparc,sparc64: unify kernel/"=
")
> > from the sparc tree and commit 7c510e4b730a92cecf94ada45c989d8be0200d47
> > ("net: convert more to %pM") from the net tree.
>=20
> Thanks for reporting this.
>=20
> > The former renamed the file while the latter modified it.  I just delet=
ed
> > the renamed file for now, the %pM conversion can be done later.
>=20
> Yes it's probably the best way to handle this for now.

This conflict is now between the sparc tree and Linus' tree ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_14_53_00_+1100_FA6SATssCOIrm332
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYSZwACgkQjjKRsyhoI8xNUACffJz5Rmt/8kI21ph7RfCFl4fh
xQEAn2CSDpBb/iMo3LUL0G7SytLLEuOx
=Q+i+
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_14_53_00_+1100_FA6SATssCOIrm332--
