From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net-current/net merge conflict
Date: Mon, 26 May 2008 17:49:47 +1000
Message-ID: <20080526174947.88e2bd7a.sfr@canb.auug.org.au>
References: <20080526133234.d6ae478e.sfr@canb.auug.org.au>
	<20080525.232958.10056357.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__26_May_2008_17_49_47_+1000_+v=N7GNf+CHKTVAW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44908 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752674AbYEZHuY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 May 2008 03:50:24 -0400
In-Reply-To: <20080525.232958.10056357.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, jgarzik@redhat.com

--Signature=_Mon__26_May_2008_17_49_47_+1000_+v=N7GNf+CHKTVAW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 25 May 2008 23:29:58 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> I'm trying to do a quick merge of net-2.6 into net-next-2.6
> right now and will push the result out to master.kernel.org
> after some build sanity tests.
>=20
> Hopefully that will resolve both of the current merge
> conflicts in the networking.

That should work, thanks.  These merge conflict fixups are usually not a
real concern I just report them in case I do the wrong fixup and to keep
everyone informed.  When you do necessary merges, these will just
disappear.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_May_2008_17_49_47_+1000_+v=N7GNf+CHKTVAW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIOmuoTgG2atn1QN8RAkSGAJ9YLclTwCUH3nWnJsQFk/vn3HgN4wCghJlp
AKEay0aqcF4vZgcMqgOWuQU=
=ktWp
-----END PGP SIGNATURE-----

--Signature=_Mon__26_May_2008_17_49_47_+1000_+v=N7GNf+CHKTVAW--
