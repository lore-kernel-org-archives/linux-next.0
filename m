From: Eric Anholt <eric@anholt.net>
Subject: Re: linux-next: error when fetching the bcm2835 tree
Date: Tue, 04 Sep 2018 10:41:22 -0700
Message-ID: <87wos1gny5.fsf@anholt.net>
References: <20180828074200.440fb5ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828074200.440fb5ca@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> [ Unknown signature status ]
> Hi Eric,
>
> Fetching the bcm2835 tree (git://github.com/anholt/linux.git#for-next)
> produces this error:
>
> fatal: Couldn't find remote ref refs/heads/for-next

I'd passed responsibility for the git tree off to Stefan while I'm
mostly-unavailable due to new baby.  Maybe Stefan had deleted the branch
for a bit?

Stefan -- the for-next branch is what linux-next pulls in, and I was
regenerating it whenever I pushed -next branches.  You can find one set
of scripts for helping generate a for-next branch at
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/maint-scripts.git

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAluOw8IACgkQtdYpNtH8
nuifUA/+KUqbSmr1eyohjjAxRZeeNQwscCYbHxCGp2g2oplwt+73/zTEEHyf7Z8b
+UgcHhCbjh8jakNJe3jRPRbjgAH6Xq8gomq9Ow3TYoeAxm6JVNEtxWm10kSPAYle
l29E2GG7iKM529TGYsOVG2AgDFm8GnSrh4JfgP1cfXGuAu03W3Li3vmQuJPVKmGq
1knwZRYhSbFdOUA7d9H4/6xxuopTKM2iO3JZea12kfJTNK91KTWRbLyzIGjzeHSk
INNWlIb0HISDDNUdt7OH72tlTGIDtUxYrM1+T5kcoZH3lsPeYCFR/0EsINwiLDTO
it/7vnDJNsZ/krsHdAr9BugFyx4Q1oFFViJPwLgmr6bFAq9qoTs3jGllZCQ5CwZk
bBkJ/iOyFMc9Jj4y8j8SL98hvjZjYXD9aBvx5um9SQH44GmKCFf6FNBdl5VgV7x5
ZP7YOlW0+V+Y51/1K6gEHSuw9xOhe686mYpbRtymzMoRYBIux/Q+wxddGSuNNt1z
iy9Pw5BVb7nUtLypxBOIg4pyTuU/gauBV/YqNOlW+vd0HLM9556WN0c9PdAFC0ib
GRebzpmBExj2rt/V1RFV/6OnHk+uUCLfE47puD91y787iIi6SoQf9YQvHKxofrhV
gXcLWVE9lBfn/fDL/l35xPW+zs5IxuJ8lJcueZQ9bHgFOkG92QM=
=8Gz9
-----END PGP SIGNATURE-----
--=-=-=--
