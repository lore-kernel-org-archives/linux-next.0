From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kselftest tree with the kvm tree
Date: Thu, 18 Oct 2018 12:51:38 +0200
Message-ID: <2e7090d2-5c80-7fcf-6e50-7155280b998a@redhat.com>
References: <20181018155030.1d75c506@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XLS7OL1X6RJ73iZ22Fo0PjMCsVWsqGLfb"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018155030.1d75c506@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuah@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrea Parri <andrea.parri@amarulasolutions.com>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XLS7OL1X6RJ73iZ22Fo0PjMCsVWsqGLfb
Content-Type: multipart/mixed; boundary="6V6fxYqBQo5zLsuy2gbyedycmZCShSo7p";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuah@kernel.org>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrea Parri <andrea.parri@amarulasolutions.com>
Message-ID: <2e7090d2-5c80-7fcf-6e50-7155280b998a@redhat.com>
Subject: Re: linux-next: manual merge of the kselftest tree with the kvm tree
References: <20181018155030.1d75c506@canb.auug.org.au>
In-Reply-To: <20181018155030.1d75c506@canb.auug.org.au>

--6V6fxYqBQo5zLsuy2gbyedycmZCShSo7p
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 18/10/2018 06:50, Stephen Rothwell wrote:
> Hi Shuah,
>=20
> Today's linux-next merge of the kselftest tree got a conflict in:
>=20
>   tools/testing/selftests/kvm/dirty_log_test.c
>=20
> between commit:
>=20
>   fff8dcd7b4a2 ("kvm: selftests: port dirty_log_test to aarch64")
>=20
> from the kvm tree and commit:
>=20
>   cda94d9ffa0e ("selftests: kvm: Fix -Wformat warnings")
>=20
> from the kselftest tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tre=
e
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularl=
y
> complex conflicts.
>=20


Shuah, I think it's best if in the future the
tools/testing/selftests/kvm/ changes go through my tree, unless they
affect many selftests subdirectories.

Thanks,

Paolo


--6V6fxYqBQo5zLsuy2gbyedycmZCShSo7p--

--XLS7OL1X6RJ73iZ22Fo0PjMCsVWsqGLfb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAlvIZboACgkQv/vSX3jH
roPSpQgAmWoQwg/mIwT6qaFKxL2VFB3OrtM2ZH8kgMQGBwrLH7NTfgYBD8LCiDGT
fGdxXjN6Lxb7eLSoF89mtTUzsf1fP2/ERnzHM5DFUXvD1A2HAFacSaCGLAotvs0T
IMoHnffRJ196zrqdZ/DAcaGfrU/ZWG9zv0zC5z6ooQnUv5v3z10hjppmnZiMUppt
oR2up3J1GQy2uBqsq1/EagF5/1ClVFJTj5JIWvvnpC8E/lZUFL2By+Xbzqj0EIHm
sr6hgA10apPTPIiYqm0SJ+l6DdT+8UJdXPqT3t/E3cafmTXh7cPDN1XTl22GXMNT
Xl70KgyZnEi/MUOMErzBFVcVtMTXJg==
=dnRN
-----END PGP SIGNATURE-----

--XLS7OL1X6RJ73iZ22Fo0PjMCsVWsqGLfb--
