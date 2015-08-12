From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 12 Aug 2015 09:27:38 -0400
Message-ID: <55CB49CA.8050305@oracle.com>
References: <20150812150954.36bc605c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:37652 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751967AbbHLN3Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 09:29:24 -0400
In-Reply-To: <20150812150954.36bc605c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, David Vrabel <david.vrabel@citrix.com>

On 08/12/2015 01:09 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the xen-tip tree got a conflict in:
>
>    arch/x86/xen/enlighten.c
>
> between commit:
>
>    9261e050b686 ("x86/asm/tsc, x86/paravirt: Remove read_tsc() and re=
ad_tscp() paravirt hooks")
>
> from the tip tree and commit:
>
>    cd6f350a5460 ("xen/PMU: Initialization code for Xen PMU")
>
> from the xen-tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).

Thanks, this looks good.

Incidentally, 11276d53 ("locking/static_keys: Add a new static_key=20
interface") breaks old-ish compilers (gcc version 4.4.4 20100503 (Red=20
Hat 4.4.4-2) (GCC)):



   CC      arch/x86/kernel/nmi.o
In file included from=20
/home/build/linux-boris/include/linux/jump_label.h:109,
                  from=20
/home/build/linux-boris/arch/x86/include/asm/spinlock.h:5,
                  from /home/build/linux-boris/include/linux/spinlock.h=
:88,
                  from /home/build/linux-boris/arch/x86/kernel/nmi.c:14=
:
/home/build/linux-boris/arch/x86/include/asm/jump_label.h: In function=20
=91nmi_handle=92:
/home/build/linux-boris/arch/x86/include/asm/jump_label.h:21: warning:=20
asm operand 0 probably doesn=92t match constraints
/home/build/linux-boris/arch/x86/include/asm/jump_label.h:21: error:=20
impossible constraint in =91asm=92
make[3]: *** [arch/x86/kernel/nmi.o] Error 1
make[2]: *** [arch/x86/kernel] Error 2
make[1]: *** [arch/x86] Error 2


-boris

>
> -- Cheers, Stephen Rothwell sfr@canb.auug.org.au diff --cc=20
> arch/x86/xen/enlighten.c index d9cfa452da9d,a1c2e46206a9..00000000000=
0=20
> --- a/arch/x86/xen/enlighten.c +++ b/arch/x86/xen/enlighten.c @@@=20
> -1215,8 -1179,11 +1219,8 @@@ static const struct pv_cpu_ops xen_cpu_=20
> .read_msr =3D xen_read_msr_safe, .write_msr =3D xen_write_msr_safe, -=
=20
> .read_pmc =3D native_read_pmc, - .read_tsc =3D native_read_tsc, +=20
> .read_pmc =3D xen_read_pmc, - .read_tscp =3D native_read_tscp, - .ire=
t =3D=20
> xen_iret, #ifdef CONFIG_X86_64 .usergs_sysret32 =3D xen_sysret32,
