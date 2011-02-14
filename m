From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Date: Mon, 14 Feb 2011 23:42:12 +0100
Message-ID: <201102142342.12767.rjw@sisk.pl>
References: <20110214163944.53c1241d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:44522 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751472Ab1BNWmV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Feb 2011 17:42:21 -0500
In-Reply-To: <20110214163944.53c1241d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, Paul Fox <pgf@laptop.org>

On Monday, February 14, 2011, Stephen Rothwell wrote:
> Hi Matthew,
> 
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/platform/x86/xo15-ebook.c: In function 'ebook_switch_add':
> drivers/platform/x86/xo15-ebook.c:136: error: 'struct acpi_device_wakeup' has no member named 'run_wake_count'
> 
> Caused by commit f160ad4c2a720411a136db7b867c3b4b868b8933 ("OLPC XO-1.5
> ebook switch driver") interacting with commit
> 0cab2dcf9963b1a7ed32e730384e1e8925b099cd ("ACPI: Remove the
> wakeup.run_wake_count device field") from the acpi tree.
> 
> I have applied this merge fix patch:

The fix is correct, thanks Stephen!

Rafael


> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 14 Feb 2011 16:36:41 +1100
> Subject: [PATCH] OLPC: fix for removal of run_wak_count
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/platform/x86/xo15-ebook.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/platform/x86/xo15-ebook.c b/drivers/platform/x86/xo15-ebook.c
> index 2343bb3..c1372ed 100644
> --- a/drivers/platform/x86/xo15-ebook.c
> +++ b/drivers/platform/x86/xo15-ebook.c
> @@ -133,7 +133,6 @@ static int ebook_switch_add(struct acpi_device *device)
>  		/* Button's GPE is run-wake GPE */
>  		acpi_enable_gpe(device->wakeup.gpe_device,
>  				device->wakeup.gpe_number);
> -		device->wakeup.run_wake_count++;
>  		device_set_wakeup_enable(&device->dev, true);
>  	}
