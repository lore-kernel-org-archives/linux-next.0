From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Tue, 13 Mar 2012 19:36:41 +1100
Message-ID: <20120313193641.674b271a134d9dba201cd644@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5161656521333714273=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

--===============5161656521333714273==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__13_Mar_2012_19_36_41_+1100_5IZqmzpSJLwxeikC"

--Signature=_Tue__13_Mar_2012_19_36_41_+1100_5IZqmzpSJLwxeikC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/mach-ux500/timer.c between commit 8eed6eac103b ("ARM: ux500:
convert to twd_local_timer_register() interface") from the arm tree and
commit b9576623c421 ("ARM: plat-nomadik: get rid of global mtu base
pointer") from the arm-soc tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-ux500/timer.c
index cadf982,fd00024..0000000
--- a/arch/arm/mach-ux500/timer.c
+++ b/arch/arm/mach-ux500/timer.c
@@@ -15,38 -15,22 +15,39 @@@
  #include <mach/setup.h>
  #include <mach/hardware.h>
 =20
 +#ifdef CONFIG_HAVE_ARM_TWD
 +static DEFINE_TWD_LOCAL_TIMER(u5500_twd_local_timer,
 +			      U5500_TWD_BASE, IRQ_LOCALTIMER);
 +static DEFINE_TWD_LOCAL_TIMER(u8500_twd_local_timer,
 +			      U8500_TWD_BASE, IRQ_LOCALTIMER);
 +
 +static void __init ux500_twd_init(void)
 +{
 +	struct twd_local_timer *twd_local_timer;
 +	int err;
 +
 +	twd_local_timer =3D cpu_is_u5500() ? &u5500_twd_local_timer :
 +					   &u8500_twd_local_timer;
 +
 +	err =3D twd_local_timer_register(twd_local_timer);
 +	if (err)
 +		pr_err("twd_local_timer_register failed %d\n", err);
 +}
 +#else
 +#define ux500_twd_init()	do { } while(0)
 +#endif
 +
  static void __init ux500_timer_init(void)
  {
+ 	void __iomem *mtu_timer_base;
  	void __iomem *prcmu_timer_base;
 +	int err;
 =20
  	if (cpu_is_u5500()) {
- 		mtu_base =3D __io_address(U5500_MTU0_BASE);
 -#ifdef CONFIG_LOCAL_TIMERS
 -		twd_base =3D __io_address(U5500_TWD_BASE);
 -#endif
+ 		mtu_timer_base =3D __io_address(U5500_MTU0_BASE);
  		prcmu_timer_base =3D __io_address(U5500_PRCMU_TIMER_3_BASE);
  	} else if (cpu_is_u8500()) {
- 		mtu_base =3D __io_address(U8500_MTU0_BASE);
 -#ifdef CONFIG_LOCAL_TIMERS
 -		twd_base =3D __io_address(U8500_TWD_BASE);
 -#endif
+ 		mtu_timer_base =3D __io_address(U8500_MTU0_BASE);
  		prcmu_timer_base =3D __io_address(U8500_PRCMU_TIMER_4_BASE);
  	} else {
  		ux500_unknown_soc();
@@@ -69,9 -53,8 +70,9 @@@
  	 *
  	 */
 =20
- 	nmdk_timer_init();
+ 	nmdk_timer_init(mtu_timer_base);
  	clksrc_dbx500_prcmu_init(prcmu_timer_base);
 +	ux500_twd_init();
  }
 =20
  static void ux500_timer_reset(void)

--Signature=_Tue__13_Mar_2012_19_36_41_+1100_5IZqmzpSJLwxeikC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPXwcZAAoJEECxmPOUX5FE32IP/2s2aHDYZFxebomAbzFeJc6n
T4zUkBchjQ11xoUHKedkpQ+EAVDXisLKOrxLiLuQjvCrwz1OEGYNu9XhAmp0OlT9
w0iF6VkgK6bxKR0TOXrNluqLEnPeudCflkDQveFM6EkNPFAhIOn0gxf+oMDsHGP+
BtEh9aOEKRNK29RdnMhJiodtxTQ3vmHTMtxdsiyzMDZBbGvPedzI/aiisQ95BijA
bkvtJlvyQxph5TLGsUdnF71TfVGP+E3IxlsjxgVq4qyVUe42NWYJkcFXkYhC7LkN
fBhaYwz/szyLk73SJfy+1WPmTpoooX5ajQm279wV4QV+k5zD8Qjfhh2O9rPmXj5j
7wT2mHEMmpROopk/1I+Z2ojR8r/FIi5oiW6yB2PoOQmUF6aQib8w084c0RF0B0ox
7LAapIZWd8OO3H4igggaJtHKWr5994JSfZ2wSg2N5I/9R7xkAg8OmKBvHpgwotKJ
3NOCqtPox1GvlZ9mkQfT3BGnt+Y6KsmRkxIF9wV2WNEYUGRb4B292kBbmO5QXJIt
Lj+r5+KyxVejLb+o2m+h2YFLamdD2aEm9Fa9cY7UrNZcH43Lt8iweTAPoqpnlA1x
MPMRA2QkGj1KKc8sCiA9TZ6OmgLEQEny7ZF6TpDnRZlEHCowNue7x6vGSJ0hAaJI
uqgURUmoUEob0Q4oQDv/
=OoFQ
-----END PGP SIGNATURE-----

--Signature=_Tue__13_Mar_2012_19_36_41_+1100_5IZqmzpSJLwxeikC--


--===============5161656521333714273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5161656521333714273==--
