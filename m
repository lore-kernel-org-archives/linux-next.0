From: Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH -next] staging: fix mei build when PM is not enabled
Date: Thu, 19 May 2011 20:29:26 +0300
Message-ID: <BANLkTi=PyyFxvL3YUJcO=2GTrHpjwG-RLA@mail.gmail.com>
References: <20110519135941.2fda46ca.sfr@canb.auug.org.au>
	<20110519085234.2784f588.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:38093 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933494Ab1ESRba convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 May 2011 13:31:30 -0400
In-Reply-To: <20110519085234.2784f588.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>, driverdevel <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, May 19, 2011 at 6:52 PM, Randy Dunlap <randy.dunlap@oracle.com>=
 wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> Fix mei build when CONFIG_PM is not enabled (i.e., fix typo):
>
> drivers/staging/mei/main.c:1159: error: 'MEI_PM_OPS' undeclared here =
(not in a function)
>
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
> =C2=A0drivers/staging/mei/main.c | =C2=A0 =C2=A02 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20110519.orig/drivers/staging/mei/main.c
> +++ linux-next-20110519/drivers/staging/mei/main.c
> @@ -1145,7 +1145,7 @@ static int mei_pci_resume(struct device
> =C2=A0static SIMPLE_DEV_PM_OPS(mei_pm_ops, mei_pci_suspend, mei_pci_r=
esume);
> =C2=A0#define MEI_PM_OPS =C2=A0 =C2=A0 (&mei_pm_ops)
> =C2=A0#else
> -#define MIE_PM_OPS =C2=A0 =C2=A0 NULL
> +#define MEI_PM_OPS =C2=A0 =C2=A0 NULL
> =C2=A0#endif /* CONFIG_PM */
> =C2=A0/*
> =C2=A0* =C2=A0PCI driver structure

Thanks for catching this
Ack
Tomas
