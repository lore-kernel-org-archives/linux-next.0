From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with Linus' tree
Date: Mon, 29 Oct 2018 11:34:56 +0200
Message-ID: <CAHp75Vfcsq_+vE8fH2EsPnEnyPbf6DqYE0m=oJH0_bHHV=y_EQ@mail.gmail.com>
References: <20181029142907.54af8715@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029142907.54af8715@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Darren Hart <dvhart@infradead.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 29, 2018 at 5:29 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
>
>   drivers/platform/x86/intel_telemetry_debugfs.c
>
> between commit:
>
>   f2c4db1bd807 ("x86/cpu: Sanitize FAM6_ATOM naming")
>
> from Linus' tree and commit:
>
>   1a7938a632ce ("platform/x86: intel_telemetry: Get rid of custom macro")
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
This looks correct to me.

>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/platform/x86/intel_telemetry_debugfs.c
> index cee08f236292,30988e31c713..000000000000
> --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> @@@ -319,8 -308,8 +308,8 @@@ static struct telemetry_debugfs_conf te
>   };
>
>   static const struct x86_cpu_id telemetry_debugfs_cpu_ids[] = {
> -       TELEM_DEBUGFS_CPU(INTEL_FAM6_ATOM_GOLDMONT, telem_apl_debugfs_conf),
> -       TELEM_DEBUGFS_CPU(INTEL_FAM6_ATOM_GOLDMONT_PLUS, telem_apl_debugfs_conf),
> +       INTEL_CPU_FAM6(ATOM_GOLDMONT, telem_apl_debugfs_conf),
>  -      INTEL_CPU_FAM6(ATOM_GEMINI_LAKE, telem_apl_debugfs_conf),
> ++      INTEL_CPU_FAM6(ATOM_GOLDMONT_PLUS, telem_apl_debugfs_conf),
>         {}
>   };
>


-- 
With Best Regards,
Andy Shevchenko
