From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Rebasing kvm/next (was Re: linux-next: manual merge of the kvm tree
 with Linus' tree)
Date: Mon, 6 Aug 2018 17:55:29 +0200
Message-ID: <af02fe54-5110-8ceb-e741-675562de8c0d@redhat.com>
References: <20180806152100.05589155@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hO5thKs5m9SJlwBzlwtTQkM3rnJt5LaKF"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806152100.05589155@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hO5thKs5m9SJlwBzlwtTQkM3rnJt5LaKF
Content-Type: multipart/mixed; boundary="LzmXr2K5HassvVHW5Dbu9DWLwhZoYLXzi";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?=
 <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <af02fe54-5110-8ceb-e741-675562de8c0d@redhat.com>
Subject: Rebasing kvm/next (was Re: linux-next: manual merge of the kvm tree
 with Linus' tree)
References: <20180806152100.05589155@canb.auug.org.au>
In-Reply-To: <20180806152100.05589155@canb.auug.org.au>

--LzmXr2K5HassvVHW5Dbu9DWLwhZoYLXzi
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/08/2018 07:21, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the kvm tree got a conflict in:
>=20
>   arch/x86/kvm/vmx.c
>=20
> between a series of commits in Linus' tree and a series of commits in
> the kvm tree.
>=20
> I have no idea how to fix all this up, so I just dropped all the change=
s
> from Linus' tree (all those commits only touched this file).  Please do=

> this merge your self or provide me (and Linus) with the necessary
> resolution.

The conflicts are indeed very nasty, so I'm going to rebase the top of
kvm/next and insert a merge from Linus's tree (4.18-rc6 to be precise).

The reason is that some changes were split between 4.18 and 4.19, and
therefore there are conflicts between bugfixes and new development.
They should have been handled by merging kvm/master into kvm/next, but
it's too late for that.

Paolo


--LzmXr2K5HassvVHW5Dbu9DWLwhZoYLXzi--

--hO5thKs5m9SJlwBzlwtTQkM3rnJt5LaKF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAltob3EACgkQv/vSX3jH
roO1gAf/aMSyoNZzfJw2SlR0wFmJ7QtxYDQLvNKrUKNoxCLLUCpFQ9Rtb0JbCGNj
cIkmxW6eGWu+VJH2397l1MNKtVvzHTe+D0W46E0/NgYURKlLjuydyqmIaNf+tQKs
tkiF+OWwsPVkQkuiOmgSvR3lyURlr7/1J3BBDIOyTNMoGW8OKE3jwAYHR8Awatpc
VCXFtGVaYMt8pM6jKYAKi3oLqSyCkjd0xxWAxHsIF10s/iptlh+UEM2+y1abcjmu
XDNos9yz4VA/DIlV4+FcUi0fRM7AZXnIngvkYclirNHoq6HA8TxcBU8xvHYt4DCp
NgT6vYUarAf8O1Nb79wpT/XwRzHf+w==
=vAny
-----END PGP SIGNATURE-----

--hO5thKs5m9SJlwBzlwtTQkM3rnJt5LaKF--
