From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Updated target-pending.git branches for linux-next
Date: Thu, 27 Oct 2011 02:34:05 +1100
Message-ID: <20111027023405.f4f5d5b24eb504119c59892c@canb.auug.org.au>
References: <1319436327.15576.4.camel@haakon2.linux-iscsi.org>
	<1319573050.6463.2.camel@haakon2.linux-iscsi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__27_Oct_2011_02_34_05_+1100_+huFiO8ODFD9zkbt"
Return-path: <target-devel-owner@vger.kernel.org>
In-Reply-To: <1319573050.6463.2.camel@haakon2.linux-iscsi.org>
Sender: target-devel-owner@vger.kernel.org
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-next <linux-next@vger.kernel.org>, target-devel <target-devel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__27_Oct_2011_02_34_05_+1100_+huFiO8ODFD9zkbt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

On Tue, 25 Oct 2011 13:04:10 -0700 "Nicholas A. Bellinger" <nab@linux-iscsi=
.org> wrote:
>
> On Sun, 2011-10-23 at 23:05 -0700, Nicholas A. Bellinger wrote:
> >=20
> > The target-pending.git tree is now back on kernel.org, and as before
> > the following branch is used as 'for-next' updates to existing
> > drivers/target/ code:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/nab/target-pending.git =
for-next
> >=20
> > I've also added another branch that is being used for new target modules
> > being merged in the next development cycle:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/nab/target-pending.git =
for-next-merge
> >=20
> > If you would be so kind, please go ahead and add the second entry as we=
ll
> > into your linux-next daily builds.
>=20
> Just another friendly reminder to please add the for-next-merge branch
> into Next/Trees..  Also if you would, please change the tree names to
> 'target-updates' and 'target-merge' respectively.

You said above that the for-next-merge branch is for "new target modules
being merged in the next development cycle" which I assumed to mean that
they would be intended for v3.3.  As such, I will add that branch after
v3.2-rc1 is released.  Let me know if my assumption is incorrect.

I have renamed iscsi-target to target-updates.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__27_Oct_2011_02_34_05_+1100_+huFiO8ODFD9zkbt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOqChtAAoJEECxmPOUX5FEgE0P/3h1B0/qjCkzso4vPutRWFLu
TMW1Rl2qO62X6y7RyKN+Njs82+P9qugUVCwCKAdoMDUk2brBjgYx230D/UBUUfIE
ChBJlVNJuAQ/q29Sgtolel1DF68z3r60QXPHYqWXTqXEjlZHmNIIp9zLUyZVS0tn
ox3zrKpeN76/w7MJ+rSm6fB9nvtTtw0BlMXNHkeaIK52Bgz/pgGBtrjDLqH4mpBM
KRARHz4vo0pyAJmwGTANQl4LUJ2K5OTzFFn3RX/qnfynwKdw2af073BN6jsmYKI0
vQy/eHaYXsf3Mw9rRw1DaTLGxYCo8/wyzWik10SUrQqTKvEeSs9AbyvqMNzorx9n
KGF/GiNJtqRPGkmqV2XTODlOwec2AEYhgxm5LRTxaBmhU8BpxoBLX/KmksT4hvcW
3OxSqLWzIsv9RKNv0KsD7t2vwBgX1bUT+O2hGjJIsXNdRQjMROJTiG37pYdF7xHS
VQf/0snZVYypRrAKFzQlBNFQ+rRvUOwk/ctISaVErsT4sxtRuFZwJxtqn/MnYBBB
5sNMpBI+YQjG2eseVduKIJ+b24sRGaf2ujPzMoDD3nv7PJGJccr1ee0wcXaN0zgu
f1AqE2VnJLKUXqIzGxpgb+ZlrLsxjrJvEvu4MSUOIL29yt5ztk7ev//GVn3nmI1n
5Mg3itQ8HwDEkWua18UL
=PWh+
-----END PGP SIGNATURE-----

--Signature=_Thu__27_Oct_2011_02_34_05_+1100_+huFiO8ODFD9zkbt--
