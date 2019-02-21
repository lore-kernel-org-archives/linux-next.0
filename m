From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Thu, 21 Feb 2019 23:48:01 +1100
Message-ID: <20190221234801.7cc07a7c@canb.auug.org.au>
References: <20190221171332.262cf619@canb.auug.org.au>
        <20190221123440.GD17501@mtr-leonro.mtl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4qEQyI/Ct9cA4FzFKbxChaT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221123440.GD17501@mtr-leonro.mtl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leonro@mellanox.com>
Cc: Matthew Wilcox <willy@infradead.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/4qEQyI/Ct9cA4FzFKbxChaT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Leon,

On Thu, 21 Feb 2019 12:34:42 +0000 Leon Romanovsky <leonro@mellanox.com> wr=
ote:
>
> Matthew, really? change of API in -rc7? And it after you pushed us to
> base our -next on -rc5 after another API change? What should we do now?

The xarray API changes (to xa_alloc and __xa_alloc) have been in
linux-next for about 2 weeks ...

> Can you please ensure that you are sending your pull request to Linus,
> after RDMA pull request will be successfully merged?

It doesn't matter which goes in first, but whoever goes in last should
inform Linus about these (now 2) API change fixups.  In fact you should
probably both let him know as he sometimes batches up similar groups of
merge requests (like fs or net) and doesn't do them in the order they
are submitted.

--=20
Cheers,
Stephen Rothwell

--Sig_/4qEQyI/Ct9cA4FzFKbxChaT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxungEACgkQAVBC80lX
0Gx+qgf/WgG2af6v7Uj/9yAi77ru8hksQ908hYuaD8Ri67KkGMvzZkT2RyJpdY2U
JYAaX56sND9Pq+h+W4NgIgVbu1aSW6NcG7nITqXePw77CDleOTEkimGhMzSJKhqr
tBkkMb/+wmrPNYaJjJm6UyXgfp5jSizikcGU972bUVQO3FklHg3CHjPmkmc8jXa/
HBGdm7tIu2u7yzxtV287cSwYTSGcURtm4CoqPpXzAvvl2JE95zmu1W8yVHRra9l1
XscL2vJCD02VsND9cVxvZYIsCtFptHbwGzNOgiB1M8zGbW0OoKft+KQiT1NCuL8i
zPC/DPUwpDjucqcNdjeuSpZe8PsVbA==
=72YZ
-----END PGP SIGNATURE-----

--Sig_/4qEQyI/Ct9cA4FzFKbxChaT--
