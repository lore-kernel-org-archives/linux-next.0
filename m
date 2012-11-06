From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Date: Tue, 6 Nov 2012 09:52:40 -0700
Message-ID: <CAErSpo7=wZUi4mB4N-pAWzRsyineRFh-W2NtZgAPJe5pNWUayA@mail.gmail.com>
References: <20121106134826.32a117100825204d48150f0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:49408 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752367Ab2KFQxB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Nov 2012 11:53:01 -0500
Received: by mail-wi0-f172.google.com with SMTP id hq12so4481711wib.1
        for <linux-next@vger.kernel.org>; Tue, 06 Nov 2012 08:53:00 -0800 (PST)
In-Reply-To: <20121106134826.32a117100825204d48150f0b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Feng Tang <feng.tang@intel.com>

On Mon, Nov 5, 2012 at 7:48 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rafael,
>
> Today's linux-next merge of the pm tree got a conflict in
> arch/x86/pci/acpi.c between commit 3f385fa9edce ("x86/PCI: Ignore _SEG on
> HP xw9300") from the pci tree and commit 97a7108a3c00 ("ACPI / x86: Add
> quirk for "CheckPoint P-20-00" to not use bridge _CRS_ info") from the pm
> tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

My opinion was that we should just drop the CheckPoint quirk.  See
https://bugzilla.kernel.org/show_bug.cgi?id=47981#c36 for my
rationale.

The changelog of the quirk leaves the wrong impression:

    This is to fix a regression
https://bugzilla.kernel.org/show_bug.cgi?id=47981

    The CheckPoint P-20-00 works ok before new machines (2008 and later) are
    forced to use the bridge _CRS info by default in 2.6.34. Add this quirk
    to restore its old way of working: not using bridge _CRS info.

This is NOT a regression, at least not in the usual sense.  The
CheckPoint BIOS has a serious defect that corrupts part of the DSDT.
It happened that things "worked" when we ignored the _CRS that was
corrupted (other things are almost certainly broken, but we don't know
what they are yet).  And it's not a question of being "forced" to use
the bridge _CRS.  Every system SHOULD be using _CRS; that's the only
way we can correctly manage resources of ACPI devices.

But if you (Rafael) decide we should keep this, I won't object.

The conflict resolution looks fine to me.

> diff --cc arch/x86/pci/acpi.c
> index 49e5195,7010c19..0000000
> --- a/arch/x86/pci/acpi.c
> +++ b/arch/x86/pci/acpi.c
> @@@ -106,16 -98,16 +106,27 @@@ static const struct dmi_system_id pci_c
>                         DMI_MATCH(DMI_BIOS_VERSION, "6JET85WW (1.43 )"),
>                 },
>         },
>  +
>  +      /* https://bugzilla.kernel.org/show_bug.cgi?id=15362 */
>  +      {
>  +              .callback = set_ignore_seg,
>  +              .ident = "HP xw9300",
>  +              .matches = {
>  +                      DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
>  +                      DMI_MATCH(DMI_PRODUCT_NAME, "HP xw9300 Workstation"),
>  +              },
>  +      },
> ++
> +       /* https://bugzilla.kernel.org/show_bug.cgi?id=47981 */
> +       {
> +               .callback = set_nouse_crs,
> +               .ident = "CheckPoint P-20-00",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "CheckPoint"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "P-20-00"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "Bridgeport"),
> +               },
> +       },
>         {}
>   };
>
