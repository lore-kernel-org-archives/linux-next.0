From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: linux-next: manual merge of the usb-gadget tree with the usb tree
Date: Thu, 4 Apr 2013 08:27:30 +0200
Message-ID: <20130404062730.GA4806@avionic-0098.mockup.avionic-design.de>
References: <20130404151845.406517e19f29380ccb90ac35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:51743 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755698Ab3DDG1g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Apr 2013 02:27:36 -0400
Content-Disposition: inline
In-Reply-To: <20130404151845.406517e19f29380ccb90ac35@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Felipe Balbi <balbi@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry@gilfi.de>, Greg KH <greg@kroah.com>


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 03:18:45PM +1100, Stephen Rothwell wrote:
> Hi Felipe,
>=20
> Today's linux-next merge of the usb-gadget tree got a conflict in
> drivers/usb/host/ehci-tegra.c between commit 369a9a9d2af7 ("usb: host:
> ehci-tegra: Fix oops in error cleanup") from the usb tree and commit
> 4261b8f3538c ("usb: host: ehci-tegra: fix PHY error handling") from the
> usb-gadget tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as necessary
> (no action is required).
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc drivers/usb/host/ehci-tegra.c
> index 4f3cfb8,1d2488c..0000000
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@@ -770,19 -765,15 +770,17 @@@ static int tegra_ehci_probe(struct plat
>   	if (!irq) {
>   		dev_err(&pdev->dev, "Failed to get IRQ\n");
>   		err =3D -ENODEV;
>  -		goto fail;
>  +		goto fail_phy;
>   	}
>  =20
>   	if (pdata->operating_mode =3D=3D TEGRA_USB_OTG) {
>   		tegra->transceiver =3D
>   			devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
> - 		if (!IS_ERR_OR_NULL(tegra->transceiver))
> + 		if (!IS_ERR(tegra->transceiver))
>   			otg_set_host(tegra->transceiver->otg, &hcd->self);
>  +	} else {
>  +		tegra->transceiver =3D ERR_PTR(-ENODEV);
>   	}
> - #endif
>  =20
>   	err =3D usb_add_hcd(hcd, irq, IRQF_SHARED);
>   	if (err) {
> @@@ -801,11 -792,8 +799,9 @@@
>   	return err;
>  =20
>   fail:
> - #ifdef CONFIG_USB_OTG_UTILS
> - 	if (!IS_ERR_OR_NULL(tegra->transceiver))
> + 	if (!IS_ERR(tegra->transceiver))
>   		otg_set_host(tegra->transceiver->otg, NULL);
> - #endif
>  +fail_phy:
>   	usb_phy_shutdown(hcd->phy);
>   fail_io:
>   	clk_disable_unprepare(tegra->clk);

Looks good to me, thanks.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRXR1SAAoJEN0jrNd/PrOhOhYQAJsFpwzSmw9HNGC50ap95a5B
J0nn0tH1HTYtNjlS0KuuNW0bqQ7PqDL3R/oFHK7oeOOr38oA1p4E9PvFR/ly+q+m
r+wT4YOY8x0P8QEL2wGjJRcLmBDAWT+G07P4UHRwBQgEzLgtyj2AUBwKYAzifYq9
3vd+cD4jTg5gVoAnyttZv85tcK0FL6DpOQCqAIyO3t7MSeHpKG4bxdQVnKtsCF5k
12gPjb0YGbexN72ldfjb9hMwxX/PzzLHVZxgH7JRNWoQKnvpEDcyy6CN8MMbXf7Z
XJgjMsbNFV40wUcq7s2Xn+1Of2jjDPhjvLwhpuEG1vpa6LWF4bSNfkWFtPCWMWbX
9qpMRJwy26g9YoTRAsUMiHSXH665St5y4REwOx8Ul/IL6iu14qQys0cp2Am2yCSp
Zeaw9x2QxLnhcF0Fi7IXG3Hb6oclMY18I5lChib2Nb0KcKvIcr6/NwlIaSA6N0m+
T1FQ5tif0Kfk1cIuntq3CT3m4Lhgt4cGoj1RdTmPU8E7X7nOjD04YBtcVVL3AV8+
cEBOp+LJ/5PSf2/Hkqaij2jy/HUN3PnrQlzMiPJSzuJVN7uk4M8kbaZcC113QOVw
29+D/P20Do+WWER+MM6YK5iNAAs1OwrdThsX0WqDyf/LrRSWs8musdxZYco4xRGS
qyl9r8cOsNREJs7I7Q/e
=BL2A
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
