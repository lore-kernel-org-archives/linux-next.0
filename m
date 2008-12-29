From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Pull request for FS-Cache, including NFS patches
Date: Mon, 29 Dec 2008 16:26:18 +1100
Message-ID: <20081229162618.e2fea7a9.sfr@canb.auug.org.au>
References: <8930.1229560221@redhat.com> <20081218142420.GA16728@infradead.org>
	<20081218123601.11810b7f.akpm@linux-foundation.org>
	<200812190007.34581.bernd.schubert@fastmail.fm>
	<20081218152616.a24c013f.akpm@linux-foundation.org>
	<20081219110539.7e7e230c.sfr@canb.auug.org.au>
	<20081229144533.4a0ab696.sfr@canb.auug.org.au>
	<20081228200726.7b7078b4.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0965650124=="
Return-path: <nfsv4-bounces@linux-nfs.org>
In-Reply-To: <20081228200726.7b7078b4.akpm@linux-foundation.org>
List-Unsubscribe: <http://linux-nfs.org/cgi-bin/mailman/listinfo/nfsv4>,
	<mailto:nfsv4-request@linux-nfs.org?subject=unsubscribe>
List-Archive: <http://linux-nfs.org/pipermail/nfsv4>
List-Post: <mailto:nfsv4@linux-nfs.org>
List-Help: <mailto:nfsv4-request@linux-nfs.org?subject=help>
List-Subscribe: <http://linux-nfs.org/cgi-bin/mailman/listinfo/nfsv4>,
	<mailto:nfsv4-request@linux-nfs.org?subject=subscribe>
Mime-version: 1.0
Sender: nfsv4-bounces@linux-nfs.org
Errors-To: nfsv4-bounces@linux-nfs.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bernd Schubert <bernd.schubert@fastmail.fm>, nfsv4@linux-nfs.org, steved@redhat.com, linux-kernel@vger.kernel.org, dhowells@redhat.com, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, rwheeler@redhat.com
List-Id: linux-next.vger.kernel.org

--===============0965650124==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_16_26_18_+1100_iXRUVF.IBG7THewh"

--Signature=_Mon__29_Dec_2008_16_26_18_+1100_iXRUVF.IBG7THewh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew, Trond,

On Sun, 28 Dec 2008 20:07:26 -0800 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> And that of course means that many many 2.6.28 patches which I am
> maintaining will need significant rework to apply on top of linux-next,
> and then they won't apply to mainline.  Or that linux-next will not apply
> on top of those patches.  Mainly memory management.
>=20
> Please drop the NFS tree until after -rc1.

OK, it is dropped for now (including today's tree).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_16_26_18_+1100_iXRUVF.IBG7THewh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYX3oACgkQjjKRsyhoI8x2FgCguLyWN0574cD4ck4JmUOp5yF1
DFoAn0lyhgYZEN6ScB+hVnHaT5xu/8/z
=bgHt
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_16_26_18_+1100_iXRUVF.IBG7THewh--

--===============0965650124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
NFSv4 mailing list
NFSv4@linux-nfs.org
http://linux-nfs.org/cgi-bin/mailman/listinfo/nfsv4
--===============0965650124==--
