From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH linux-next] ARM: mvebu: Fix pmsu compilation when ARMv6
 is selected
Date: Thu, 8 May 2014 13:05:09 -0400
Message-ID: <20140508170509.GJ12708@titan.lakedaemon.net>
References: <1399407782-29091-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1399407782-29091-1-git-send-email-vincent.stehle@laposte.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Tue, May 06, 2014 at 10:23:02PM +0200, Vincent Stehl=E9 wrote:
> When compiling for multiplatform for both ARMv6 and ARMv7, the defaul=
t compiler
> flags are for ARMv6, and we will get:
>=20
>   /tmp/ccwDEzd0.s: Assembler messages:
>   /tmp/ccwDEzd0.s:639: Error: selected processor does not support ARM=
 mode `isb '
>   /tmp/ccwDEzd0.s:645: Error: selected processor does not support ARM=
 mode `isb '
>   /tmp/ccwDEzd0.s:646: Error: selected processor does not support ARM=
 mode `dsb '
>   /tmp/ccwDEzd0.s:695: Error: selected processor does not support ARM=
 mode `isb '
>   make[1]: *** [arch/arm/mach-mvebu/pmsu.o] Error 1
>=20
> Fix this in a similar manner than done previously in commit
> 72533b77d30c2be02672e26b5dde1263d7b4c2be, by specifying ARMv7 flags f=
or pmsu.o.
>=20
> Signed-off-by: Vincent Stehl=E9 <vincent.stehle@laposte.net>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@free-electrons.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> ---
>=20
> Hi,
>=20
> This build issue can be seen with e.g. Linux next-20140506, ARCH=3Dar=
m and
> allmodconfig.
>=20
> Best regards,
>=20
> V.
>=20
>  arch/arm/mach-mvebu/Makefile | 1 +
>  1 file changed, 1 insertion(+)

Applied to mvebu/soc, thanks!

thx,

Jason.
