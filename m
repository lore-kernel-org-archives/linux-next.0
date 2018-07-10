From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the rdma tree
Date: Tue, 10 Jul 2018 14:05:12 +1000
Message-ID: <20180710140512.53d67d40@canb.auug.org.au>
References: <20180710113342.605e53e8@canb.auug.org.au>
        <20180710034157.GA17400@mellanox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AXPEU1Cs7but9NPo_7FPSCJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180710034157.GA17400@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

--Sig_/AXPEU1Cs7but9NPo_7FPSCJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Mon, 9 Jul 2018 21:41:57 -0600 Jason Gunthorpe <jgg@mellanox.com> wrote:
>=20
> What compiler is producing these? I got nothing from 0-day build
> service or my local gcc-7..

The x86 compiler is a v7.3.1 cross compiler hosted on PowerPC LE and
built from sources.

> They are false positives and I guess we need to put the
> uninitialized_var back that was hiding them.

Rats.  :-(

> Also curious that the powerpc compiler gets a different set..

The powerpc builds are done with:

$ gcc --version
gcc (Debian 7.3.0-21) 7.3.0

--=20
Cheers,
Stephen Rothwell

--Sig_/AXPEU1Cs7but9NPo_7FPSCJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltEMHgACgkQAVBC80lX
0GzmKAf/TQ3jI1F/1ppuDloSvl/wgPT7Nibra2HbZlIMH9o8td31xB4GGw7TcqIp
hVjnMsAL385tLSIWvztmM9qdIsmDWQAOeJus4Sdsx4vqO4DhXvA7EHa9bu3P8S4O
DsVmrQPAWF9/N1QEFEcVVZh84mBP6zgyY/hzsmbq2JahN5JWHdkz4/oixcaQhQbQ
TEG+uo+xtmHyLXE2s5pLaTsfYQ87BGCxwr+ASn+X44BcIVI4hTfoS0fTqDDIG9bT
sCciBRYE016sXuxpgQWWBGt7D1K9Db0mHs/PWcVtXBQ+2VlJXi4dcxiih3zuxzaA
aW4TEPVrNwzHxtXD+dVuQ/P0IiRHhA==
=Du4I
-----END PGP SIGNATURE-----

--Sig_/AXPEU1Cs7but9NPo_7FPSCJ--
