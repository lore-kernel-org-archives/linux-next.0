From: Boqun Feng <boqun.feng@gmail.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 8 Jan 2016 09:37:04 +0800
Message-ID: <20160108013631.GA11410@fixme-laptop.cn.ibm.com>
References: <20160107195725.3a130b4d@canb.auug.org.au>
 <20160107180244.GR3818@linux.vnet.ibm.com>
 <20160108071932.060a9bcc@canb.auug.org.au>
 <20160107205220.GU3818@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160107205220.GU3818@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>
List-Id: linux-next.vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2016 at 12:52:20PM -0800, Paul E. McKenney wrote:
> On Fri, Jan 08, 2016 at 07:19:32AM +1100, Stephen Rothwell wrote:
> > Hi Paul,
> >=20
> > On Thu, 7 Jan 2016 10:02:44 -0800 "Paul E. McKenney" <paulmck@linux.vne=
t.ibm.com> wrote:
> > >
> > > On Thu, Jan 07, 2016 at 07:57:25PM +1100, Stephen Rothwell wrote:
> > > > Hi Paul,
> > > >=20
> > > > [I found this a few days ago, but I think I forgot to send the emai=
l,
> > > > sorry.]
> > > >=20
> > > > After merging the rcu tree, today's linux-next build (powerpc
> > > > allyesconfig) failed like this:
> > > >=20
> > > > kernel/rcu/rcuperf.o:(.discard+0x0): multiple definition of `__pcpu=
_unique_srcu_ctl_srcu_array'
> > > > kernel/rcu/rcutorture.o:(.discard+0x0): first defined here
> > > >=20
> > > > Caused by commit
> > > >=20
> > > >   abcd7ec0808e ("rcutorture: Add RCU grace-period performance tests=
")
> > > >=20
> > > > I have reverted that commit for today. =20
> > >=20
> > > Hello, Stephen,
> > >=20
> > > Very strange.  The "static" keyword does not mean anything here?
> > > Easy enough to use different symbols in the two different files,
> > > but this situation is not so good for information hiding.
> > >=20
> > > Happy to update rcuperf.c to use a different name, but in the
> > > immortal words of MSDOS, "Are you sure?" :-)
> >=20
> > I have no idea why it happens, but I do get the error above unless I
> > revert that commit.  So, yes, I am sure :-)
> >=20
> > OK, I looked further and
> >=20
> > DEFINE_STATIC_SRCU(srcu_ctl);
> >=20
> > becomes this (NLs added for clarity):
> >=20
> > static __attribute__((section(".discard"), unused)) char __pcpu_scope_s=
rcu_ctl_srcu_array;
> > extern __attribute__((section(".discard"), unused)) char __pcpu_unique_=
srcu_ctl_srcu_array;
> > __attribute__((section(".discard"), unused)) char __pcpu_unique_srcu_ct=
l_srcu_array;
> > extern __attribute__((section(".data..percpu" ""))) __typeof__(struct s=
rcu_struct_array) srcu_ctl_srcu_array;
> > __attribute__((section(".data..percpu" ""))) __attribute__((weak)) __ty=
peof__(struct srcu_struct_array) srcu_ctl_srcu_array;
> > static struct srcu_struct srcu_ctl =3D {
> > 	.
> > 	.
> > };
> >=20
> > So, the "static" is not very effective :-(
>=20
> Oddly enough, this appears to be toolchain dependent.  No idea why.
>=20

Maybe the reason is because "static" doesn't work well with
DEFINE_PER_CPU sometimes?

The definition of __DEFINE_STATIC_SRCU is:

#define __DEFINE_SRCU(name, is_static)					\
	static DEFINE_PER_CPU(struct srcu_struct_array, name##_srcu_array);\
	is_static struct srcu_struct name =3D __SRCU_STRUCT_INIT(name)

whereas DEFINE_PER_CPU(which calls DEFINE_PER_CPU_SECTION) *could*
consists of *several* definitions:

#if defined(ARCH_NEEDS_WEAK_PER_CPU) || defined(CONFIG_DEBUG_FORCE_WEAK_PER=
_CPU)
=2E..
#define DEFINE_PER_CPU_SECTION(type, name, sec)				\
	__PCPU_DUMMY_ATTRS char __pcpu_scope_##name;			\
	extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;		\
	__PCPU_DUMMY_ATTRS char __pcpu_unique_##name;			\
	extern __PCPU_ATTRS(sec) __typeof__(type) name;			\
	__PCPU_ATTRS(sec) PER_CPU_DEF_ATTRIBUTES __weak			\
	__typeof__(type) name
#else
=2E..
#define DEFINE_PER_CPU_SECTION(type, name, sec)				\
	__PCPU_ATTRS(sec) PER_CPU_DEF_ATTRIBUTES			\
	__typeof__(type) name
#endif

So if ARCH_NEEDS_WEAK_PER_CPU=3Dy or CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy,
the "static" keyword only has effects on the first definition i.e.
__pcpu_scope_##name.

Mind to check your config options, Stephen?


IOW, DEFINE_PER_CPU is not designed to work with "static", maybe we
should add STATIC_DEFINE_PER_CPU for that purpose?

Cc Tejun and Christoph for their opinions.

Regards,
Boqun

> Here is a patch that I will be merging in.
>=20
> 							Thanx, Paul
>=20
> ------------------------------------------------------------------------
>=20
> commit d81f900405de0dc6152692a2088258b8b35d740d
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Thu Jan 7 12:39:10 2016 -0800
>=20
>     Merge with abcd7ec0808e (rcutorture: Add RCU grace-period performance=
 tests)
>    =20
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>=20
> diff --git a/kernel/rcu/rcuperf.c b/kernel/rcu/rcuperf.c
> index eef82a9460d8..4c8d99aa4f5e 100644
> --- a/kernel/rcu/rcuperf.c
> +++ b/kernel/rcu/rcuperf.c
> @@ -188,8 +188,8 @@ static struct rcu_perf_ops rcu_bh_ops =3D {
>   * Definitions for srcu perf testing.
>   */
> =20
> -DEFINE_STATIC_SRCU(srcu_ctl);
> -static struct srcu_struct *srcu_ctlp =3D &srcu_ctl;
> +DEFINE_STATIC_SRCU(srcu_ctl_perf);
> +static struct srcu_struct *srcu_ctlp =3D &srcu_ctl_perf;
> =20
>  static int srcu_perf_read_lock(void) __acquires(srcu_ctlp)
>  {
>=20

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWjxK7AAoJEEl56MO1B/q4SBoIAIAT9l/4bHntLJPdJOOOl/LZ
zkmcpgRa/x84aEvPwfAZC8pKSgbJATRAX9bU/wtJHhvP8RqM92UvHDvBmKNtQDpW
IZS2FvEBYGDgB7VlLDFFdJOfXIaVGPdJC3u2JUOiM1JiTBwHYccgEB0xHaGQhXW1
E1ydS1jxyvdG7I8H4rlYTzYshPa977ux/U5udcR2tR5wPz6aw3kO5azQed6ObRtX
XL/UItymsutG5L2nPgFG0/+tkdDJChLDEI1KBVe4o1lKyETMmuOVrHfmCGyYqaq2
U1pfgMtpJ2luwKQD/89/Nc7qqiu9FfveChuo9B28FazvP72v7sN1fUjmqJ4z3HI=
=Gfrp
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
