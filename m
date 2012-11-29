From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 driver-core tree
Date: Thu, 29 Nov 2012 23:59:27 +0100
Message-ID: <20121129225927.GJ8628@kw.sim.vm.gnt>
References: <20121129160309.7dc352f433d39f1bde0018a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7384244089845162181=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121129160309.7dc352f433d39f1bde0018a8@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Bill Pemberton <wfp5p@virginia.edu>, Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org


--===============7384244089845162181==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aqWxf8ydqYKP8htK"
Content-Disposition: inline


--aqWxf8ydqYKP8htK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2012 at 04:03:09PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/leds/leds-ns2.c between commit 98ea1ea20cb7 ("leds: remove use of
> __devinit") from the driver-core tree and commit 72052fcc1026 ("leds:
> leds-ns2: add device tree binding") from the arm-soc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Hi Stephen,

The merge is fine and the driver works as expected.

Thanks.

Simon

>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc drivers/leds/leds-ns2.c
> index bc6a0db,d64cc22..0000000
> --- a/drivers/leds/leds-ns2.c
> +++ b/drivers/leds/leds-ns2.c
> @@@ -247,9 -260,67 +248,65 @@@ static void delete_ns2_led(struct ns2_l
>   {
>   	device_remove_file(led_dat->cdev.dev, &dev_attr_sata);
>   	led_classdev_unregister(&led_dat->cdev);
>  -	gpio_free(led_dat->cmd);
>  -	gpio_free(led_dat->slow);
>   }
>  =20
> + #ifdef CONFIG_OF_GPIO
> + /*
> +  * Translate OpenFirmware node properties into platform_data.
> +  */
>  -static int __devinit
> ++static int
> + ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data =
*pdata)
> + {
> + 	struct device_node *np =3D dev->of_node;
> + 	struct device_node *child;
> + 	struct ns2_led *leds;
> + 	int num_leds =3D 0;
> + 	int i =3D 0;
> +=20
> + 	num_leds =3D of_get_child_count(np);
> + 	if (!num_leds)
> + 		return -ENODEV;
> +=20
> + 	leds =3D devm_kzalloc(dev, num_leds * sizeof(struct ns2_led),
> + 			    GFP_KERNEL);
> + 	if (!leds)
> + 		return -ENOMEM;
> +=20
> + 	for_each_child_of_node(np, child) {
> + 		const char *string;
> + 		int ret;
> +=20
> + 		ret =3D of_get_named_gpio(child, "cmd-gpio", 0);
> + 		if (ret < 0)
> + 			return ret;
> + 		leds[i].cmd =3D ret;
> + 		ret =3D of_get_named_gpio(child, "slow-gpio", 0);
> + 		if (ret < 0)
> + 			return ret;
> + 		leds[i].slow =3D ret;
> + 		ret =3D of_property_read_string(child, "label", &string);
> + 		leds[i].name =3D (ret =3D=3D 0) ? string : child->name;
> + 		ret =3D of_property_read_string(child, "linux,default-trigger",
> + 					      &string);
> + 		if (ret =3D=3D 0)
> + 			leds[i].default_trigger =3D string;
> +=20
> + 		i++;
> + 	}
> +=20
> + 	pdata->leds =3D leds;
> + 	pdata->num_leds =3D num_leds;
> +=20
> + 	return 0;
> + }
> +=20
> + static const struct of_device_id of_ns2_leds_match[] =3D {
> + 	{ .compatible =3D "lacie,ns2-leds", },
> + 	{},
> + };
> + #endif /* CONFIG_OF_GPIO */
> +=20
>  -static int __devinit ns2_led_probe(struct platform_device *pdev)
>  +static int ns2_led_probe(struct platform_device *pdev)
>   {
>   	struct ns2_led_platform_data *pdata =3D pdev->dev.platform_data;
>   	struct ns2_led_data *leds_data;
> @@@ -296,10 -381,11 +367,11 @@@ static int ns2_led_remove(struct platfo
>  =20
>   static struct platform_driver ns2_led_driver =3D {
>   	.probe		=3D ns2_led_probe,
>  -	.remove		=3D __devexit_p(ns2_led_remove),
>  +	.remove		=3D ns2_led_remove,
>   	.driver		=3D {
> - 		.name	=3D "leds-ns2",
> - 		.owner	=3D THIS_MODULE,
> + 		.name		=3D "leds-ns2",
> + 		.owner		=3D THIS_MODULE,
> + 		.of_match_table	=3D of_match_ptr(of_ns2_leds_match),
>   	},
>   };
>  =20



--aqWxf8ydqYKP8htK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlC36M8ACgkQgtp0PDeOcDq9NwCgha3sIDKFoz+xXZOp+l5d7+5b
n/wAn091Ln9UhKBOEeK6WImqORHyXfag
=rGMF
-----END PGP SIGNATURE-----

--aqWxf8ydqYKP8htK--


--===============7384244089845162181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7384244089845162181==--
