From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: On Which Branch I Have to Base Patches
Date: Tue, 2 Jun 2009 17:23:24 +1000
Message-ID: <20090602172324.b32aecbc.sfr@canb.auug.org.au>
References: <1243924710.2170.23.camel@system>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Jun_2009_17_23_24_+1000_M.T6_bHaP9c7EJ9U"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34774 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753435AbZFBHX2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Jun 2009 03:23:28 -0400
In-Reply-To: <1243924710.2170.23.camel@system>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: vibi_sreenivasan@cms.com
Cc: linux-next@vger.kernel.org

--Signature=_Tue__2_Jun_2009_17_23_24_+1000_M.T6_bHaP9c7EJ9U
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 02 Jun 2009 12:08:30 +0530 vibi sreenivasan <vibi_sreenivasan@cms.c=
om> wrote:
>
> 	On which branch i have to base patches on
> 		 linux-next/stable

This is just the place in Linus' tree that I started from for today's
version of linux-next (this only ever moves forward).

> 		 linux-next/master

This is the complete linux-next tree for today (this is effectively
rebased every release).

> 		 linux-next/history

This is just all the linux-next trees linked together (ignore this - it
is not a useful kernel tree).

> 	Where Can i get information on all these branches?

See above.  Also see http://linux.f-seidel.de/linux-next/pmwiki/

To have a tree included in linux-next it must be based on a tree that is
not rebased (or if it does rebase you can guarantee that your tree is
rebased on top of it) that is included in linux-next already.  In
practise this means "Linus' tree" unless you have dependencies on someone
else's tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Jun_2009_17_23_24_+1000_M.T6_bHaP9c7EJ9U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkok02wACgkQjjKRsyhoI8ypRACfagBzZ32OWJPojew5/V9Wk2m7
Gy0An1Vcx+EgNy/lRQzJW/KICUBvrOJl
=oNf3
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Jun_2009_17_23_24_+1000_M.T6_bHaP9c7EJ9U--
