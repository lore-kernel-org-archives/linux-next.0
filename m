From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 2 Jul 2008 00:51:34 +1000
Message-ID: <20080702005134.d07261ad.sfr@canb.auug.org.au>
References: <20080702001740.9bbea0df.sfr@canb.auug.org.au>
	<20080701152302.07cdba1e@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__2_Jul_2008_00_51_34_+1000_w3/2brZKW8Ba5BPW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52258 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754039AbYGAOvg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 10:51:36 -0400
In-Reply-To: <20080701152302.07cdba1e@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__2_Jul_2008_00_51_34_+1000_w3/2brZKW8Ba5BPW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Tue, 1 Jul 2008 15:23:02 +0100 Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
>
> > It could easily (probably) have been the merge.
> >=20
> > I have reverted the ttydev tree for now.  I am not sure quite where we =
go
> > from here.
>=20
> Well I expected there would be a few explosions from merging a large new
> tree in. No problem. As soon as the new tree is done and out I will
> regenerate the patch set versus that which should iron out all the
> firmware clashes and the like.

One downsides of the way linux-next works is that, because it is
recreated every day, you cannot really base anything on it that is to be
merged into it.

I really need to think about this when I am awake :-(
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Jul_2008_00_51_34_+1000_w3/2brZKW8Ba5BPW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqRHYACgkQjjKRsyhoI8zRsgCfUnYcr1VKpUsaH0idJ1co2Ppk
reUAn0c1ZqizU9zVMQUtos6UvrO8V7So
=TQKc
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jul_2008_00_51_34_+1000_w3/2brZKW8Ba5BPW--
