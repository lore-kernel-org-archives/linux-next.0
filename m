From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Thu, 25 Jan 2018 10:50:15 +0200
Message-ID: <20180125085015.GN1393@mtr-leonro.local>
References: <20180125182259.047e0c52@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GOdHDkIp180r3pqZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180125182259.047e0c52@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org


--GOdHDkIp180r3pqZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 25, 2018 at 06:22:59PM +1100, Stephen Rothwell wrote:
> Hi all,
>
> After merging the rdma tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: "init_rcu_head" [drivers/infiniband/ulp/srpt/ib_srpt.ko] undefined!
>
> Caused by commit
>
>   a11253142e6d ("IB/srpt: Rework multi-channel support")
>
> I have used the rdma tree from next-20180119 for today.

Hi Stephen,

Please see this patch: https://patchwork.kernel.org/patch/10181845/

Thanks

>
> --
> Cheers,
> Stephen Rothwell

--GOdHDkIp180r3pqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlppmkcACgkQ5GN7iDZy
WKc3uRAAwPCNqEgqZshnvG+Zy8RPy5rDa+N/tWB5N6W49qKz40Mvm8Lr5ZUPSJFR
+vJsTo33h6u11r4rv/VH1z4Tw02YPGJ6Yf24+DQreN7/0ATR/wtsKx654uDIIues
NuUb+fUlhH2RJkSN7q0U5fNCehjXNNPXDSHIRycEjZi0lRREzVDNKrSEP3DVTAmW
PAHPYKdi83dEn+YL/u99KYudJGVZABiXAKVzH2xMffVnWBEfWkbcAmFxjJZRSeZq
cFiv0nol9AIK2r6UBHpKRlTGZqsFcSvq48Be98l8S8jlrAV/mQg1jqrX8ZmSD2S+
RfwsMNTt/ef/d3/0n3g4QTAtPwLjK4QC5UokZJPOs5ANyqwk5fych056Iu4v3ewJ
aLXJQoQDPpM+MJgKly0f/APXm82XANfy/NAsgDeIaw5cPxuFyL9CCQceYyuM7/wu
XyJQeiYMBD1zX/Cb3T21/SHGosYyQcIcugFtIC+OMU6RyWJsoR8TqrjGB/KADbbL
QkXzElWSb78JK05aLtbmDVN7xXiJaA+qDaKlfV97zFg0fMxZwz0SzOKc1sGygWAJ
qHVSxnnYp+/OvLgaO49Z2icSTjHE6rOPVWJrbIoLDnNlwl3L10vR0s+fdo0DUPw2
2/k7v9sbpIb9v2Rpsnqw4nhDf7sDm/0lzBfEjRuBkjmaPDSVWes=
=2HBj
-----END PGP SIGNATURE-----

--GOdHDkIp180r3pqZ--
