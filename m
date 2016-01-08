From: Boqun Feng <boqun.feng@gmail.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 8 Jan 2016 23:58:40 +0800
Message-ID: <20160108155840.GC4300@fixme-laptop.cn.ibm.com>
References: <20160107195725.3a130b4d@canb.auug.org.au>
 <20160107180244.GR3818@linux.vnet.ibm.com>
 <20160108071932.060a9bcc@canb.auug.org.au>
 <20160107205220.GU3818@linux.vnet.ibm.com>
 <20160108013631.GA11410@fixme-laptop.cn.ibm.com>
 <20160108034157.GZ3818@linux.vnet.ibm.com>
 <20160108150850.1ec97e78@canb.auug.org.au>
 <20160108044835.GB3818@linux.vnet.ibm.com>
 <20160108045453.GB4300@fixme-laptop.cn.ibm.com>
 <20160108155341.GC3818@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36691 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755727AbcAHP7S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Jan 2016 10:59:18 -0500
Content-Disposition: inline
In-Reply-To: <20160108155341.GC3818@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>


--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2016 at 07:53:41AM -0800, Paul E. McKenney wrote:
> On Fri, Jan 08, 2016 at 12:54:53PM +0800, Boqun Feng wrote:
> > On Thu, Jan 07, 2016 at 08:48:35PM -0800, Paul E. McKenney wrote:
> > > On Fri, Jan 08, 2016 at 03:08:50PM +1100, Stephen Rothwell wrote:
> > > > Hi Paul,
> > > >=20
> > > > On Thu, 7 Jan 2016 19:41:57 -0800 "Paul E. McKenney" <paulmck@linux=
=2Evnet.ibm.com> wrote:
> > > > >
> > > > > Indeed, I suspect that SRCU might not be the only thing that woul=
d like
> > > > > static per-CPU variables.  ;-)
> > > >=20
> > > > from include/linux/percpu-defs.h:
> > > >=20
> > > >  * s390 and alpha modules require percpu variables to be defined as
> > > >  * weak to force the compiler to generate GOT based external
> > > >  * references for them.  This is necessary because percpu sections
> > > >  * will be located outside of the usually addressable area.
> > > >  *
> > > >  * This definition puts the following two extra restrictions when
> > > >  * defining percpu variables.
> > > >  *
> > > >  * 1. The symbol must be globally unique, even the static ones.
> > > >  * 2. Static percpu variables cannot be defined inside a function.
> > > >  *
> > > >  * Archs which need weak percpu definitions should define
> > > >  * ARCH_NEEDS_WEAK_PER_CPU in asm/percpu.h when necessary.
> > > >  *
> > > >  * To ensure that the generic code observes the above two
> > > >  * restrictions, if CONFIG_DEBUG_FORCE_WEAK_PER_CPU is set weak
> > > >  * definition is used for all cases.
> > > >=20
> > > > so they can be static, but must be globally unique.
> >=20
> > Interesting ;-) Thank you.
> >=20
> > > Thank you for the tutorial!  I have updated the patch to use a unique
> > > name for the srcu_struct added by rcuperf.c.
> >=20
> > Plus a comment for DEFINE_STATIC_SRCU saying srcu can be defined as
> > static but must have a unique name for this reason?
>=20
> Yes, plus some words about how to work around the limitation.  How about
> the patch below?
>=20

Looks very good to me ;-)

Regards,
Boqun

> 							Thanx, Paul
>=20
> ------------------------------------------------------------------------
>=20
> commit 61822ff81839ee3c5b6094ce348944d972b87892
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Fri Jan 8 07:43:50 2016 -0800
>=20
>     rcu: Document unique-name limitation for DEFINE_STATIC_SRCU()
>    =20
>     SRCU uses per-CPU variables, and DEFINE_STATIC_SRCU() uses a static
>     per-CPU variable.  However, per-CPU variables have significant
>     restrictions, for example, names of per-CPU variables must be globally
>     unique, even if declared static.  These restrictions carry over to
>     DEFINE_STATIC_SRCU(), and this commit therefore documents these
>     restrictions.
>    =20
>     Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>     Reported-by: kbuild test robot <fengguang.wu@intel.com>
>     Suggested-by: Boqun Feng <boqun.feng@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>=20
> diff --git a/include/linux/srcu.h b/include/linux/srcu.h
> index f5f80c5643ac..dc8eb63c6568 100644
> --- a/include/linux/srcu.h
> +++ b/include/linux/srcu.h
> @@ -99,8 +99,23 @@ void process_srcu(struct work_struct *work);
>  	}
> =20
>  /*
> - * define and init a srcu struct at build time.
> - * dont't call init_srcu_struct() nor cleanup_srcu_struct() on it.
> + * Define and initialize a srcu struct at build time.
> + * Do -not- call init_srcu_struct() nor cleanup_srcu_struct() on it.
> + *
> + * Note that although DEFINE_STATIC_SRCU() hides the name from other
> + * files, the per-CPU variable rules nevertheless require that the
> + * chosen name be globally unique.  These rules also prohibit use of
> + * DEFINE_STATIC_SRCU() within a function.  If these rules are too
> + * restrictive, declare the srcu_struct manually.  For example, in
> + * each file:
> + *
> + *	static struct srcu_struct my_srcu;
> + *
> + * Then, before the first use of each my_srcu, manually initialize it:
> + *
> + *	init_srcu_struct(&my_srcu);
> + *
> + * See include/linux/percpu-defs.h for the rules on per-CPU variables.
>   */
>  #define __DEFINE_SRCU(name, is_static)					\
>  	static DEFINE_PER_CPU(struct srcu_struct_array, name##_srcu_array);\
>=20

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWj9ysAAoJEEl56MO1B/q4+hoH/2XtCCYfb7LoEi67aCf+QvCr
N7HwffXqUoDyIG9Q1NxXvMfuD237plSWWt9UpXKEepCh6w7VOE+Wp6yfIejRJrQ/
Yw963im1PTW2b0MwNF50I6nE3Hq0n658BmU+8ZoFjRi2npaKBuSqvODs+/rRLMC8
435/BsWr9K4IPOE3E6drKli+kXjOiP5eJJenVDYDhoYRszm68vq3cH3lOABfQI4j
skPKG0uoDtjz+o2+Eh7Anamc89puUOobRjYjFTJz56lfUykW6HyhyzQadrAnWTha
jyhnhU2BIHqjGtp6PBa5g0hMqQoMTQo7m5LTZWx7B5AABrZb7q/o26byeAFXqYo=
=9YTR
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
