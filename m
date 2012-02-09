From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the irqdomain tree with the arm tree
Date: Wed, 8 Feb 2012 22:29:10 -0800
Message-ID: <CACxGe6sskg2t0QtOgWCKvYFdqWbsM4Cbdt05ZaNCLzrdNd6iLQ@mail.gmail.com>
References: <20120209151413.0dfec71771dd156843c0f4fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120209151413.0dfec71771dd156843c0f4fa@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Will Deacon <will.deacon@arm.com>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 8, 2012 at 8:14 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Grant,
>
> Today's linux-next merge of the irqdomain tree got a conflict in
> arch/arm/common/gic.c between commit c11907f588d6 ("ARM: 7318/1: gic:
> refactor irq_start assignment") from the arm tree and commit 7da5a66b=
bf1f
> ("irq_domain: Remove 'new' irq_domain in favour of the ppc one") from=
 the
> irqdomain tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Thanks Stephen.

The context fixup looks correct to me.  I'll test the current
linux-next tree when I get a chance (I'm at a conference at the
moment).


g.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc arch/arm/common/gic.c
> index ca6b5dd,8cf934c..0000000
> --- a/arch/arm/common/gic.c
> +++ b/arch/arm/common/gic.c
> @@@ -348,12 -344,15 +345,11 @@@ void __init gic_cascade_irq(unsigned =
in
>
> =A0static void __init gic_dist_init(struct gic_chip_data *gic)
> =A0{
> - =A0 =A0 =A0 unsigned int i, irq;
> + =A0 =A0 =A0 unsigned int i;
> =A0 =A0 =A0 =A0u32 cpumask;
> =A0 =A0 =A0 =A0unsigned int gic_irqs =3D gic->gic_irqs;
> - =A0 =A0 =A0 struct irq_domain *domain =3D &gic->domain;
> =A0 =A0 =A0 =A0void __iomem *base =3D gic_data_dist_base(gic);
> =A0- =A0 =A0 =A0u32 cpu =3D 0;
> =A0-
> =A0-#ifdef CONFIG_SMP
> =A0- =A0 =A0 =A0cpu =3D cpu_logical_map(smp_processor_id());
> =A0-#endif
> =A0+ =A0 =A0 =A0u32 cpu =3D cpu_logical_map(smp_processor_id());
>
> =A0 =A0 =A0 =A0cpumask =3D 1 << cpu;
> =A0 =A0 =A0 =A0cpumask |=3D cpumask << 8;
> @@@ -694,12 -689,13 +686,12 @@@ void __init gic_init_bases(unsigned i=
n
> =A0 =A0 =A0 =A0 * For primary GICs, skip over SGIs.
> =A0 =A0 =A0 =A0 * For secondary GICs, skip over PPIs, too.
> =A0 =A0 =A0 =A0 */
> =A0- =A0 =A0 =A0hwirq_base =3D 32;
> =A0- =A0 =A0 =A0if (gic_nr =3D=3D 0) {
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((irq_start & 31) > 0) {
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hwirq_base =3D 16;
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (irq_start !=3D -1=
)
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_s=
tart =3D (irq_start & ~31) + 16;
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0+ =A0 =A0 =A0if (gic_nr =3D=3D 0 && (irq_start & 31) > 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 domain->hwirq_base =3D 16;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0hwirq_base =3D 16;
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (irq_start !=3D -1)
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_start =3D (irq_st=
art & ~31) + 16;
> =A0+ =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 domain->hwirq_base =3D 32;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0hwirq_base =3D 32;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/*



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
