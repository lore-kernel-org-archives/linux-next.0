From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-integrity
Date: Fri, 6 Jun 2014 14:22:55 +1000
Message-ID: <20140606142255.76bc38f1@canb.auug.org.au>
References: <1402026956.5458.130.camel@dhcp-9-2-203-236.watson.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H8Ry+sW4HhTSnVza9OyQd7/"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58711 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750727AbaFFEXF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2014 00:23:05 -0400
In-Reply-To: <1402026956.5458.130.camel@dhcp-9-2-203-236.watson.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: linux-next <linux-next@vger.kernel.org>

--Sig_/H8Ry+sW4HhTSnVza9OyQd7/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mimi,

On Thu, 05 Jun 2014 23:55:56 -0400 Mimi Zohar <zohar@linux.vnet.ibm.com> wr=
ote:
>
> Please include
> git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity
> #next in linux-next.

OK, it would be good to know what that tree is about ... also it is
really late for inclusion in v3.16 even - I generally do not add trees
to linux-next during the merge window.  This does not mean I won't
include it if you can convince me otherwise ...

Also, you should cc this request to people/mailing lists that may have
a stake or interest in what the tree contains and consider these things
about inclusion:

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
Stephen Rothwell	sfr@canb.auug.org.au

--Sig_/H8Ry+sW4HhTSnVza9OyQd7/
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTkUIlAAoJEMDTa8Ir7ZwVE2sP/3WtHOu5wMqKOWaAXlSTWd0p
8s1R4ABfn+04ASOH7wsFmIm6Q/p1G4z508LHkREMYOyyhnU0rUImCkQCcAKTz7pO
FPCiwW8iwnAj2os3xHQ4gZk2G6G/cMNftUiQsH6IoHjUALTxHUPpYY8pWUrGBEAT
4+TCdDw/85R2PrniYZDJDAapmkO95ISFvJeKx1UPqhDcmxGplEnTWeVqCstclNOD
1w8VxMrxUAnpA5q7VhbWZkwMaapHUjOAOV2GhIgD9n7WtcIFLdbMb33Mgri8TsDU
Rn8hAsY1T45BUQ/QSBZ0kjkueUSuYqBmq7EyDpsCx+AIrytX4kQChdLRg3SOGoks
6T+2ayBBzvek08layEE3yorn1QQecEg/TzxsuPb7ERv6p+nuOxA7JV/1l5CzlEES
0oVzzDOzW7uJLtTW8Qiykj+Oq4mIjE4Ajo+8CGXKoAJkzIhxh8IsU5N4fgtwDoC7
vppvOk+fNQl3Olyuof1jJ+nGJuSpZgna4VE3Wf0J4+FCam5CGPAoDz+gJTVJVoAd
YhPmAVmLQZFUZ5hWIrEtByiR8BOt5ozaF6kmKBkyW69klqwpBucZ7qogwpcL9cLD
vs6zLP4TISSrvEn49T7sfe35YEY+gOakBkDXJ8NQEFom9xu1eRWp/ud2RRB0767Y
oZlOfJ1aLWctdiBLP3F0
=frXf
-----END PGP SIGNATURE-----

--Sig_/H8Ry+sW4HhTSnVza9OyQd7/--
