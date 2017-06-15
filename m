From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: linux-next: build warning after merge of the i2c tree
Date: Thu, 15 Jun 2017 09:02:44 +0200
Message-ID: <20170615070244.GA1476@katana>
References: <20170605111131.3a113eaa@canb.auug.org.au>
 <20170615113452.1fa1dc67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170615113452.1fa1dc67@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
> >  #define DEBUG
> >  ^
> > <command-line>:0:0: note: this is the location of the previous definiti=
on
> >=20
> > Introduced by commit
> >=20
> >   6c42778780c4 ("i2c: stub: use pr_fmt")
>=20
> I am still getting this ...

Sorry, that slipped through the cracks, will fix today!

Thanks for the reminder.


--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllCMRAACgkQFA3kzBSg
KbYfuA/9GiYGo92aYX05ThZih04QkfmyskOddfGoKeaDsHdG5TQNbN0Z5vxxcHvv
1jGkmeZmcjgqY7BacHVVHNQukvYGTkVCJaEvdyVXpTXwKNAd0slCg98poKTUpm8D
uNDWyRUSbrDT/aFMmuUa31iPevJMlMtFGPu+j3Y9+eXnFGI8h4abxzDIFjjyBu2D
x3S3/5KoBdGXC6yOK4OdV6WuF/vTIJPI2ekvLBgmNKURq94KuY4l7wbP8iaK+6ge
1V1YH7kEY2ByDySYfdu5RQbl97B1cOm4p05XJaw52iLlglsmV69hVjU7vGQp7v5j
icpf8tHunZaKW4d6MQGwhSwgFN7YToqi02X3U0YsaaiHjh2US5HAy8qxS6pu/w6W
uSGraKOAF/6GrdLRAN/8LG8ucBZUWG7A6p96W0Y35TTLQJD2cfrz8gsNw0yO3YV4
iuffC4qKc/pfj6FqSjqaD0eJAds0MqlvsUmb/ZVMber8HAC00gNLuLyt8Di1Xhia
fF3G3C+IV06AAPxifd3h3K+i3NM+e7JYgZaw4FSKH0kRK+HJgWVD8hlT+/ay6xEL
u6OujWEGDJfxNUleMyG6aCa7zT7GjC9R+wUQsqBZCuObDwXUy8GwNPGemHwDft31
lOYsZEty7nj1w1pidv8fc4PGrcXf1m1ooILquLNrSwUwAJ9Y/ds=
=e0kQ
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
