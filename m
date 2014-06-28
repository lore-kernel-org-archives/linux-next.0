From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH linux-next] staging: emxx_udc: replace strict_strtol call
Date: Sat, 28 Jun 2014 10:09:35 -0700
Message-ID: <1403975375.9064.29.camel@joe-AO725>
References: <1403974823-23578-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1403974823-23578-1-git-send-email-vincent.stehle@laposte.net>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Vincent =?ISO-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Sat, 2014-06-28 at 19:00 +0200, Vincent Stehl=E9 wrote:
> Commit 582e9d37a9a3 'include/linux: remove strict_strto* definitions' has
> obsoleted the strict_strtol function. Use kstrtol instead.
[]
> diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_u=
dc/emxx_udc.c
[]
> @@ -3285,7 +3285,7 @@ static void __init nbu2ss_drv_set_ep_info(
>  =

>  		tempbuf[0] =3D name[2];
>  		tempbuf[1] =3D '\0';
> -		res =3D strict_strtol(tempbuf, 16, &num);
> +		res =3D kstrtol(tempbuf, 16, &num);


The whole block if code is obtuse and should be simplified to:
---
 drivers/staging/emxx_udc/emxx_udc.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc=
/emxx_udc.c
index c92ded8..f41831e 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -3276,24 +3276,10 @@ static void __init nbu2ss_drv_set_ep_info(
 	ep->ep.name =3D name;
 	ep->ep.ops =3D &nbu2ss_ep_ops;
 =

-	if (isdigit(name[2])) {
-
-		long	num;
-		int	res;
-		char	tempbuf[2];
-
-		tempbuf[0] =3D name[2];
-		tempbuf[1] =3D '\0';
-		res =3D strict_strtol(tempbuf, 16, &num);
-
-		if (num =3D=3D 0)
-			ep->ep.maxpacket =3D EP0_PACKETSIZE;
-		else
-			ep->ep.maxpacket =3D EP_PACKETSIZE;
-
-	} else {
+	if (name[2] =3D=3D '0')
+		ep->ep.maxpacket =3D EP0_PACKETSIZE;
+	else
 		ep->ep.maxpacket =3D EP_PACKETSIZE;
-	}
 =

 	list_add_tail(&ep->ep.ep_list, &udc->gadget.ep_list);
 	INIT_LIST_HEAD(&ep->queue);
