From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the signal tree with the cortex tree
Date: Mon, 5 Nov 2012 09:37:26 +0100
Message-ID: <20121105083726.GA22235@pengutronix.de>
References: <20121105150307.05dc233ef299ab73df5dbf89@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:32847 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753256Ab2KEIhf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Nov 2012 03:37:35 -0500
Content-Disposition: inline
In-Reply-To: <20121105150307.05dc233ef299ab73df5dbf89@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>

Hello Stephen,

On Mon, Nov 05, 2012 at 03:03:07PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the signal tree got a conflict in
> arch/arm/kernel/process.c between commit 77a3018e38b9 ("Cortex-M3: Ad=
d
> support for exception handling") from the cortex tree and commit
> 9e6479930021 ("arm: switch to generic fork/vfork/clone") from the sig=
nal
> tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as necessar=
y
> (no action is required).
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc arch/arm/kernel/process.c
> index 585b9ab,4ab80bb..0000000
> --- a/arch/arm/kernel/process.c
> +++ b/arch/arm/kernel/process.c
> @@@ -384,14 -383,11 +384,15 @@@ copy_thread(unsigned long clone_flags=
,=20
>  =20
>   	memset(&thread->cpu_context, 0, sizeof(struct cpu_context_save));
>  =20
> - 	if (likely(regs)) {
> - 		*childregs =3D *regs;
> + 	if (likely(!(p->flags & PF_KTHREAD))) {
> + 		*childregs =3D *current_pt_regs();
>   		childregs->ARM_r0 =3D 0;
> - 		childregs->ARM_sp =3D stack_start;
> + 		if (stack_start)
> + 			childregs->ARM_sp =3D stack_start;
>  +#if defined CONFIG_CPU_V7M
>  +		/* Return to Thread mode with Process stack */
>  +		childregs->ARM_EXC_RET =3D 0xfffffffdUL;
>  +#endif
>   	} else {
>   		memset(childregs, 0, sizeof(struct pt_regs));
>   		thread->cpu_context.r4 =3D stk_sz;
looks good and works for me

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
