From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: linux-next: manual merge of the voltage tree with Linus' tree
Date: Tue, 15 Dec 2009 12:14:02 +0000
Message-ID: <1260879242.3591.335.camel@odin>
References: <20091215133808.cd3d4b8b.sfr@canb.auug.org.au>
	 <1260870485.3591.25.camel@odin>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:62466 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760041AbZLOMOJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2009 07:14:09 -0500
In-Reply-To: <1260870485.3591.25.camel@odin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@nokia.com>, "Keski-Saari Juha.1 (EXT-Teleca/Helsinki)" <ext-juha.1.keski-saari@nokia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eduardo Valentin <eduardo.valentin@nokia.com>, Rajendra Nayak <rnayak@ti.com>, Samuel Ortiz <sameo@linux.intel.com>, Balaji T K <balajitk@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, 2009-12-15 at 09:48 +0000, Liam Girdwood wrote:
> Hi Stephen,
>=20
> On Tue, 2009-12-15 at 13:38 +1100, Stephen Rothwell wrote:
> > Hi Liam,
> >=20
> > Today's linux-next merge of the voltage tree got a conflict in
> > drivers/regulator/twl-regulator.c between commit
> > 441a450554dada1c59fc06fdf068cb0eeba53c6d ("regulator: Add support f=
or
> > twl6030 regulators") from Linus' tree and commits
> > 6360cf42ae51be5f6e6e72d6e81f202d9db0f7e9 ("twl4030-regulator: Remov=
e
> > regulator from all groups when disabling") and
> > 3277b9fce0fcaa68d5947429e062163852ebc6fb ("twl4030-regulator: Add a=
ll TWL
> > regulators to twreg_info") from the voltage tree.
> >=20
> > I cannot begin to fix this mess up.  I do wonder why the regulator =
patch
> > above was never in linux-next before being sent upstream yesterday
> > (Samuel?).  All I can do is use the version of the voltage tree fro=
m
> > next-20091120 (commit id b0a7a2ad0aebb35934de6d2509c73fe93a362c0e) =
for
> > today and hope that Liam can do the merge with Linus' tree.
> >=20
>=20
> Sorry about this. There were some large patch sets that did span both
> mfd and regulator recently.
>=20
> I'll fix and do my pull request today.

Peter, Juha,

I've fixed up regulator for-next against upstream and now get a build
failure on twl-regulator.c (possibly related to mfd/twl-codec.c build
failure today ?)

  CC      drivers/regulator/twl-regulator.o
drivers/regulator/twl-regulator.c: In function =E2=80=98twlreg_disable=E2=
=80=99:
drivers/regulator/twl-regulator.c:158: error: =E2=80=98P1_GRP=E2=80=99 =
undeclared (first use in this function)
drivers/regulator/twl-regulator.c:158: error: (Each undeclared identifi=
er is reported only once
drivers/regulator/twl-regulator.c:158: error: for each function it appe=
ars in.)
drivers/regulator/twl-regulator.c:158: error: =E2=80=98P2_GRP=E2=80=99 =
undeclared (first use in this function)
drivers/regulator/twl-regulator.c:158: error: =E2=80=98P3_GRP=E2=80=99 =
undeclared (first use in this function)
drivers/regulator/twl-regulator.c: At top level:
drivers/regulator/twl-regulator.c:358: error: =E2=80=98twlldo_list_volt=
age=E2=80=99 undeclared here (not in a function)
drivers/regulator/twl-regulator.c:450:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:450: error: =E2=80=98TWL_ADJUSTABLE_L=
DO=E2=80=99 undeclared here (not in a function)
drivers/regulator/twl-regulator.c:451:40: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:452:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:453:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:454:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:455:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:456:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:457:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:458:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:459:34: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:460:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:461:40: error: macro "TWL_FIXED_LDO" =
requires 5 arguments, but only 4 given
drivers/regulator/twl-regulator.c:461: error: =E2=80=98TWL_FIXED_LDO=E2=
=80=99 undeclared here (not in a function)
drivers/regulator/twl-regulator.c:462:39: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:463:39: error: macro "TWL_FIXED_LDO" =
requires 5 arguments, but only 4 given
drivers/regulator/twl-regulator.c:464:34: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:465:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:466:35: error: macro "TWL_ADJUSTABLE_=
LDO" requires 4 arguments, but only 3 given
drivers/regulator/twl-regulator.c:467:39: error: macro "TWL_FIXED_LDO" =
requires 5 arguments, but only 4 given
drivers/regulator/twl-regulator.c:468:39: error: macro "TWL_FIXED_LDO" =
requires 5 arguments, but only 4 given
drivers/regulator/twl-regulator.c:469:39: error: macro "TWL_FIXED_LDO" =
requires 5 arguments, but only 4 given
drivers/regulator/twl-regulator.c:474: error: =E2=80=98VAUX1_6030_VSEL_=
table=E2=80=99 undeclared here (not in a function)
drivers/regulator/twl-regulator.c:474: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:474: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:474: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:474: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:474: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:474: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:475: error: =E2=80=98VAUX2_6030_VSEL_=
table=E2=80=99 undeclared here (not in a function)
drivers/regulator/twl-regulator.c:475: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:475: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:475: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:475: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:475: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:475: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:476: error: =E2=80=98VAUX3_6030_VSEL_=
table=E2=80=99 undeclared here (not in a function)
drivers/regulator/twl-regulator.c:476: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:476: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:476: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:476: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:476: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:476: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:477: error: =E2=80=98VMMC_VSEL_table=E2=
=80=99 undeclared here (not in a function)
drivers/regulator/twl-regulator.c:477: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:477: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:477: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:477: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:477: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:477: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:478: error: =E2=80=98VPP_VSEL_table=E2=
=80=99 undeclared here (not in a function)
drivers/regulator/twl-regulator.c:478: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:478: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:478: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:478: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:478: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:478: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:479: error: =E2=80=98VUSIM_VSEL_table=
=E2=80=99 undeclared here (not in a function)
drivers/regulator/twl-regulator.c:479: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:479: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:479: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c:479: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:479: warning: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98type name=E2=80=99
drivers/regulator/twl-regulator.c:479: error: negative width in bit-fie=
ld =E2=80=98<anonymous>=E2=80=99
drivers/regulator/twl-regulator.c: In function =E2=80=98twlreg_probe=E2=
=80=99:
drivers/regulator/twl-regulator.c:544: error: implicit declaration of f=
unction =E2=80=98twl4030reg_write=E2=80=99
make[2]: *** [drivers/regulator/twl-regulator.o] Error 1
make[1]: *** [drivers/regulator] Error 2
make: *** [drivers] Error 2

Can you check this and send me patch before I issue a pull request.
=46wiw, the regulator pull request is now blocking on this issue.

Thanks.

Liam
