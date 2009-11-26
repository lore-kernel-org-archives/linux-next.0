From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs/nfsd trees fetch failed
Date: Fri, 27 Nov 2009 08:39:36 +1100
Message-ID: <20091127083936.b9c125c6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Nov_2009_08_39_36_+1100_TcCL.aUiKDw+c4Np"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752941AbZKZVji@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trond.myklebust@fys.uio.no>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__27_Nov_2009_08_39_36_+1100_TcCL.aUiKDw+c4Np
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next fetch of the nfs and nfsd trees produced this error:

git.linux-nfs.org[0: 141.212.112.37]: errno=3DConnection timed out
fatal: unable to connect a socket (Connection timed out)

This also happened yesterday.

I will use the version of these trees from next-20091125 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Nov_2009_08_39_36_+1100_TcCL.aUiKDw+c4Np
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksO9ZgACgkQjjKRsyhoI8yHeACgjojx17oEV7MovMH6SjqlXrnW
vf4AnR3rY/JtOq7CutyiHXkkdoqJbIpz
=LFo6
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Nov_2009_08_39_36_+1100_TcCL.aUiKDw+c4Np--
