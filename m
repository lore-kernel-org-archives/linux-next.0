From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the tip tree
Date: Mon, 8 Oct 2018 13:55:07 +0300
Message-ID: <CAHp75VdVLV9YKSzatcAuq4YmitjaERV6mOTEWiWnRf_yoUGJAA@mail.gmail.com>
References: <20181008144838.60d8ad83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008144838.60d8ad83@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 8, 2018 at 6:48 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
>
>   drivers/platform/x86/intel_mid_powerbtn.c
>
> between commit:
>
>   f2c4db1bd807 ("x86/cpu: Sanitize FAM6_ATOM naming")
>
> from the tip tree and commit:
>
>   a8b60e484f3d ("platform/x86: intel_mid_powerbtn: Get rid of custom ICPU() macro")
>
> from the drivers-x86 tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks!
Looks good to me.

> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/platform/x86/intel_mid_powerbtn.c
> index 5ad44204a9c3,a8c0fbb7f799..000000000000
> --- a/drivers/platform/x86/intel_mid_powerbtn.c
> +++ b/drivers/platform/x86/intel_mid_powerbtn.c
> @@@ -121,12 -112,9 +112,9 @@@ static const struct mid_pb_ddata mrfld_
>         .setup  = mrfld_setup,
>   };
>
> - #define ICPU(model, ddata)    \
> -       { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (kernel_ulong_t)&ddata }
> -
>   static const struct x86_cpu_id mid_pb_cpu_ids[] = {
> -       ICPU(INTEL_FAM6_ATOM_SALTWELL_MID,              mfld_ddata),
> -       ICPU(INTEL_FAM6_ATOM_SILVERMONT_MID,    mrfld_ddata),
>  -      INTEL_CPU_FAM6(ATOM_PENWELL,            mfld_ddata),
>  -      INTEL_CPU_FAM6(ATOM_MERRIFIELD,         mrfld_ddata),
> ++      INTEL_CPU_FAM6(ATOM_SALTWELL_MID,       mfld_ddata),
> ++      INTEL_CPU_FAM6(ATOM_SILVERMONT_MID,     mrfld_ddata),
>         {}
>   };
>


-- 
With Best Regards,
Andy Shevchenko
