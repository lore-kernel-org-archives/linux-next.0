From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [net-next,1/3] netem: convert to qdisc_watchdog_schedule_ns
Date: Tue, 14 Nov 2017 14:49:17 -0800
Message-ID: <20171114144917.66f0047c@xeon-e3>
References: <1510088376-5527-2-git-send-email-dave.taht@gmail.com>
        <20171114211112.GA28794@jhogan-linux.mipstec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.mqhecnEQbKr_PrIAjZI4vC"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:49735 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756952AbdKNWtV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Nov 2017 17:49:21 -0500
Received: by mail-pf0-f195.google.com with SMTP id l24so3085343pfj.6
        for <linux-next@vger.kernel.org>; Tue, 14 Nov 2017 14:49:21 -0800 (PST)
In-Reply-To: <20171114211112.GA28794@jhogan-linux.mipstec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@mips.com>
Cc: Dave Taht <dave.taht@gmail.com>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>

--Sig_/.mqhecnEQbKr_PrIAjZI4vC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Nov 2017 21:11:13 +0000
James Hogan <james.hogan@mips.com> wrote:

> On Tue, Nov 07, 2017 at 12:59:34PM -0800, Dave Taht wrote:
> > diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
> > index db0228a..443a75d 100644
> > --- a/net/sched/sch_netem.c
> > +++ b/net/sched/sch_netem.c =20
>=20
> ...
>=20
> > @@ -305,11 +305,11 @@ static bool loss_event(struct netem_sched_data *q)
> >   * std deviation sigma.  Uses table lookup to approximate the desired
> >   * distribution, and a uniformly-distributed pseudo-random source.
> >   */
> > -static psched_tdiff_t tabledist(psched_tdiff_t mu, psched_tdiff_t sigm=
a,
> > -				struct crndstate *state,
> > -				const struct disttable *dist)
> > +static s64 tabledist(s64 mu, s64 sigma, =20
>=20
> sigma is used in a modulo operation in this function, which results in
> this error on a bunch of MIPS configs once it is made 64-bits wide:
>=20
> net/sched/sch_netem.o In function `tabledist':
> net/sched/sch_netem.c:330: undefined reference to `__moddi3'
>=20
> Should that code not be using <linux/math64.h>, i.e. div_s64_rem() now
> that it is 64bit?
>=20
> Thanks
> James

Not really since random is only 32 bit, the sigma value being 64 bit makes
no sense really.

--Sig_/.mqhecnEQbKr_PrIAjZI4vC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn2/DRbBb5+dmuDyPgKd/YJXN5H4FAloLcu0ACgkQgKd/YJXN
5H6Gew/6A/eZ8FnXQLRCZzlYMeJqz3Bl4b0C4HuUYsEZhSZMyu+TTIJyjhpk4tau
D+VkwNtaOc0J6GmKbvWkb20n08RjN1xAZuNWxL+ohjdLE9SrvMIPzrs+PFiqow8d
ApL8cOsZFnbuha/ncPyXELf5z8xbDPWIJLM0dh07esNy93ZVMKq6slqjAScinJwE
/3iW3Ad5XYuC0PxpeodwtswDVxnXhy5zZqZDz26kxQ93eWk1+8biO6vLOTEKuk3J
jZ0l2r2Lc3npDYO7V6uE/ZRRlyTHULuF28KnrWCKUDuv1FkH2ITNoFeu90BuTT3y
wzMbqp3e3Z9A0fN6etffh6qPN8gmV3KwiIhzeYd6t6CMwQLH6XVDOxp2W8mic4UK
UsItxhRDSTv2mRV/PnJmfF6V27MO47XpnD48X0H0iWyxaBmmwgewrpuOlkXlDHxa
IHxdRfGaglS2U/jxus34T24zFJpyvt6+fjohpMrwq+LW78OLZJm/Y8nzMQ/T1yem
Y7JD+E20evAjRiZB9hk5RgfqtLfwNf4vXgh8vK72e5CVZIKUCQpZV51bx7ZC9Ob4
teBfuyJ4s4iv+4uvXG/PeYYxHDgC0WPVuo7+Gxz+/76ghQvL7F4VY97YlhQCGiat
EEEfDHtrDrAJJQ/NMUUCsD9T8cSAHr41YdSGbBqKwpEzSEZunos=
=oJr8
-----END PGP SIGNATURE-----

--Sig_/.mqhecnEQbKr_PrIAjZI4vC--
