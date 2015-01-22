From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] tpm/tpm_tis: Add missing ifdef CONFIG_ACPI for
 pnp_acpi_device
Date: Thu, 22 Jan 2015 13:22:29 +1100 (AEDT)
Message-ID: <alpine.LRH.2.11.1501221322180.20126@namei.org>
References: <1421883770-13720-1-git-send-email-peterhuewe@gmx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:38712 "EHLO namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752249AbbAVCWv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2015 21:22:51 -0500
In-Reply-To: <1421883770-13720-1-git-send-email-peterhuewe@gmx.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Huewe <peterhuewe@gmx.de>
Cc: linux-security-module@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, tpmdd-devel@lists.sourceforge.net, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jim Davis <jim.epost@gmail.com>

On Thu, 22 Jan 2015, Peter Huewe wrote:

> This fixes a build failure if CONFIG_PNP is set but CONFIG_ACPI is not:
> drivers/char/tpm/tpm_tis.c: In function ?tpm_tis_pnp_init?:
> drivers/char/tpm/tpm_tis.c:912:45: error: invalid type argument of
> ?->? (have ?int?)
>    acpi_dev_handle = pnp_acpi_device(pnp_dev)->handle;
> 
> If CONFIG_PNPACPI is not set pnp_acpi_device is defined as 0 and thus
> accesing the handle is not possible.
> 
> Fixes: 0dc553652102 ("tpm: fix raciness of PPI interface lookup")
> Reported-by: Jim Davis <jim.epost@gmail.com>
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Applied.


-- 
James Morris
<jmorris@namei.org>
