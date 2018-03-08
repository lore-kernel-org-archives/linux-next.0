From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rdma-fixes
 tree
Date: Thu, 8 Mar 2018 08:09:20 +0200
Message-ID: <20180308060920.GQ15340@mtr-leonro.local>
References: <20180308164058.2ad5a158@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TxukmIqg3MmZ0Kmh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180308164058.2ad5a158@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>
Cc: Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--TxukmIqg3MmZ0Kmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 08, 2018 at 04:40:58PM +1100, Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>   aa0de36a40f4 ("RDMA/mlx5: Fix integer overflow while resizing CQ")
>
> is missing a Signed-off-by from its author.

Doug, something went wrong with your scripts

In patchworks it is with SOB and lengthy commit message:
https://patchwork.kernel.org/patch/10264089/

In the tree, it is cut:
https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/commit/?h=for-rc&id=aa0de36a40f446f5a21a7c1e677b98206e242edb

Thanks

>
> --
> Cheers,
> Stephen Rothwell



--TxukmIqg3MmZ0Kmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlqg05AACgkQ5GN7iDZy
WKfRhQ/+IZU4ysCMzB/R/rFY0lxz12aVh36TMFWBkgO6zB3Hbf3RlhNYmV4v23qe
zQ+hZDPrScO9fuqLHCMNq78TKvJLdicRg6DZFzv30FTtaoy61JZ+j/b/33anPOBD
dKv7vuzTVYMUCwLlnk0tUBd2loGeGAJS/QrjE+ys8z2aNT7Vv5v+vYVIOXX9zJH7
91PzLNd486MdjpZcPl2x1Ek9DyyvWk+cH3a3XEvQrrjbAdkkvUunqj2ll5w/BpHK
qpGbQrCdn2ik439CEXrFsgvxTZJijFwWZdaJRhyq6zlv3kc1k+4L64sMeo8plzJD
IPXpKu/8gsCORKGhAC2JMQTbwTaMt1jwWMqo4lRLFRbAeGKKwqzzCMby8zpnwA4t
sbfGF+4RSfVNW9+w5c8hBEshbhwsyvnHrkQPwulnMxGQChhURQ+QakWphswXZqfv
VL4nD32Kz33P0eisLJcvbfEp5kB9+XgMhc2QgzZ4aZDMVPrpQ4apNUMCVIoy6rTw
+iqWLXcoVT/CEjk7zcVIIqobzAUlIid8nAQ0xQL+E9P5sactSetXcXAKlzr4QDjs
MR+NDvepda1vNlg1VcnaN7J+WMF9AJxT5zoUFaxur4+boGM/dY5TESM9eW65bxNM
PwtrX39BOWpG0d+FPQSr2b6lTtYjM6nmfIRnTI5V9Ia6DCWn2YQ=
=3ftX
-----END PGP SIGNATURE-----

--TxukmIqg3MmZ0Kmh--
