From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 14 Jul 2017 18:10:50 +0300
Message-ID: <20170714151050.GB1528@mtr-leonro.local>
References: <20170714111437.69a6b100@canb.auug.org.au>
 <1499995033.2936.12.camel@redhat.com>
 <20170714033416.GS1528@mtr-leonro.local>
 <1500005553.2936.14.camel@redhat.com>
 <20170714045417.GU1528@mtr-leonro.local>
 <1500042834.2936.18.camel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1m5vaKDz/uWomLXd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500042834.2936.18.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Paul Moore <paul@paul-moore.com>, Parav Pandit <parav@mellanox.com>, Eli Cohen <eli@mellanox.com>
List-Id: linux-next.vger.kernel.org


--1m5vaKDz/uWomLXd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 14, 2017 at 10:33:54AM -0400, Doug Ledford wrote:
> So, you need to take your pick.  Do you want continuous development, or
> do you want me bending over backwards to try and avoid your company's
> endless stream of conflicts so Linus isn't yelling about that?

Doug,

You are mixing my warning of merge conflict in mlx4 code, which we never
prepared for shared code and whole Mellanox submissions (IPoIB, mlx5,
core, e.t.c).

To make long story short, if you can assure that public branches will be
updated in WEEKLY manner, I'll do everything internally FOR ALL RDMA
related stuff (and not mlx5 only) to avoid merge conflicts, and you will
get clean and ready apply topics exactly as DaveM receiving,

It works pretty well for rdma-core, once the discussion is stopped,
we are checking go/no-go and applying or asking to resubmit. For very
major changes, the delay is a little bit longer.

So yes, I prefer truly continuous development over unclear future.

Thanks

--1m5vaKDz/uWomLXd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAllo3voACgkQ5GN7iDZy
WKdclA//T5oQfs+D3Y3qVH5dNaJQPLdA5A3D7LYYMjFh4XsfAAofd6yKLLNW+l9G
zshV0c8umhkOXYYvbqpP6QpePL2zZ3RLE4cuUHVP3fUveACmBSwMhmpX+1YoXz3R
EQOAtAUmBI/DOOvLhio4LT2FkJ0kvTX6lPbtTax8kFGw1QjlE2EWs3ye7jOR/DQ+
yq3TfWUtdl3OjDsGWUUU2/TMnncBRsD1Ja9MurwLJduR94pjKgdKmD4rIjeUjFyB
K1H16QPlW2umhWRzStmYL8wjPjDZ5iS2QMf3HTn4wg4YAjiElaUAWkt6+QYf6CEH
lvPtxkle4OZHYzza3xTU1DKUz0e+ZYvEQY4ppjOkV9Sp8YD7dVtwqOxGpB1+q/is
ghl9imq6an3jnp9JEVX43QwNAdgyc3bR5f2N8XXyxRaZ3C6MCj/45c0U7gDQfA2b
hUib8r9Rx1TEplyJnxWaoLAAfqR7ViSZfG9fuDLebAyqvef3h/b2TxqvjT4axXFO
UqbGiMRSF9l262N28tndBekhk+SgZWSL9YbAAax2AhbZLLnxP2yjsxEFOkeu7sWC
HqfMNkXEkfe4JxRfm5Vr9WDrXZBoLR35f0RG3FU8/4yhZ5TM9eZbFZJ/OZF34+zk
nYDY7cIFUPuxdgK599XtKq6MULXatCUVjefQ/n3DqxOuZXtnW/Q=
=KOAX
-----END PGP SIGNATURE-----

--1m5vaKDz/uWomLXd--
