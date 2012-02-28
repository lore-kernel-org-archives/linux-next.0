From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the pci tree
Date: Mon, 27 Feb 2012 20:39:00 -0800
Message-ID: <CAE9FiQXSoo4=4czdpPuz=txbyyG+sfJTvE-oAf3c5Z81oR2ing@mail.gmail.com>
References: <20120228142909.48fa1eea6980eaffa27abfdc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:40913 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755235Ab2B1EjA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Feb 2012 23:39:00 -0500
In-Reply-To: <20120228142909.48fa1eea6980eaffa27abfdc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>

On Mon, Feb 27, 2012 at 7:29 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Greg,
>
> Today's linux-next merge of the driver-core tree got a conflict in
> include/linux/pci.h between commit 6754b9e9c335 ("PCI: Rename
> pci_remove_behind_bridge to pci_stop_and_remove_behind_bridge") from =
the
> pci tree and commit aad4f4000cec ("PCI: Add helper macro for
> pci_register_driver boilerplate") from the driver-core tree.
>
> Just context changes. =A0I fixed it up (see below) and can carry the =
fix as
> necessary.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc include/linux/pci.h
> index 5584aac,d4afd70..0000000
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@@ -947,7 -946,20 +947,20 @@@ int __must_check __pci_register_driver=
(
> =A0 =A0 =A0 =A0__pci_register_driver(driver, THIS_MODULE, KBUILD_MODN=
AME)
>
> =A0void pci_unregister_driver(struct pci_driver *dev);
> +
> + /**
> + =A0* module_pci_driver() - Helper macro for registering a PCI drive=
r
> + =A0* @__pci_driver: pci_driver struct
> + =A0*
> + =A0* Helper macro for PCI drivers which do not do anything special =
in module
> + =A0* init/exit. This eliminates a lot of boilerplate. Each module m=
ay only
> + =A0* use this macro once, and calling it replaces module_init() and=
 module_exit()
> + =A0*/
> + #define module_pci_driver(__pci_driver) \
> + =A0 =A0 =A0 module_driver(__pci_driver, pci_register_driver, \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pci_unregister_driver)
> +
> =A0-void pci_remove_behind_bridge(struct pci_dev *dev);
> =A0+void pci_stop_and_remove_behind_bridge(struct pci_dev *dev);
> =A0struct pci_driver *pci_dev_driver(const struct pci_dev *dev);
> =A0int pci_add_dynid(struct pci_driver *drv,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int vendor, unsigned int =
device,


yes. we rename pci_remove_* to pci_stop_and_remove_*.

BTW, include/linux/pci.h looks like a mess. We should tidy it up

Thanks

Yinghai
