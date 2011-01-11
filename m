From: matthieu castet <castet.matthieu@free.fr>
Subject: Re: [PATCH 3/3 V13] RO/NX protection for loadable kernel
Date: Tue, 11 Jan 2011 23:42:47 +0100
Message-ID: <4D2CDCE7.6030002@free.fr>
References: <4CE2F914.9070106@free.fr> <24422.1290656467@localhost> <20101126182355.62615dff@mat-laptop> <20101208221951.GO5750@outflux.net> <20101211001857.4c5e0794@mat-laptop> <20101222124019.GG10809@elte.hu> <34428.1293053719@localhost> <AANLkTin55DXcQnK3NY7y-v8TXj5w-XT2rTJo9p90tj4g@mail.gmail.com> <20110107130426.GA24259@elte.hu> <20110108122455.38d31524@mat-laptop> <20110110234959.GE4979@outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20110110234959.GE4979@outflux.net>
Sender: linux-security-module-owner@vger.kernel.org
To: Kees Cook <kees.cook@canonical.com>
Cc: Ingo Molnar <mingo@elte.hu>, Xiaotian Feng <xtfeng@gmail.com>, Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

Kees Cook a =E9crit :
> Hi,
>=20
> I was just shown this[1] on Xen from an Ubuntu bug report[2].
>=20
> [    1.230382] NX-protecting the kernel data: 3884k
> [    1.231002] BUG: unable to handle kernel paging request at c1782ae=
0
> ...
> [    1.231145] Call Trace:
> [    1.231152]  [<c0138481>] ? __change_page_attr+0x2c1/0x370
> [    1.231161]  [<c02163a1>] ? __purge_vmap_area_lazy+0xc1/0x180
> [    1.231169]  [<c013857c>] ? __change_page_attr_set_clr+0x4c/0xb0
> [    1.231176]  [<c0138838>] ? change_page_attr_set_clr+0x128/0x300
> [    1.231183]  [<c010798e>] ? __raw_callee_save_xen_restore_fl+0x6/0=
x8
> [    1.231192]  [<c0159ca1>] ? vprintk+0x171/0x3f0
> [    1.231198]  [<c0138bdf>] ? set_memory_nx+0x5f/0x70
>=20
>=20
> Does Xen have different size page table allocations or something weir=
d?
>=20
Note that this one isn't related to this one but to "Add NX protection =
for kernel data".

But have no idea how xen page table work.

Matthieu
--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
