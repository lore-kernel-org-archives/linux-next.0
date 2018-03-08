From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rdma-fixes
 tree
Date: Thu, 8 Mar 2018 15:38:30 +0200
Message-ID: <20180308133830.GU15340@mtr-leonro.local>
References: <20180308164058.2ad5a158@canb.auug.org.au>
 <20180308060920.GQ15340@mtr-leonro.local>
 <1520515725.3126.88.camel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RtGa12sjXv8gVUZO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520515725.3126.88.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--RtGa12sjXv8gVUZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 08, 2018 at 08:28:45AM -0500, Doug Ledford wrote:
> On Thu, 2018-03-08 at 08:09 +0200, Leon Romanovsky wrote:
> > On Thu, Mar 08, 2018 at 04:40:58PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Commit
> > >
> > >   aa0de36a40f4 ("RDMA/mlx5: Fix integer overflow while resizing CQ")
> > >
> > > is missing a Signed-off-by from its author.
> >
> > Doug, something went wrong with your scripts
> >
> > In patchworks it is with SOB and lengthy commit message:
> > https://patchwork.kernel.org/patch/10264089/
> >
> > In the tree, it is cut:
> > https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/commit/?h=for-rc&id=aa0de36a40f446f5a21a7c1e677b98206e242edb
>
> I use git am -s <mboxfile> to bring the patch in, so this usually
> indicates that there was something wrong with the email and it caused
> patchworks to improperly parse it.  Sure enough, when I look in
> patchworks (https://patchwork.kernel.org/patch/10264089/, the exact link
> you listed above so I'm surprised you didn't catch this), patchworks
> parsed that separator line you put in the commit message:
> ====================================================================
> as the end of message and start of patch.  So, in patchworks, that line
> and everything after it is considered part of the patch and not part of
> the message.  So, when I download the mbox file, patchworks placed this:
>
> ---
> 2.6.12
>
> at the end of the truncated commit message, so git am would also ignore
> everything after your separator line.
>
> Anyway, I've hand edited the mbox file and I pushed a rebased version of
> my wip branch.  However, during the night Jason must have moved my
> wip/for-rc branch to the official for-rc because it's there now, so the
> only way to fix this (that I know of) in our official for-rc branch is a
> rebase :-(

It is harmless and not worth of rebase at all. Leave it as is. Thanks Doug.

>
> FWIW, be careful using those big separator lines like that.  They can
> and, as you see here, do trip up the automated tools sometimes :-(.
> Would be better to just not put a guard around the copied in stuff.

I'll do and will clean it from my next patches.

Thanks again.

>
> --
> Doug Ledford <dledford@redhat.com>
>     GPG KeyID: B826A3330E572FDD
>     Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD



--RtGa12sjXv8gVUZO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlqhPNUACgkQ5GN7iDZy
WKdLCA//e7iVwDHNgfe7HeA5CoGWQsR7W0cXjW4SHJ/wXpB2piA0QvMBbjNpD9Fi
2W986cFko5KS3pcdy2Fc684BOc1nljgZad/ybKoUAkuyQnhUKumQIR7aAQrHypgx
YT/2iD2Zr2/LnTwqWFEoAw7bWg93gWfpre86aGfhAZAGEe9Ia0mBTQjoUD3H89+G
ZiM1p7lUnh6ZLgzejRyNlPYXIzHVn1HhiYY+kIACpAdkiDHiicFglZ/ZWMOUVI0P
+xoBIcvNutuliTY7vZUm6XAYccMfkatjByQo44t301Anw4uQbpDzl2OYYZitLlab
jQ0TW3FNkqGZDzIslqzQkdj6xwKLSqZ/wqyMNkkfWkp93QbW/TSgM+SilUDmwr7n
gmYbnzg7/FkUWwXvpmrUbwPB30mAB82yoBeqR8+r5b9jaleEz5lZeRrMhYnw/NH4
qj6Er0I8YN/tdcJZZdD8xiDHPMoi0MHykL69dYQtPXWTn2cBeaNCz1yz8B3CXlB0
JhhwALEEoMRJNYir9HnqYXjjHzjSidslyJm7Me3EuIKkz+GWgpA4Y3qd7dOAtK9o
VgPSMe90dybYAeN6UGPKRcqgPy1gQGMOttfUj9ft3Ql6vowkg231cmB/wcesGdF+
MEPDyJbzaH7V54A0Pxci7bLiz8yP5DWExtw3bCSc4YWtwlsbrYM=
=6CaH
-----END PGP SIGNATURE-----

--RtGa12sjXv8gVUZO--
