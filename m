From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: next-20160915 build: 2 failures 16 warnings (next-20160915)
Date: Thu, 15 Sep 2016 16:41:40 +0100
Message-ID: <20160915154140.GM27974@sirena.org.uk>
References: <E1bkV4u-0004AY-TY@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0qVF/w3MHQqLSynd"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1bkV4u-0004AY-TY@optimist>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-next.vger.kernel.org


--0qVF/w3MHQqLSynd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 15, 2016 at 12:43:41PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build both arm and arm64 allmodconfigs due to:

> 	arm64-allmodconfig
> ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!

> 	arm-allmodconfig
> ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!

due to 7cba17ec9adc8cf (musb: sunxi: Add support for platform_set_mode)
which adds a call to that non-exported function to a module.

--0qVF/w3MHQqLSynd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX2sEzAAoJECTWi3JdVIfQFBAH/1jnX5lhua10Uf9STmkb1pF2
fKY83gV7BWQIobXK6dbBpr2mDdVTtvDPDLilZWOu8csds8NQhgytpetO21hcNzZ6
R5FshtF0a1X/TMofuDIg8czFmQhCLdOuqYLi8KVbYs4W8AXB9oOZF1ki4BS2SRBm
1GEA63Mn5cNvexfbCIhYLW3I7I0NqPlmxMsNmje+Eoh3kO7WDuXvhsIGuzvQqABM
zb0Z04z94vyVK52PgYYDaqgYToQ0KYhpjlBMJFoGms1tblK12pYic+BGO6A3fuzG
jyOJOOkKKXnmxfwzT9ZzDS8AR0FiJDB1bUr+SgbBpxrG4vcd/t/0/ggYoG3OY6Y=
=C01R
-----END PGP SIGNATURE-----

--0qVF/w3MHQqLSynd--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
