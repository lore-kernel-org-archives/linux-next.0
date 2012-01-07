From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Sat, 7 Jan 2012 17:53:43 +1100
Message-ID: <20120107175343.0939b70809a3356955d20e2c@canb.auug.org.au>
References: <20120106120345.8157a839b1c924315d728eea@canb.auug.org.au>
 <20120107044439.GE4790@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4962277167615707172=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120107044439.GE4790@S2101-09.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Hui Wang <jason77.wang@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

--===============4962277167615707172==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Sat__7_Jan_2012_17_53_43_+1100_eavKjKT4eI6ewIc3"

--Signature=_Sat__7_Jan_2012_17_53_43_+1100_eavKjKT4eI6ewIc3
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

On Sat, 7 Jan 2012 12:44:42 +0800 Shawn Guo <shawn.guo@linaro.org> wrote:
>
> On Fri, Jan 06, 2012 at 12:03:45PM +1100, Stephen Rothwell wrote:
> > diff --cc arch/arm/mach-imx/mm-imx5.c
> > index 65139a6,bc17dfe..0000000
> > --- a/arch/arm/mach-imx/mm-imx5.c
> > +++ b/arch/arm/mach-imx/mm-imx5.c
> > @@@ -21,9 -22,27 +22,24 @@@
> >   #include <mach/devices-common.h>
> >   #include <mach/iomux-v3.h>
> >  =20
> > + static struct clk *gpc_dvfs_clk;
> > +=20
> >   static void imx5_idle(void)
> >   {
> >  -	if (!need_resched()) {
> >  -		/* gpc clock is needed for SRPG */
> >  -		if (gpc_dvfs_clk =3D=3D NULL) {
> >  -			gpc_dvfs_clk =3D clk_get(NULL, "gpc_dvfs");
> >  -			if (IS_ERR(gpc_dvfs_clk))
> >  -				goto err0;
> >  -		}
> >  -		clk_enable(gpc_dvfs_clk);
> >  -		mx5_cpu_lp_set(WAIT_UNCLOCKED_POWER_OFF);
> >  -		if (tzic_enable_wake())
> >  -			goto err1;
> >  -		cpu_do_idle();
> >  -err1:
> >  -		clk_disable(gpc_dvfs_clk);
> > ++	/* gpc clock is needed for SRPG */
> > ++	if (gpc_dvfs_clk =3D=3D NULL) {
> > ++		gpc_dvfs_clk =3D clk_get(NULL, "gpc_dvfs");
> > ++		if (IS_ERR(gpc_dvfs_clk))
> > ++			goto err0;
> > + 	}
> > ++	clk_enable(gpc_dvfs_clk);
> >  +	mx5_cpu_lp_set(WAIT_UNCLOCKED_POWER_OFF);
> > ++	if (tzic_enable_wake())
> > ++		goto err1;
> > ++	cpu_do_idle();
> > ++err1:
> > ++	clk_disable(gpc_dvfs_clk);
> > + err0:
> >  -	local_irq_enable();
>=20
> This results in a compile error.
>=20
>   CC      arch/arm/mach-imx/mm-imx5.o
> arch/arm/mach-imx/mm-imx5.c: In function =E2=80=98imx5_idle=E2=80=99:
> arch/arm/mach-imx/mm-imx5.c:42:1: error: label at end of compound stateme=
nt

Ooops.  Sorry about that.  Just remove the label and turn the "goto err0"
into "return".

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__7_Jan_2012_17_53_43_+1100_eavKjKT4eI6ewIc3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPB+v3AAoJEECxmPOUX5FEHa0P/2I2dV3mu0bs/oDqGBUnAKKe
cX7rGL4dr0vJJHPGMbcKFhbNJkXoGtB4Po0g7AMuXXpuhNrkV9pKdsLqFvu+59Zq
A2sTiNzTfMAuWTQ3bnujzEIMtDmIVi67vxuOsCnFbZZ6fejbVr4X8x3bA857Q3ZY
Gq5SLsxu4C0DGM/MCA/1InSyc0WgabAMSo1RU4syqj/VIexstvYmJ4VM2BoNmBHt
hntLQACFoPkpukcE+ouhWH0G2YFzo3Sd3jWKRv+1iguv5oZWHkg2AyYOeJ7QpDVk
IQICrGIvw+Q5lUIYTqDFr/R8rJggfb126eSwKmO5UPYQgll2MPdu5QY6WCEioavn
SqqXlMVBKsZ30CWws4LvjyAn6By4cIbUaybf7sHF5EVzcT/FPmobDo/Isl93Ag6i
KvwzxndmbpOJ4gVz2VL2MA0M5x2vr0xL5S42felgVF+XOUgkJHRs2F1jiZRi56+I
AsftDJG1oorAjfCffhVmIGYlaff4jmSixHeJhEowslgqeQmKKTfQYXq8DfuknyU6
Sg49lmxOvROCY6Gfi6TixwfPkQDibw+76jR4kVoxMF+YwUoNcdnWWbQ2bcKNKr5/
kIB5/c44uW5VJ1+2IkSp90ujuy4OtawF5Ie4ng7P5QXmOD83y4ngk3elvVJJUyOG
Bu8rh2h1wJX3M2i+U6Px
=k7jI
-----END PGP SIGNATURE-----

--Signature=_Sat__7_Jan_2012_17_53_43_+1100_eavKjKT4eI6ewIc3--


--===============4962277167615707172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4962277167615707172==--
