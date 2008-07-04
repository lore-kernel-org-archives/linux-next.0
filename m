From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the pci tree
Date: Fri, 4 Jul 2008 10:09:33 +1000
Message-ID: <20080704100933.c39faef1.sfr@canb.auug.org.au>
References: <20080703121055.d6f49ae5.sfr@canb.auug.org.au>
	<20080703032842.GA26951@kroah.com>
	<200807031223.10287.jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Jul_2008_10_09_33_+1000_hoq8Bjf4CQ6mcpeh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49354 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753322AbYGDAJp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 20:09:45 -0400
In-Reply-To: <200807031223.10287.jbarnes@virtuousgeek.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>

--Signature=_Fri__4_Jul_2008_10_09_33_+1000_hoq8Bjf4CQ6mcpeh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

On Thu, 3 Jul 2008 12:23:10 -0700 Jesse Barnes <jbarnes@virtuousgeek.org> w=
rote:
>
> > Yes, Greg send him these patches earlier today :)
>=20
> Ok I guess I have to merge upstream into my linux-next tree then.  I've r=
eally=20
> been trying to avoid that so far, but I guess it's time...

Not really.  You just need to make the changes that are in Greg's patches
and he will drop his version.  Basically, the just change every all
references to ->bus_id to use dev_name() and any setting of bus_id (or
pci_name) to use dev_set_name.

Even if Greg doesn't drop his, I can handle the trivial conflicts until
he does.

Unless, of course, there are other changes in upstream that affect all
this (like you don't yet have the part of Linus' tree that defines
dev_name and dev_set_name).

(I should stop writing emails as a train of thought - it ends up as a
wreck too often :-))

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Jul_2008_10_09_33_+1000_hoq8Bjf4CQ6mcpeh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhtaj0ACgkQjjKRsyhoI8y7jACePWD1piz9XmfCSI5fdZqz4MjC
nccAoKZAMVQBofjPGqc/D9Le4vzHA0tD
=+prY
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Jul_2008_10_09_33_+1000_hoq8Bjf4CQ6mcpeh--
