From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for June 22
Date: Tue, 23 Jun 2009 11:48:20 +1000
Message-ID: <20090623114820.991120dc.sfr@canb.auug.org.au>
References: <20090622181920.496d160e.sfr@canb.auug.org.au>
	<20090622182600.129da88e.sfr@canb.auug.org.au>
	<4A3FBE13.9050201@leemhuis.info>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Jun_2009_11_48_20_+1000_LmMFCOcKVBdwRgI/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45525 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751464AbZFWBs1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Jun 2009 21:48:27 -0400
In-Reply-To: <4A3FBE13.9050201@leemhuis.info>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thorsten Leemhuis <fedora@leemhuis.info>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__23_Jun_2009_11_48_20_+1000_LmMFCOcKVBdwRgI/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Mon, 22 Jun 2009 19:23:31 +0200 Thorsten Leemhuis <fedora@leemhuis.info>=
 wrote:
>
> On 22.06.2009 10:26, Stephen Rothwell wrote:
> > On Mon, 22 Jun 2009 18:19:20 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> >>
> >> Changes since 20090619:
> >=20
> > The current "git diff --stat -M stable..HEAD^" ends like this:
>=20
> Side note: above command doesn't work here (Fedora 11, git version 1.6.2.=
2):
>=20
> $ git diff --stat -M 'stable..HEAD^'
> fatal: ambiguous argument 'stable..HEAD^': unknown revision or path not
> in the working tree.
> Use '--' to separate paths from revisions
>=20
> This command OTOH...
> $ git diff --stat -M 'origin/stable..origin/HEAD^'
> ...seems to work just fine and gives the result your posted:

That is because the "stable" and "HEAD" refs (branches) are local for me
since linux-next is my tree.  They are remote for you since you fetched
them, so their names are different.

> Is it possible somehow to export the individual patches that are
> currently in linux-next? I tried
>=20
>  git format-patch -M -o ../tmp 'origin/stable..origin/HEAD^'
>=20
> but that resulted in 3269 files with commits/patches that sum up to
> 38 MByte. Some of those patches (seems 1919 alone from the KVM tree...)
> are quite old. The first one for example is
> 0001-KVM-mmu-add-missing-dirty-page-tracking-cases.patch :

The kvm tree is actually a bit of a pain and I am considering what to do
about it.  The tree I am currently fetching into linux-next contains all
the history of their development (at least back a considerable time).
When they decide to send things to Linus, they seem to rebase a subset of
their current patches onto another branch that is based on Linus' tree
and then ask him to pull that.  So the commits in Linus' tree never have
the same SAH1s as the ones in the linux-next tree and in many cases, they
don't even have the same patch-ids as they have been rebased.

You can extract the commits in each tree by using the SHA1s in the
Next/SHA1s file.  So, for example, in yesterday's tree the SHA1 for the
net tree was 6be832529a8129c9d90a1d3a78c5d503a710b6fc, so the commits are
origin/stable..6be832529a8129c9d90a1d3a78c5d503a710b6fc.  This doesn't
work for the kvm tree (see above).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Jun_2009_11_48_20_+1000_LmMFCOcKVBdwRgI/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpANGQACgkQjjKRsyhoI8wJPACgpxv9NFmm1F/p77Dn9pRRWxD9
+7YAoK6aqIcYHkSvcfFmucBpQBTIgBP3
=jPi/
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Jun_2009_11_48_20_+1000_LmMFCOcKVBdwRgI/--
