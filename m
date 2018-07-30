From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: linux-next: build warning after merge of the pm tree
Date: Mon, 30 Jul 2018 09:30:30 +0200
Message-ID: <20180730073030.GD7615@w540>
References: <20180730120053.62732d27@canb.auug.org.au>
 <20180730072445.kt2yxxifx4i7y3fr@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180730072445.kt2yxxifx4i7y3fr@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: linux-next.vger.kernel.org


--//IivP0gvsAy3Can
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

On Mon, Jul 30, 2018 at 10:24:45AM +0300, Sakari Ailus wrote:
> Hi folks,
>
> On Mon, Jul 30, 2018 at 12:00:53PM +1000, Stephen Rothwell wrote:
> > Hi Rafael,
> >
> > After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> >
> > drivers/media/i2c/mt9v111.c: In function 'mt9v111_set_format':
> > drivers/media/i2c/mt9v111.c:887:15: warning: 'idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
> >   unsigned int idx;
> >                ^~~
> >
> > Introduced by commit
> >
> >   aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> >
> > Looks like a false positive, but not something that gcc can easily see.
>
> This must be coming from a new driver merged to media tree recently. Thanks
> for reporting this.
>

Yes, my bad, it is a false positive and I ignored it,
sorry about that. There is already a patch sent to linux-media to fix
this on top of the driver.

https://patchwork.kernel.org/patch/10547983/

Thanks
   j

> --
> Regards,
>
> Sakari Ailus
> sakari.ailus@linux.intel.com

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbXr6OAAoJEHI0Bo8WoVY8IDsP/3hFbCH3LzcrhijYeA+kEfiG
U/N6VKDxz+TK2Oq7U5TItpEFTqpWFyDBRpM2Wrd+9WWw1VZOWKQwc1X1xz77TtQX
P25K+BQbxlkSASNpkSq4z8Gmxae6KueFDpYyg87Blc2NUvfUFv2QfTK/n4YZwavV
eSv18h7vhPqApImHnhDhPssGkWMhKHA9dufqwGCEalCvfnHK7oy/tQLmo+9RqFEm
eNqUztBmpDEomGMrYwWEZqNioDuNPHX+O2h9/VSUE+pOQA+zWkhVwQBFKChVTsFd
5tpKv3l3gq21Az0bnkFbJHTrz/RRRsdillnx4Re181rhezj9JMld9VizZDFqeIt1
y6+XL89JGNiHJdWj3NzQY19bkIo1gRCXy1xOD8j8fJicqgXHAFsLJBtH3kI1M5tw
3NYnZV8Gv+2/9jN3ZuLvi3EtacdJmLR3+zHADgZV9HxXxTZiFOpam27iXZ9qBUuC
Vxkl+e3AA+HAvD1c8ZuAC/Xgmw31ep+hpP3OUaNNSV3yK9JWc/2akoI+YHBtNMnI
B7nlwHXt4YmWksEj2I3Sbt6AOG6qglXiCzCi5PKUmT/kiVDZbhWabs44iaL8T0Xy
KyHApSMtmgaJJGrNukX2kQbNVHCdbYls6NDg4tpWDsrKs3vF5rXYQKSnZTuBcOC0
K0i9cD7fzfZkm1iWhp5e
=NsrG
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--
