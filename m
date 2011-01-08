From: matthieu castet <castet.matthieu@free.fr>
Subject: Re: [PATCH 3/3 V13] RO/NX protection for loadable kernel
Date: Sat, 8 Jan 2011 12:24:55 +0100
Message-ID: <20110108122455.38d31524@mat-laptop>
References: <4CE2F914.9070106@free.fr>
	<24422.1290656467@localhost>
	<20101126182355.62615dff@mat-laptop>
	<20101208221951.GO5750@outflux.net>
	<20101211001857.4c5e0794@mat-laptop>
	<20101222124019.GG10809@elte.hu>
	<34428.1293053719@localhost>
	<AANLkTin55DXcQnK3NY7y-v8TXj5w-XT2rTJo9p90tj4g@mail.gmail.com>
	<20110107130426.GA24259@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp6-g21.free.fr ([212.27.42.6]:50368 "EHLO smtp6-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751613Ab1AHLZN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 8 Jan 2011 06:25:13 -0500
In-Reply-To: <20110107130426.GA24259@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Xiaotian Feng <xtfeng@gmail.com>, Valdis.Kletnieks@vt.edu, Kees Cook <kees.cook@canonical.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>

Le Fri, 7 Jan 2011 14:04:26 +0100,
Ingo Molnar <mingo@elte.hu> a =E9crit :

>=20
> * Xiaotian Feng <xtfeng@gmail.com> wrote:
>=20
> >=20
> > I'm facing a boot failure (panic'ed on
> > remove_jump_label_module_init) on 2.6.37 (latest commit 3c0cb7c),
> > which is 100% reproducible. With this patch applied, I can boot my
> > machine successfully, so I do think this patch is needed.
>=20
> That would be commit:
>=20
>  94462ad3b147: module: Move RO/NX module protection to after ftrace
> module update
>=20
> So if commit 3c0cb7c is still broken, it has 94462ad3b147 included
> already, and there's some other bug. Kees, Steve, any ideas?
>=20
The problem comes from remove_jump_label_module_init that does :
if (within_module_init(iter->code, mod))
                        iter->key =3D 0;

This mean if there are jump label in the module init, we will
invalidate them by writing the the jump label section.

But this section is read only.

The solution is either to make the section read write, either we avoid
this write.

=46or avoid the write a solution could be to do something like
trim_init_extable :
/*
 * If the exception table is sorted, any referring to the module init
 * will be at the beginning or the end.
 */


Matthieu
