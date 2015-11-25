From: Andi Kleen <ak@linux.intel.com>
Subject: Re: LTO build errors (Re: linux-next: clean up the kbuild tree?)
Date: Tue, 24 Nov 2015 20:33:44 -0800
Message-ID: <20151125043344.GG8438@tassilo.jf.intel.com>
References: <20151115112705.0bf4f0ed@canb.auug.org.au>
 <20151115175848.GD10150@tassilo.jf.intel.com>
 <5649D3B9.7020701@suse.cz>
 <20151121010033.GB8438@tassilo.jf.intel.com>
 <s5h4mgfzkno.wl-tiwai@suse.de>
 <20151124021231.GE8438@tassilo.jf.intel.com>
 <s5hy4dnicgv.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:63716 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754299AbbKYEdp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Nov 2015 23:33:45 -0500
Content-Disposition: inline
In-Reply-To: <s5hy4dnicgv.wl-tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Michal Marek <mmarek@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


Hi Takashi,

On Tue, Nov 24, 2015 at 05:33:36PM +0100, Takashi Iwai wrote:
>   LD      vmlinux
> arch/x86/kernel/cpu/perf_event_intel_rapl.c:66:20: error: rapl_domain=
_names causes a section type conflict with __setup_str_set_reset_device=
s
>  static const char *rapl_domain_names[NR_RAPL_DOMAINS] __initconst =3D=
 {
>                     ^
> init/main.c:159:19: note: =E2=80=98__setup_str_set_reset_devices=E2=80=
=99 was declared here
>  __setup("reset_devices", set_reset_devices);
>=20
> Hmm...  I see no direct relation, but OK, let's try to get rid of
> __initconst.  Now it hits lots of other errors like:

I hit the same issue, will send a patch. The other symbol is typically =
some
random correct symbol because gcc detects the conflict on a pair of sym=
bols.

The problem is that placing const correctly is too difficult, the corre=
ct line
would be=20

static const char *const rapl_domain_names[NR_RAPL_DOMAINS] __initconst=
 =3D {

>=20
> `__sw_hweight32' referenced in section `.text' of /tmp/ccUCMU7n.ltran=
s13.ltrans.o: defined in discarded section `.text' of lib/built-in.o (s=
ymbol from plugin)
> `__sw_hweight32' referenced in section `.text' of /tmp/ccUCMU7n.ltran=
s13.ltrans.o: defined in discarded section `.text' of lib/built-in.o (s=
ymbol from plugin)
> `__sw_hweight32' referenced in section `.text' of /tmp/ccUCMU7n.ltran=
s13.ltrans.o: defined in discarded section `.text' of lib/built-in.o (s=
ymbol from plugin)
> `__sw_hweight32' referenced in section `.text' of /tmp/ccUCMU7n.ltran=
s13.ltrans.o: defined in discarded section `.text' of lib/built-in.o (s=
ymbol from plugin)

This needs

https://git.kernel.org/cgit/linux/kernel/git/ak/linux-misc.git/commit/?=
h=3Dlto-4.0&id=3Dd826425f7a9d935d521989bd0a871b76fb4c59e2


> /tmp/ccUCMU7n.ltrans21.ltrans.o: In function `do_exit':
> <artificial>:(.text+0xfc0): undefined reference to `sys_futex'
> /tmp/ccUCMU7n.ltrans22.ltrans.o: In function `_do_fork':
> <artificial>:(.text+0x39f7): undefined reference to `ret_from_fork'
> <artificial>:(.text+0x4428): undefined reference to `ret_from_kernel_=
thread'


That's new, but can be fixed by adding __visible or asmlinkage to these=
 symbols
I guess it's from the recent entry* restructuring.

I'll do an updated tree later.

Everything that's called from assembler in C needs to be marked like th=
is. It's
fairly mechanic.

-andi
