From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Date: Mon, 8 Oct 2018 13:41:55 +0300
Message-ID: <20181008104155.GA15943@smile.fi.intel.com>
References: <20181008134020.790092fe@canb.auug.org.au>
 <2496155.cNn8ibJ9FC@aspire.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2496155.cNn8ibJ9FC@aspire.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 08, 2018 at 12:05:02PM +0200, Rafael J. Wysocki wrote:
> On Monday, October 8, 2018 4:40:20 AM CEST Stephen Rothwell wrote:
> > 
> > --Sig_/8A/3tsSoWQOAryCmuI_nxw6
> > Content-Type: text/plain; charset=US-ASCII
> > Content-Transfer-Encoding: quoted-printable
> > 
> > Hi all,
> > 
> > Today's linux-next merge of the tip tree got a conflict in:
> > 
> >   drivers/idle/intel_idle.c
> > 
> > between commit:
> > 
> >   a4a008e53c9e ("intel_idle: Get rid of custom ICPU() macro")
> > 
> > from the pm tree and commit:
> > 
> >   f2c4db1bd807 ("x86/cpu: Sanitize FAM6_ATOM naming")
> > 
> > from the tip tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > --=20
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc drivers/idle/intel_idle.c
> > index 791b8a366e6e,c4bb67ed8da3..000000000000
> > --- a/drivers/idle/intel_idle.c
> > +++ b/drivers/idle/intel_idle.c
> > @@@ -1066,43 -1066,46 +1066,43 @@@ static const struct idle_cpu idle_cpu_d
> >   	.disable_promotion_to_c1e =3D true,
> >   };
> >  =20
> >  -#define ICPU(model, cpu) \
> >  -	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&cpu }
> >  -
> >   static const struct x86_cpu_id intel_idle_ids[] __initconst =3D {
> >  -	ICPU(INTEL_FAM6_NEHALEM_EP,		idle_cpu_nehalem),
> >  -	ICPU(INTEL_FAM6_NEHALEM,		idle_cpu_nehalem),
> >  -	ICPU(INTEL_FAM6_NEHALEM_G,		idle_cpu_nehalem),
> >  -	ICPU(INTEL_FAM6_WESTMERE,		idle_cpu_nehalem),
> >  -	ICPU(INTEL_FAM6_WESTMERE_EP,		idle_cpu_nehalem),
> >  -	ICPU(INTEL_FAM6_NEHALEM_EX,		idle_cpu_nehalem),
> >  -	ICPU(INTEL_FAM6_ATOM_BONNELL,		idle_cpu_atom),
> >  -	ICPU(INTEL_FAM6_ATOM_BONNELL_MID,		idle_cpu_lincroft),
> >  -	ICPU(INTEL_FAM6_WESTMERE_EX,		idle_cpu_nehalem),
> >  -	ICPU(INTEL_FAM6_SANDYBRIDGE,		idle_cpu_snb),
> >  -	ICPU(INTEL_FAM6_SANDYBRIDGE_X,		idle_cpu_snb),
> >  -	ICPU(INTEL_FAM6_ATOM_SALTWELL,		idle_cpu_atom),
> >  -	ICPU(INTEL_FAM6_ATOM_SILVERMONT,	idle_cpu_byt),
> >  -	ICPU(INTEL_FAM6_ATOM_SILVERMONT_MID,	idle_cpu_tangier),
> >  -	ICPU(INTEL_FAM6_ATOM_AIRMONT,		idle_cpu_cht),
> >  -	ICPU(INTEL_FAM6_IVYBRIDGE,		idle_cpu_ivb),
> >  -	ICPU(INTEL_FAM6_IVYBRIDGE_X,		idle_cpu_ivt),
> >  -	ICPU(INTEL_FAM6_HASWELL_CORE,		idle_cpu_hsw),
> >  -	ICPU(INTEL_FAM6_HASWELL_X,		idle_cpu_hsw),
> >  -	ICPU(INTEL_FAM6_HASWELL_ULT,		idle_cpu_hsw),
> >  -	ICPU(INTEL_FAM6_HASWELL_GT3E,		idle_cpu_hsw),
> >  -	ICPU(INTEL_FAM6_ATOM_SILVERMONT_X,	idle_cpu_avn),
> >  -	ICPU(INTEL_FAM6_BROADWELL_CORE,		idle_cpu_bdw),
> >  -	ICPU(INTEL_FAM6_BROADWELL_GT3E,		idle_cpu_bdw),
> >  -	ICPU(INTEL_FAM6_BROADWELL_X,		idle_cpu_bdw),
> >  -	ICPU(INTEL_FAM6_BROADWELL_XEON_D,	idle_cpu_bdw),
> >  -	ICPU(INTEL_FAM6_SKYLAKE_MOBILE,		idle_cpu_skl),
> >  -	ICPU(INTEL_FAM6_SKYLAKE_DESKTOP,	idle_cpu_skl),
> >  -	ICPU(INTEL_FAM6_KABYLAKE_MOBILE,	idle_cpu_skl),
> >  -	ICPU(INTEL_FAM6_KABYLAKE_DESKTOP,	idle_cpu_skl),
> >  -	ICPU(INTEL_FAM6_SKYLAKE_X,		idle_cpu_skx),
> >  -	ICPU(INTEL_FAM6_XEON_PHI_KNL,		idle_cpu_knl),
> >  -	ICPU(INTEL_FAM6_XEON_PHI_KNM,		idle_cpu_knl),
> >  -	ICPU(INTEL_FAM6_ATOM_GOLDMONT,		idle_cpu_bxt),
> >  -	ICPU(INTEL_FAM6_ATOM_GOLDMONT_PLUS,	idle_cpu_bxt),
> >  -	ICPU(INTEL_FAM6_ATOM_GOLDMONT_X,	idle_cpu_dnv),
> >  +	INTEL_CPU_FAM6(NEHALEM_EP,		idle_cpu_nehalem),
> >  +	INTEL_CPU_FAM6(NEHALEM,			idle_cpu_nehalem),
> >  +	INTEL_CPU_FAM6(NEHALEM_G,		idle_cpu_nehalem),
> >  +	INTEL_CPU_FAM6(WESTMERE,		idle_cpu_nehalem),
> >  +	INTEL_CPU_FAM6(WESTMERE_EP,		idle_cpu_nehalem),
> >  +	INTEL_CPU_FAM6(NEHALEM_EX,		idle_cpu_nehalem),
> > - 	INTEL_CPU_FAM6(ATOM_PINEVIEW,		idle_cpu_atom),
> > - 	INTEL_CPU_FAM6(ATOM_LINCROFT,		idle_cpu_lincroft),
> > ++	INTEL_CPU_FAM6(ATOM_BONNELL,		idle_cpu_atom),
> > ++	INTEL_CPU_FAM6(ATOM_BONNELL_MID,	idle_cpu_lincroft),
> >  +	INTEL_CPU_FAM6(WESTMERE_EX,		idle_cpu_nehalem),
> >  +	INTEL_CPU_FAM6(SANDYBRIDGE,		idle_cpu_snb),
> >  +	INTEL_CPU_FAM6(SANDYBRIDGE_X,		idle_cpu_snb),
> > - 	INTEL_CPU_FAM6(ATOM_CEDARVIEW,		idle_cpu_atom),
> > - 	INTEL_CPU_FAM6(ATOM_SILVERMONT1,	idle_cpu_byt),
> > - 	INTEL_CPU_FAM6(ATOM_MERRIFIELD,		idle_cpu_tangier),
> > ++	INTEL_CPU_FAM6(ATOM_SALTWELL,		idle_cpu_atom),
> > ++	INTEL_CPU_FAM6(ATOM_SILVERMONT,		idle_cpu_byt),
> > ++	INTEL_CPU_FAM6(ATOM_SILVERMONT_MID,	idle_cpu_tangier),
> >  +	INTEL_CPU_FAM6(ATOM_AIRMONT,		idle_cpu_cht),
> >  +	INTEL_CPU_FAM6(IVYBRIDGE,		idle_cpu_ivb),
> >  +	INTEL_CPU_FAM6(IVYBRIDGE_X,		idle_cpu_ivt),
> >  +	INTEL_CPU_FAM6(HASWELL_CORE,		idle_cpu_hsw),
> >  +	INTEL_CPU_FAM6(HASWELL_X,		idle_cpu_hsw),
> >  +	INTEL_CPU_FAM6(HASWELL_ULT,		idle_cpu_hsw),
> >  +	INTEL_CPU_FAM6(HASWELL_GT3E,		idle_cpu_hsw),
> > - 	INTEL_CPU_FAM6(ATOM_SILVERMONT2,	idle_cpu_avn),
> > ++	INTEL_CPU_FAM6(ATOM_SILVERMONT_X,	idle_cpu_avn),
> >  +	INTEL_CPU_FAM6(BROADWELL_CORE,		idle_cpu_bdw),
> >  +	INTEL_CPU_FAM6(BROADWELL_GT3E,		idle_cpu_bdw),
> >  +	INTEL_CPU_FAM6(BROADWELL_X,		idle_cpu_bdw),
> >  +	INTEL_CPU_FAM6(BROADWELL_XEON_D,	idle_cpu_bdw),
> >  +	INTEL_CPU_FAM6(SKYLAKE_MOBILE,		idle_cpu_skl),
> >  +	INTEL_CPU_FAM6(SKYLAKE_DESKTOP,		idle_cpu_skl),
> >  +	INTEL_CPU_FAM6(KABYLAKE_MOBILE,		idle_cpu_skl),
> >  +	INTEL_CPU_FAM6(KABYLAKE_DESKTOP,	idle_cpu_skl),
> >  +	INTEL_CPU_FAM6(SKYLAKE_X,		idle_cpu_skx),
> >  +	INTEL_CPU_FAM6(XEON_PHI_KNL,		idle_cpu_knl),
> >  +	INTEL_CPU_FAM6(XEON_PHI_KNM,		idle_cpu_knl),
> >  +	INTEL_CPU_FAM6(ATOM_GOLDMONT,		idle_cpu_bxt),
> > - 	INTEL_CPU_FAM6(ATOM_GEMINI_LAKE,	idle_cpu_bxt),
> > - 	INTEL_CPU_FAM6(ATOM_DENVERTON,		idle_cpu_dnv),
> > ++	INTEL_CPU_FAM6(ATOM_GOLDMONT_PLUS,	idle_cpu_bxt),
> > ++	INTEL_CPU_FAM6(ATOM_GOLDMONT_X,		idle_cpu_dnv),
> >   	{}
> >   };
> >  =20
> > 
> > --Sig_/8A/3tsSoWQOAryCmuI_nxw6
> > Content-Type: application/pgp-signature
> > Content-Description: OpenPGP digital signature
> > 
> > 
> > --Sig_/8A/3tsSoWQOAryCmuI_nxw6--
> > 
> 
> This looks good to me.  Andy?

Either to me.

-- 
With Best Regards,
Andy Shevchenko
