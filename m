From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the tty tree
Date: Mon, 17 Jun 2013 11:22:50 -0700
Message-ID: <ed138cdb-8a20-4c84-95f4-6137e5803e36@CO9EHSMHS013.ehs.local>
References: <20130617164841.41561f78f3465bd4007411b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]:44512
	"EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751043Ab3FQSXH convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Jun 2013 14:23:07 -0400
Content-Disposition: inline
In-Reply-To: <20130617164841.41561f78f3465bd4007411b6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Jingoo Han <jg1.han@samsung.com>, Greg KH <greg@kroah.com>

On Mon, Jun 17, 2013 at 04:48:41PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/tty/serial/xilinx_uartps.c between commit 696faedd616e ("seri=
al:
> use platform_{get,set}_drvdata()") from the tty tree and commit
> 30e1e28598c2 ("arm: zynq: Migrate platform to clock controller") from=
 the
> arm-soc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc drivers/tty/serial/xilinx_uartps.c
> index 6c91745,a4a3028..0000000
> --- a/drivers/tty/serial/xilinx_uartps.c
> +++ b/drivers/tty/serial/xilinx_uartps.c
> @@@ -972,14 -1004,15 +1004,14 @@@ static int xuartps_probe(struct pla=
tfor
>   		port->mapbase =3D res->start;
>   		port->irq =3D res2->start;
>   		port->dev =3D &pdev->dev;
> - 		port->uartclk =3D clk_get_rate(clk);
> - 		port->private_data =3D clk;
> + 		port->uartclk =3D clk_get_rate(xuartps_data->refclk);
> + 		port->private_data =3D xuartps_data;
>  -		dev_set_drvdata(&pdev->dev, port);
>  +		platform_set_drvdata(pdev, port);
>   		rc =3D uart_add_one_port(&xuartps_uart_driver, port);
>   		if (rc) {
>   			dev_err(&pdev->dev,
>   				"uart_add_one_port() failed; err=3D%i\n", rc);
> - 			return rc;
>  -			dev_set_drvdata(&pdev->dev, NULL);
> + 			goto err_out_clk_disable;
>   		}
>   		return 0;
>   	}
> @@@ -993,14 -1039,19 +1038,18 @@@ err_out_free
>    **/
>   static int xuartps_remove(struct platform_device *pdev)
>   {
>  -	struct uart_port *port =3D dev_get_drvdata(&pdev->dev);
>  +	struct uart_port *port =3D platform_get_drvdata(pdev);
> - 	struct clk *clk =3D port->private_data;
> + 	struct xuartps *xuartps_data =3D port->private_data;
>   	int rc;
>  =20
>   	/* Remove the xuartps port from the serial core */
>   	rc =3D uart_remove_one_port(&xuartps_uart_driver, port);
>  -	dev_set_drvdata(&pdev->dev, NULL);
>   	port->mapbase =3D 0;
> - 	clk_disable_unprepare(clk);
> + 	clk_disable_unprepare(xuartps_data->refclk);
> + 	clk_disable_unprepare(xuartps_data->aperclk);
> + 	clk_put(xuartps_data->refclk);
> + 	clk_put(xuartps_data->aperclk);
> + 	kfree(xuartps_data);
>   	return rc;
>   }
Looks correct and boots fine on Zynq. Thanks.

	S=C3=B6ren
