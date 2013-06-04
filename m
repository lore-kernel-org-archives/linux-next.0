From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
Date: Mon, 3 Jun 2013 20:11:26 -0600
Message-ID: <CAErSpo7TJK0W2_KKC8jX-JcdirMNxR7HNwbOvpHqq158MMdy4g@mail.gmail.com>
References: <20130604114955.753909b956c4f8e75ace86a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33932 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756754Ab3FDCLr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Jun 2013 22:11:47 -0400
Received: by mail-ob0-f172.google.com with SMTP id wo10so8551532obc.17
        for <linux-next@vger.kernel.org>; Mon, 03 Jun 2013 19:11:47 -0700 (PDT)
In-Reply-To: <20130604114955.753909b956c4f8e75ace86a0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next list <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yinghai Lu <yinghai@kernel.org>, Jiang Liu <jiang.liu@huawei.com>

On Mon, Jun 3, 2013 at 7:49 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Bjorn,
>
> Today's linux-next merge of the pci tree got a conflict in
> drivers/acpi/pci_root.c between commit 3f327e39b4b8 ("PCI: acpiphp:
> Re-enumerate devices when host bridge receives Bus Check") from Linus'
> tree and commit 6dc7d22c6738 ("PCI/ACPI: Use dev_printk(),
> acpi_handle_print(), pr_xxx() when possible") from the pci tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks perfect, thanks!

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc drivers/acpi/pci_root.c
> index e427dc5,122b4dc..0000000
> --- a/drivers/acpi/pci_root.c
> +++ b/drivers/acpi/pci_root.c
> @@@ -639,11 -620,9 +620,11 @@@ static void _handle_hotplug_event_root(
>         switch (type) {
>         case ACPI_NOTIFY_BUS_CHECK:
>                 /* bus enumerate */
> -               printk(KERN_DEBUG "%s: Bus check notify on %s\n", __func__,
> -                                (char *)buffer.pointer);
> +               acpi_handle_printk(KERN_DEBUG, handle,
> +                                  "Bus check notify on %s\n", __func__);
>  -              if (!root)
>  +              if (root)
>  +                      acpiphp_check_host_bridge(handle);
>  +              else
>                         handle_root_bridge_insertion(handle);
>
>                 break;
