From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the tip tree
Date: Mon, 8 Oct 2018 13:55:39 +0300
Message-ID: <CAHp75Vc3yT9ut1yJtME_NCkjL8mxUdp_by9q=YxjwcS+D+GHoQ@mail.gmail.com>
References: <20181008144438.53e6fdbc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008144438.53e6fdbc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 8, 2018 at 6:44 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
>
>   drivers/platform/x86/intel_int0002_vgpio.c
>
> between commit:
>
>   f2c4db1bd807 ("x86/cpu: Sanitize FAM6_ATOM naming")
>
> from the tip tree and commit:
>
>   96402de65afc ("platform/x86: intel_int0002_vgpio: Enable the driver on Bay Trail platforms")
>
> from the drivers-x86 tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

Looks good to me!

> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/platform/x86/intel_int0002_vgpio.c
> index e89ad4964dc1,c958a628c375..000000000000
> --- a/drivers/platform/x86/intel_int0002_vgpio.c
> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> @@@ -57,11 -54,7 +54,7 @@@
>   #define ICPU(model)   { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
>
>   static const struct x86_cpu_id int0002_cpu_ids[] = {
> - /*
> -  * Limit ourselves to Cherry Trail for now, until testing shows we
> -  * need to handle the INT0002 device on Baytrail too.
> -  *    ICPU(INTEL_FAM6_ATOM_SILVERMONT),        * Valleyview, Bay Trail *
> -  */
>  -      ICPU(INTEL_FAM6_ATOM_SILVERMONT1),      /* Valleyview, Bay Trail  */
> ++      ICPU(INTEL_FAM6_ATOM_SILVERMONT),       /* Valleyview, Bay Trail  */
>         ICPU(INTEL_FAM6_ATOM_AIRMONT),          /* Braswell, Cherry Trail */
>         {}
>   };



-- 
With Best Regards,
Andy Shevchenko
