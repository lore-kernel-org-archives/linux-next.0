From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the kvm tree
Date: Mon, 6 Aug 2018 23:55:40 +0200
Message-ID: <0423431e-bc44-91a0-ce4c-d7fc430f66ab@redhat.com>
References: <20180807073922.665e1d63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FiCqHZbcwJJYxsjUzWc98noVLcTMfClV5"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807073922.665e1d63@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FiCqHZbcwJJYxsjUzWc98noVLcTMfClV5
Content-Type: multipart/mixed; boundary="WEFXiDQc1LKZsxVhLvlXX6PnLABZ0nu7G";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?=
 <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <0423431e-bc44-91a0-ce4c-d7fc430f66ab@redhat.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the kvm tree
References: <20180807073922.665e1d63@canb.auug.org.au>
In-Reply-To: <20180807073922.665e1d63@canb.auug.org.au>

--WEFXiDQc1LKZsxVhLvlXX6PnLABZ0nu7G
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/08/2018 23:39, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   81781b6884bd ("KVM/x86: Use CC_SET()/CC_OUT in arch/x86/kvm/vmx.c")
>=20
> is missing a Signed-off-by from its committer.
>=20

Fixed at the same time as resolving the conflicts.

Paolo


--WEFXiDQc1LKZsxVhLvlXX6PnLABZ0nu7G--

--FiCqHZbcwJJYxsjUzWc98noVLcTMfClV5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAltow9wACgkQv/vSX3jH
roOhTQf/dHc75v5TGMbGiJ2HAdoZ9lwttf9sCknKzmMvzpAKkkr6jUXhuyG83cf+
PSg4LKmxg6C/az295sTMOXh8CGXSGEHLQNzbO9MN3wVqoH9F34KxyNPY44WFMqvQ
YF8C7TjIjCcAxcNI/Sk0t2C6s0ndDIJ7cqLRH9aedNv5jQxE64qtbCZ/NkknTtFv
G6Ds3Kf1WNM0/cy/CEBOzOxrcdQi9eR58oDZotmKP/O0ORqeuODvcuRBWBe45JhZ
uQqqWFGb3HzqqX0edrAJWxxaxlKWjAUUt11iD5FAMRpTe95JsyoF2B0WSPF4QtEi
h44hSymRVWd74JvBPKJgftFF5UXi2w==
=Ut1a
-----END PGP SIGNATURE-----

--FiCqHZbcwJJYxsjUzWc98noVLcTMfClV5--
