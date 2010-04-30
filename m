From: Bob Beers <bob.beers@gmail.com>
Subject: Re: [PATCH -next] staging/cxt1e1: use netdev_priv to fix build
Date: Fri, 30 Apr 2010 14:19:07 -0400
Message-ID: <s2o4f6ba3b1004301119hd275af8r6bd4fdd98b14168a@mail.gmail.com>
References: <20100430100712.041f6fcc.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:41528 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759284Ab0D3STL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Apr 2010 14:19:11 -0400
In-Reply-To: <20100430100712.041f6fcc.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, gregkh@suse.de

On Fri, Apr 30, 2010 at 1:07 PM, Randy Dunlap <randy.dunlap@oracle.com>=
 wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> Fix cxt1e1 build error:
> drivers/staging/cxt1e1/linux.c:1195: error: 'struct net_device' has n=
o member named 'priv'
>
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: Bob Beers <bob.beers@gmail.com>

This is correct of course. If you need it ...

Acked-by: Bob Beers <bob.beers@gmail.com>

> ---
> =A0drivers/staging/cxt1e1/linux.c | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20100430.orig/drivers/staging/cxt1e1/linux.c
> +++ linux-next-20100430/drivers/staging/cxt1e1/linux.c
> @@ -1192,7 +1192,7 @@ c4_add_dev (hdw_info_t * hi, int brdno,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hi->devname, irq1);
> =A0 =A0 =A0 =A0 unregister_netdev (ndev);
> =A0 =A0 =A0 =A0 free_irq (irq0, ndev);
> - =A0 =A0 =A0 =A0OS_kfree (ndev->priv);
> + =A0 =A0 =A0 =A0OS_kfree (netdev_priv(ndev));
> =A0 =A0 =A0 =A0 OS_kfree (ndev);
> =A0 =A0 =A0 =A0 error_flag =3D EIO;
> =A0 =A0 =A0 =A0 return 0;
>
