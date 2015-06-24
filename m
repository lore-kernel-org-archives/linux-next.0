From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the modules tree
Date: Thu, 25 Jun 2015 08:57:06 +1000
Message-ID: <20150625085706.787b7100@canb.auug.org.au>
References: <20150624113727.4f61ba18@canb.auug.org.au>
	<CALZtONAqdXeV0=Enjsw6YzuWFC-4ZqpeWfwxcEgBa+1CasqbGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n/FoYtiw_LzS9D26wdw74nZ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32977 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751239AbbFXW5P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Jun 2015 18:57:15 -0400
In-Reply-To: <CALZtONAqdXeV0=Enjsw6YzuWFC-4ZqpeWfwxcEgBa+1CasqbGA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Streetman <ddstreet@ieee.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

--Sig_/n/FoYtiw_LzS9D26wdw74nZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, 24 Jun 2015 14:18:44 -0400 Dan Streetman <ddstreet@ieee.org> wrote:
>
> On Tue, Jun 23, 2015 at 9:37 PM, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> >
> > After merging the modules tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
>=20
> that's weird.  Are you sure it failed during allmodconfig?  I can see
> why it would fail like that if CONFIG_MODULES ins't defined, which
> I'll send a patch for...

Pretty sure - and, in any case, I don't do any CONFIG_MODULES=3Dn builds
between tree merges (only later in the day).  That is why I couldn't
figure out what went wrong.

I will apply your patch today and see if that helps.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/n/FoYtiw_LzS9D26wdw74nZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVizXJAAoJEMDTa8Ir7ZwVYQoQAJR1uRqUfEZSZDGjERHnpWCg
3AaBAqVmwRCL4PnF+UPULP16QM9+GIPaRRJk0VXltBPIBddHB71lAXDCaJwE4pBJ
JF3wqsN8Rx9jmVzj5pc2o9tcX7VJsJ4il7tqwZutb/+EpcBxf82rJOkGWp0qEAY1
ZhOfa9fIbW+///3JkVUmXt4NmzXC87g/s30iAKO49YkiwhFsG5gdild/1Fr/Sof+
zUB2obdx0uwNiKxp83ojORxm/yr/HnAKuPmmqvohZU/w16Awob8Fyp+iBCFmhmiq
K+zQa9Hilqws29QColXVx7BIm3kabSv5Ahr1SYgonmWQmsK3zNUoevCAGHHdRhzs
PBJ9EYxwLiwJaqCsoOZ7VetvMdnwbpsodFpt1fhxGq+ilqrYBLUWSyW4+HA5gOse
RYdNvLsNHsLsXSTQhyL/bUulJgispdoEtOXETzvJVrg/4Y7h0RLZ0e97gzHVj/Uo
oo44t/eMO9IJhJcwRdH/5Vqz6nc8iJztvp2wIrWjrc8UPVCGO/jjDme8dBVmBIkB
vNl35JtyU9Q9KbCh7hnqvdiqGzgYgEoMNmf05mWPnmv854WU9BZMAVB0tG85Htpp
hIuX9saWNk5yHVCLj93f+83isgNTI9TDKIub75sxNyMcETrUO1yeN+0KqPKPWvuM
r0J5n1e53qTUGizDgM+x
=plcq
-----END PGP SIGNATURE-----

--Sig_/n/FoYtiw_LzS9D26wdw74nZ--
