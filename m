From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: nfs build failure
Date: Wed, 18 Jun 2008 14:19:25 -0700
Message-ID: <20080618141925.e1e7a90a.randy.dunlap@oracle.com>
References: <20080618125213.30382b62.sfr@canb.auug.org.au>
	<1213820042.8233.21.camel@localhost>
	<485971F2.8000005@oracle.com>
	<1213823713.25182.35.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:60043 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753357AbYFRVTu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Jun 2008 17:19:50 -0400
In-Reply-To: <1213823713.25182.35.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: chuck.lever@oracle.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wed, 18 Jun 2008 17:15:13 -0400 Trond Myklebust wrote:

> On Wed, 2008-06-18 at 16:37 -0400, Chuck Lever wrote:
> > Trond Myklebust wrote:
> > > On Wed, 2008-06-18 at 12:52 +1000, Stephen Rothwell wrote:
> > >> Hi Trond,
> > >>
> > >> Today's linux-next build (powerpc ppc64_defconfig) failed like t=
his:
> > >>
> > >> fs/built-in.o: In function `.nfs_parse_ip_address':
> > >> super.c:(.text+0xe2f08): undefined reference to `.__ipv6_addr_ty=
pe'
> > >>
> > >> Some CONFIG_IPV6 protections are needed ...
> > >>
> > >> I reverted commit 09491a874d4f9a8676567bc58bce9dec9539740d ("NFS=
: handle
> > >> interface identifiers in incoming IPv6 addresses").
> > >=20
> > > I suggest something like the attached patch. Comments Chuck?
> > >=20
> > > Trond
> > >=20
> > >=20
> > >=20
> > >=20
> > > -----------------------------------------------------------------=
-------
> > >=20
> > > Subject:
> > > NFS: Don't allow IPv6 addresses if CONFIG_IPv6 isn't set
> > > From:
> > > Trond Myklebust <Trond.Myklebust@netapp.com>
> > > Date:
> > > Wed, 18 Jun 2008 16:04:22 -0400
> > >=20
> > >=20
> > > Fixes a compile failure in fs/nfs/super.c
> > >=20
> > > Also fix the compiler warnings:
> > >   fs/nfs/super.c:721: warning: field width should have type =C3=A2=
=E2=82=AC=CB=9Cint=C3=A2=E2=82=AC=E2=84=A2, but
> > >   		      argument 2 has type =C3=A2=E2=82=AC=CB=9Csize_t=C3=A2=E2=
=82=AC=E2=84=A2
> >=20
> > I just saw this warning yesterday, and was about to send a fix for =
it.=20
> > Sorry for the delay, but I had a power supply go south on me today.
> >=20
> > >   fs/nfs/super.c:809:3: warning: returning void-valued expression
> > >   fs/nfs/super.c:811:3: warning: returning void-valued expression
> >=20
> > But I've never seen that one.  Very strange how the warnings vary=20
> > depending on what platform you compile to.
> >=20
> > > Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
> > > ---
> > >=20
> > >  fs/nfs/super.c |   19 ++++++++++++++-----
> > >  1 files changed, 14 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/fs/nfs/super.c b/fs/nfs/super.c
> > > index e62820c..6a47bc3 100644
> > > --- a/fs/nfs/super.c
> > > +++ b/fs/nfs/super.c
> > > @@ -718,10 +718,10 @@ static void nfs_parse_ipv4_address(char *st=
ring, size_t str_len,
> > >  	struct sockaddr_in *sin =3D (struct sockaddr_in *)sap;
> > >  	u8 *addr =3D (u8 *)&sin->sin_addr.s_addr;
> > > =20
> > > -	dfprintk(MOUNT, "NFS: parsing IPv4 address %*s\n",
> > > -			str_len, string);
> > > -
> > >  	if (str_len <=3D INET_ADDRSTRLEN) {
> > > +		dfprintk(MOUNT, "NFS: parsing IPv4 address %*s\n",
> > > +				(int)str_len, string);
> > > +
> >=20
> > You need the same fix in nfs_parse_ipv6_address().
>=20
> There is no such printk in nfs_parse_ipv6_address().

There is such a 'dfprintk()' in that function in today's linux-next tre=
e,
with the same warning.


> > >  		sin->sin_family =3D AF_INET;
> > >  		*addr_len =3D sizeof(*sin);
> > >  		if (in4_pton(string, str_len, addr, '\0', NULL))
> > > @@ -732,6 +732,7 @@ static void nfs_parse_ipv4_address(char *stri=
ng, size_t str_len,
> > >  	*addr_len =3D 0;
> > >  }
> > > =20
> > > +#ifdef CONFIG_IPV6
> > >  static void nfs_parse_ipv6_scope_id(const char *string, const si=
ze_t str_len,
> > >  				    const char *delim,
> > >  				    struct sockaddr_in6 *sin6)
> > > @@ -787,6 +788,14 @@ static void nfs_parse_ipv6_address(char *str=
ing, size_t str_len,
> > >  	sap->sa_family =3D AF_UNSPEC;
> > >  	*addr_len =3D 0;
> > >  }
> > > +#else
> > > +static void nfs_parse_ipv6_address(char *string, size_t str_len,
> > > +				   struct sockaddr *sap, size_t *addr_len)
> > > +{
> > > +	sap->sa_family =3D AF_UNSPEC;
> > > +	*addr_len =3D 0;
> > > +}
> > > +#endif
> >=20
> > Instead of creating a separate function, you could just wrap everyt=
hing=20
> > in nfs_parse_ipv6_address() but these two lines with #ifdef CONFIG_=
IPV6=20
> > / #endif.
>=20
> Getting rid of those #ifdef eyesores inside function definitions is
> worth the extra few lines.


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-next" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
