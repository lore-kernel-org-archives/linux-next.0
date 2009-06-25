From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: linux-next: origin tree build failure
Date: Thu, 25 Jun 2009 06:24:08 +0300
Message-ID: <20090625032407.GO6027@tarshish>
References: <20090625111344.35febd82.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758566AbZFYDYz@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090625111344.35febd82.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Ben Dooks <ben-linux@fluff.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Jun 25, 2009 at 11:13:44AM +1000, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> ERROR: "clk_enable" [drivers/i2c/busses/i2c-designware.ko] undefined!
> ERROR: "clk_disable" [drivers/i2c/busses/i2c-designware.ko] undefined=
!
> ERROR: "clk_put" [drivers/i2c/busses/i2c-designware.ko] undefined!
> ERROR: "clk_get_rate" [drivers/i2c/busses/i2c-designware.ko] undefine=
d!
> ERROR: "clk_get" [drivers/i2c/busses/i2c-designware.ko] undefined!
>=20
> Caused by commit 1ab52cf910bbbee92861227e6ed77c56b1dc233c ("i2c: driv=
er
> for the Synopsys DesignWare I2C controller") from Linus' tree which I
> have reverted for today.

So, what is the right configuration symbol to depend on for the clk API=
?

A short archives search led to the "provide a dummy implementation of t=
he clk=20
API" patch from Uwe Kleine-K=C3nig=20
(http://lkml.indiana.edu/hypermail/linux/kernel/0804.2/2748.html). Is t=
his the=20
right solution?

baruch

--=20
                                                     ~. .~   Tk Open Sy=
stems
=3D}------------------------------------------------ooO--U--Ooo--------=
----{=3D
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
