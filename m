From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [v9fs] Pull request for linux-next
Date: Thu, 19 Jul 2018 00:04:20 +1000
Message-ID: <20180719000420.537d0290@canb.auug.org.au>
References: <20180718062920.GA7302@nautica>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/P6Jf1csb1wfrjc.A8nycrxN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718062920.GA7302@nautica>
Sender: linux-kernel-owner@vger.kernel.org
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, v9fs-developer@lists.sourceforge.net, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/P6Jf1csb1wfrjc.A8nycrxN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dominique,

On Wed, 18 Jul 2018 08:29:20 +0200 Dominique Martinet <asmadeus@codewreck.o=
rg> wrote:
>
> I'd like to request that you add the following tree to linux-next:
>=20
>   git://github.com/martinetd/linux 9p-next
>=20
> 9p has seen some renewal of interest recently and I'd like to help take
> a bit of the burden off Andrew, who suggested getting this included in
> linux-next here[1].
>=20
> This branch contains 9p filesystem & network patches that I have
> gathered recently after they have been reviewed, and will keep pushing
> patches there.
>=20
>=20
> I've tried to respect the rules I've found, but please tell me if I
> missed anything:
>  - all patches have the author's Signed-off-by tag,
>  - been posted to the v9fs and linux-kernel lists,
>  - have been reviewed,
>  - have been tested (*cough* a bit, I need to improve the process),
>  - and are destined to the 4.19 merge window
>=20
>=20
> [1] https://sourceforge.net/p/v9fs/mailman/message/36370423/

All looks good to me. Added from (later) today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/P6Jf1csb1wfrjc.A8nycrxN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltPSOQACgkQAVBC80lX
0GzqqQf8CkiIwMUAOopeK+yJvl0XW0HlvBrqk0rEIpDIlH2JrExqYKbHaD5kr1yo
mIigZ9BScNG0aRMw4zj6epFfnilCZaecShmtcBDvbTEja76yp48fVzUEnjlmzvQS
fKwOywCwts7/VKaH6XeH3Lzh2Gvuq6Xbb+8XJd+/4M3A2UGN/kIMIpna2+rl85nu
k1eTKfvrA1o0P2E87ee1htUoFKJE6FwJukfpXZU+7NDl0li1lmcw0VbrL+hIc4XG
KSYYb3CCWXvQgDtN4jHX8Mh8IJAr89nDAjeHi+T98sJVyRDCoRmB21ELQM9VM/nh
t1Q9uiQvw1ETJQ+SRXWAyWDt4l23Hw==
=KgqM
-----END PGP SIGNATURE-----

--Sig_/P6Jf1csb1wfrjc.A8nycrxN--
