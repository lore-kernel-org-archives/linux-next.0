From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb.current tree build failure
Date: Thu, 7 Aug 2008 10:56:00 +1000
Message-ID: <20080807105600.76386f62.sfr@canb.auug.org.au>
References: <20080801112021.547dfaea.sfr@canb.auug.org.au>
	<20080801061250.GB8634@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_Aug_2008_10_56_00_+1000_GkemByzpTxd+J3c3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46104 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753389AbYHGA4I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Aug 2008 20:56:08 -0400
In-Reply-To: <20080801061250.GB8634@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

--Signature=_Thu__7_Aug_2008_10_56_00_+1000_GkemByzpTxd+J3c3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 31 Jul 2008 23:12:50 -0700 Greg KH <greg@kroah.com> wrote:
>
> On Fri, Aug 01, 2008 at 11:20:21AM +1000, Stephen Rothwell wrote:
> >=20
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> >=20
> > drivers/built-in.o: In function `.usb_reset_device':
> > (.text+0x1bfeb4): undefined reference to `.usb_forced_unbind_intf'
> > drivers/built-in.o: In function `.usb_reset_device':
> > (.text+0x1c03b8): undefined reference to `.usb_rebind_intf'
> >=20
> > Caused by commit 78d9a487ee961c356e1a934d9a92eca38ffb3a70 ("USB: Force
> > unbinding of drivers lacking reset_resume or other methods").
> >=20
> > The above config has CONFIG_USB=3Dy and CONFIG_PM not set.
> >=20
> > I applied the following (probably incorrect) patch.
>=20
> Thanks, this is my fault, I applied the wrong patch from Alan (he sent
> me a later more correct version.)  Should be fixed in the tree for
> tomorrow.

This is still no fixed ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_Aug_2008_10_56_00_+1000_GkemByzpTxd+J3c3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiaSCAACgkQjjKRsyhoI8z9igCeI9HgTro4RvpNt8mjnn/E9r9T
EusAmwavWs/umaBGa5QYQ6ItadBLgkXR
=cAJW
-----END PGP SIGNATURE-----

--Signature=_Thu__7_Aug_2008_10_56_00_+1000_GkemByzpTxd+J3c3--
