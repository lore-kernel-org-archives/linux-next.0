From: Boqun Feng <boqun.feng@gmail.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 8 Jan 2016 12:54:53 +0800
Message-ID: <20160108045453.GB4300@fixme-laptop.cn.ibm.com>
References: <20160107195725.3a130b4d@canb.auug.org.au>
 <20160107180244.GR3818@linux.vnet.ibm.com>
 <20160108071932.060a9bcc@canb.auug.org.au>
 <20160107205220.GU3818@linux.vnet.ibm.com>
 <20160108013631.GA11410@fixme-laptop.cn.ibm.com>
 <20160108034157.GZ3818@linux.vnet.ibm.com>
 <20160108150850.1ec97e78@canb.auug.org.au>
 <20160108044835.GB3818@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:36826 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753612AbcAHEz1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2016 23:55:27 -0500
Content-Disposition: inline
In-Reply-To: <20160108044835.GB3818@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2016 at 08:48:35PM -0800, Paul E. McKenney wrote:
> On Fri, Jan 08, 2016 at 03:08:50PM +1100, Stephen Rothwell wrote:
> > Hi Paul,
> >=20
> > On Thu, 7 Jan 2016 19:41:57 -0800 "Paul E. McKenney" <paulmck@linux.vne=
t.ibm.com> wrote:
> > >
> > > Indeed, I suspect that SRCU might not be the only thing that would li=
ke
> > > static per-CPU variables.  ;-)
> >=20
> > from include/linux/percpu-defs.h:
> >=20
> >  * s390 and alpha modules require percpu variables to be defined as
> >  * weak to force the compiler to generate GOT based external
> >  * references for them.  This is necessary because percpu sections
> >  * will be located outside of the usually addressable area.
> >  *
> >  * This definition puts the following two extra restrictions when
> >  * defining percpu variables.
> >  *
> >  * 1. The symbol must be globally unique, even the static ones.
> >  * 2. Static percpu variables cannot be defined inside a function.
> >  *
> >  * Archs which need weak percpu definitions should define
> >  * ARCH_NEEDS_WEAK_PER_CPU in asm/percpu.h when necessary.
> >  *
> >  * To ensure that the generic code observes the above two
> >  * restrictions, if CONFIG_DEBUG_FORCE_WEAK_PER_CPU is set weak
> >  * definition is used for all cases.
> >=20
> > so they can be static, but must be globally unique.

Interesting ;-) Thank you.

>=20
> Thank you for the tutorial!  I have updated the patch to use a unique
> name for the srcu_struct added by rcuperf.c.
>=20

Plus a comment for DEFINE_STATIC_SRCU saying srcu can be defined as
static but must have a unique name for this reason?

Regards,
Boqun

> 							Thanx, Paul
>=20

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWj0EUAAoJEEl56MO1B/q4Rq0IAKFHlCsK41xTpXIbtd50B//u
YniiX/Wd/5bNeD5oJYgrUbBg6eIpw56qGh7IObLQ1Hd6SDFKq2R7XN3/CQgxTTji
wki9CLSgpqj2CZM4Wl6eyk6xpxj9WC0XetkmdBm3ZIQh7ZGz9VpbQnYIePa60Ut3
00tlKlBNzLeB5VULvFWneUSfT7PPwaFXxIKzPbegW7n4max7LCysgirWeygXJVZo
gQqJLq7MSfiEUf0AZYSCjCzDgPSnrKF1ZgYoqe9Dlu/cy04BhYCaY2Sbg5snw6Hc
ye2yqTZZ5BMmIblyU8iCsMzEVj3SxZb1dtA/h90kLsnhxclvt3tF1oco47NCR6E=
=Id3q
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
