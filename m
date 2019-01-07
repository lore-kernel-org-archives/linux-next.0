From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the csky tree with Linus' tree
Date: Mon, 7 Jan 2019 21:30:12 +1100
Message-ID: <20190107213012.5c20154a@canb.auug.org.au>
References: <20190107102727.0c67e3d7@canb.auug.org.au>
        <20190107065344.GA11989@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VZMUNJFKtfIf3MqQHBArbg0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107065344.GA11989@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Guo Ren <ren_guo@c-sky.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/VZMUNJFKtfIf3MqQHBArbg0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Mon, 7 Jan 2019 07:53:44 +0100 Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jan 07, 2019 at 10:27:27AM +1100, Stephen Rothwell wrote:
> > You want to add "select ARCH_NO_SG_CHAIN" to your Kconfig somewhere
> > (see the commit from Linus' tree above). =20
>=20
> No, csky should not select it.  There is no code directly poking
> into scatterlists internals in csky, so it can safely enable chained
> sglists.

Thanks, good to know.

--=20
Cheers,
Stephen Rothwell

--Sig_/VZMUNJFKtfIf3MqQHBArbg0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwzKjQACgkQAVBC80lX
0GzLFQf/VfwgGcXlHVXFXnPjXNf6YrY9PhU0wEirAgPN6IIXPRKRGGM9BzjgNagX
3YHtzcn6jvDQvbNJmp+VLXeFOFPTB5HW99CI2dL+N+0MQ6FJ1hw78owjr2yZHmsI
4mL4Fja5EC/wxQ4DZbwcT9kiyJGcjnw0nloq0c6iaAdqus8zihRwPrGx5DeFLJIP
5+EaC82H0VTn0FzTXB3ZLfFH/9uAapUezt9tRXQX7K38EASC/55go5w4gDprV77Q
NjU8fDZX1fXGM0hhx1Mt8JN1p+D5JrTk/1TrW5JNwnvcvfRXiUffRNW5hzG++ljC
kRx3XcKKXbgfkwbLDimM5q9T1zABUg==
=OvRC
-----END PGP SIGNATURE-----

--Sig_/VZMUNJFKtfIf3MqQHBArbg0--
