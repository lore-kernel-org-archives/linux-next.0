From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [Powerpc/SLQB] Next June 06 : BUG during scsi initialization
Date: Fri, 12 Jun 2009 18:35:59 +1000
Message-ID: <20090612183559.33018f0c.sfr@canb.auug.org.au>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au>
	<4A081002.4050802@in.ibm.com>
	<4A2909E8.6000507@in.ibm.com>
	<Pine.LNX.4.64.0906071105030.11309@melkki.cs.Helsinki.FI>
	<4A2D001E.5060802@in.ibm.com>
	<20090609141903.GE15219@wotan.suse.de>
	<4A31EB2A.9080003@in.ibm.com>
	<20090612074213.GA21070@wotan.suse.de>
	<4A320D12.2050802@in.ibm.com>
	<20090612082145.GD24044@wotan.suse.de>
	<1244795139.30512.23.camel@penberg-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Jun_2009_18_35_59_+1000_r1CRJiogEE36eWH6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33134 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752793AbZFLIgC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Jun 2009 04:36:02 -0400
In-Reply-To: <1244795139.30512.23.camel@penberg-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Nick Piggin <npiggin@suse.de>, Sachin Sant <sachinp@in.ibm.com>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

--Signature=_Fri__12_Jun_2009_18_35_59_+1000_r1CRJiogEE36eWH6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

On Fri, 12 Jun 2009 11:25:39 +0300 Pekka Enberg <penberg@cs.helsinki.fi> wr=
ote:
>
> Hmm, SLQB in my for-next branch. Stephen, is slab.git dropped from
> linux-next or something?

Yesterday (next-20090611) the slab tree for linux-next had only one
commit in it ("SLUB: Out-of-memory diagnostics").  Today (next-20090612)
it has quite a lot in it again - including SLQB.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Jun_2009_18_35_59_+1000_r1CRJiogEE36eWH6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoyE28ACgkQjjKRsyhoI8yu9QCeLXG1xaJg5/rRT32MW1R8p6B1
NJsAn0/Nf8k5NY1Ybv/MVnhbw6AqpdTU
=/kg4
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Jun_2009_18_35_59_+1000_r1CRJiogEE36eWH6--
