From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 3 Jul 2008 18:07:29 +1000
Message-ID: <20080703180729.1f6b8620.sfr@canb.auug.org.au>
References: <20080703150328.44061d16.sfr@canb.auug.org.au>
	<20080703055644.GB4863@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_18_07_29_+1000_X8qNqqysjePw=15d"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58659 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755394AbYGCMw5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 08:52:57 -0400
In-Reply-To: <20080703055644.GB4863@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org

--Signature=_Thu__3_Jul_2008_18_07_29_+1000_X8qNqqysjePw=15d
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Thu, 3 Jul 2008 07:56:45 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> > Today's linux-next merge of the rr tree got a conflict in=20
> > kernel/stop_machine.c between commit=20
> > 961ccddd59d627b89bd3dc284b6517833bbdf25d ("sched: add new API=20
> > sched_setscheduler_nocheck: add a flag to control access checks") from=
=20
> > the sched tree (which appears to also be in the rr tree) and commit=20
> > e5e62fcd081b0837f6210eb4ed022e9d8920bc59 ("stop_machine:simplify")=20
> > from the rr tree.
> >=20
> > I used the version in the rr tree.  Probably worth a look when I=20
> > publish the tree.
>=20
> hm, is there any difference between the content of the two commits?

I checked after I sent the email and there is no difference.  The
conflict is caused by the further changes in Rusty's tree.

> The "home tree" of the commit is tip/sched/new-API-sched_setscheduler,=20
> and that's integrated to the auto-sched-next branch. If there's any=20
> update to the patch we should iterate it there.

That would be a question for Rusty.  He may be able to split out the
conflicting part of his simplification patch and send it to you.  But it
may not be worth it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_18_07_29_+1000_X8qNqqysjePw=15d
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsiMEACgkQjjKRsyhoI8y1kgCghduy8wADpwVP5zrJO7PP/DY4
rZsAnjec3v8/pG3ou/vn62OhGpSyC108
=CD/E
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_18_07_29_+1000_X8qNqqysjePw=15d--
