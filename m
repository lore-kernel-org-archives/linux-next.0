From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the kvm tree
Date: Tue, 5 Aug 2014 20:13:42 +1000
Message-ID: <20140805201342.6b8a8ca4@canb.auug.org.au>
References: <20140804180403.3cfdbadf@canb.auug.org.au>
	<53E0AB44.90804@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sTE27_DkLfDeTpDWjOR5fnE"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53E0AB44.90804@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Alexander Graf <agraf@suse.de>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>
List-Id: linux-next.vger.kernel.org

--Sig_/sTE27_DkLfDeTpDWjOR5fnE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

On Tue, 5 Aug 2014 11:00:36 +0100 James Hogan <james.hogan@imgtec.com> wrot=
e:
>
> On 04/08/14 09:04, Stephen Rothwell wrote:
> >  +  PPC   | KVM_REG_PPC_LPCR              | 64
>=20
> I think due to a0840240c0c6 this one should be s/64/32/.
>=20
> > ++  PPC   | KVM_REG_PPC_LPCR_64		| 64
>=20
> And I suppose it'd be nice to replace tabs with spaces for consistency
> (since that's one of the things bf5590f37919 did).
>=20
> How about this fixup patch?

Thanks for that I have applied it to my merge resolution.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/sTE27_DkLfDeTpDWjOR5fnE
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJT4K5dAAoJEMDTa8Ir7ZwVwx4P/2VxXEST6HuqukNrivTOjBKc
Vw0606IKPRmgC3/dK0UM2ZYkTT8cUjNpgqNZCejh7CyYGZdsAN5BmCEx24DKt/tp
m53FVuoKxglQEcd2fbCRyGmgA5A1rKD5hAO5ObXPuS9I4TqLO0NDSxIu0l/F7bzx
mdezvu/yLVB8yJ8Zv0tfa/Sy1U0sjKm2y7Fa9IjzjXRX9R0sX1/y1ESkB3YfUSTE
1S9A4/Lcq1Pd3a1LiXtCGLL6tEPlzScbnPfcVlkUdQRcd4ZvJzskrLazflXzNdLY
5lupqlQOsYtO+ur9pJuQVZ3oOMf73uDtBcttT4xDUAqeq6KTHJIZnDucDXXmlu1p
Kp9nKEvaSRiIQwk5Nti+OywyC/eMjN4Sg8Dyy+5/PQ3sE0iIEmyEuO6e7CLRjxd+
btmdzI43E6z3VFOaKhmRYwP41/w7l7O7EBO1lA5EpV8iDDkLmHBy61a85JyPiyL1
7MyMDwtf2ovktSS2gzvKrtZKPL+RoUAdlmHuH3f1HvsTynW8fb1OBsjKpZHfe40M
lQKgABJz7s/t0c/iSDbJHJPlzRGjTuUR5NJbplVeYqtofH3Nik5uSX/bHrpuUb7i
IStOHzyCU+6047Wc2wshC7slHH27Xa9IGYMI1rut3M32INZKkrwelhT47D4613Uf
HcGMneMJAzxq1Ubad5R3
=CoS1
-----END PGP SIGNATURE-----

--Sig_/sTE27_DkLfDeTpDWjOR5fnE--
