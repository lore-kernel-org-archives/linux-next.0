From: Nico -telmich- Schottelius <nico-linux-next-xuaVFQXs+5hIG4jRRZ66WA@public.gmane.org>
Subject: Re: Updated Next/Trees, problems with nfs-git
Date: Tue, 5 Aug 2008 00:30:50 +0200
Message-ID: <20080804223050.GA4168@denkbrett.schottelius.org>
References: <20080804134444.GC4182@denkbrett.schottelius.org> <20080804150940.GF4182@denkbrett.schottelius.org> <20080804173556.GA25940@fieldses.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080804173556.GA25940-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bruce!

J. Bruce Fields [Mon, Aug 04, 2008 at 01:35:56PM -0400]:
> On Mon, Aug 04, 2008 at 05:09:40PM +0200, Nico -telmich- Schottelius wrot=
e:
> > Hello again!
> >=20
> > Found out that #linux-next should have been #nfsd-next and updated
> > the patch to match.
> >=20
> > Patch attached.
>=20
> I'm lost:
>=20
> > -nfs		git	git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git#linux-ne=
xt
> > +nfs		git	git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git#nfsd-next
>=20
> There is no branch named "nfsd-next" in that git repository.  (Do I
> misunderstand how this file is supposed to work?)  The only nfsd-next I
> know of is the one I push to at:
>=20
> 	git://linux-nfs.org/~bfields/linux.git nfsd-next

Sorry, I was somehow confused by the error reported in my original mail,
searched for something that matched my eyes and took the wrong git-tree
at http://git.linux-nfs.org/.

So it must in fact be
git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git#linux-next

Sorry for the inconvenience!

Nico

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiXgxoACgkQuL75KpiFGIxCVwCeLgOb70yLFLGoUe+GcK1VcGi3
XmwAmwdkA4wFTr/jSmrDVE89wSkjh6R9
=GGmU
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
