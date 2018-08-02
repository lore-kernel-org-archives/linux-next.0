From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the kvm-arm
 tree
Date: Thu, 2 Aug 2018 15:18:57 +0200
Message-ID: <632a8205-4344-3f6d-9216-ea623a32392a@redhat.com>
References: <20180731142339.19b52ce0@canb.auug.org.au>
 <20180802111916.7435c0ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0Z64aBdyrr0ml6Pv42NtSeHVWocHBrj9j"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802111916.7435c0ac@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Dongjiu Geng <gengdongjiu@huawei.com>, Janosch Frank <frankja@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0Z64aBdyrr0ml6Pv42NtSeHVWocHBrj9j
Content-Type: multipart/mixed; boundary="lYqxN6va8umhfdnZStraIvC2g8M3shP7Y";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Christoffer Dall <cdall@cs.columbia.edu>,
 Marc Zyngier <marc.zyngier@arm.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM <kvm@vger.kernel.org>, Dongjiu Geng <gengdongjiu@huawei.com>,
 Janosch Frank <frankja@linux.ibm.com>
Message-ID: <632a8205-4344-3f6d-9216-ea623a32392a@redhat.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the kvm-arm
 tree
References: <20180731142339.19b52ce0@canb.auug.org.au>
 <20180802111916.7435c0ac@canb.auug.org.au>
In-Reply-To: <20180802111916.7435c0ac@canb.auug.org.au>

--lYqxN6va8umhfdnZStraIvC2g8M3shP7Y
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02/08/2018 03:19, Stephen Rothwell wrote:
>>  -#define KVM_CAP_S390_HPAGE_1M 156
>>  +#define KVM_CAP_ARM_INJECT_SERROR_ESR 156
>> ++#define KVM_CAP_S390_HPAGE_1M 157
>>  =20
>>   #ifdef KVM_CAP_IRQ_ROUTING
>>  =20
> This is now a conflict between the s390 and kvm-arm trees.

This will shortly move to the KVM tree.  The ARM capability will have to
be bumped again since x86 "won" number 157.

Thanks,

Paolo


--lYqxN6va8umhfdnZStraIvC2g8M3shP7Y--

--0Z64aBdyrr0ml6Pv42NtSeHVWocHBrj9j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAltjBMEACgkQv/vSX3jH
roP7Vgf+IBRqk3arxbU3ofr+qITSFzxxnJpC7y3+Jl19lJxfL3HOdKzyZuGyQg7T
6U/7zvQCUHCEvt4k7hmTbWpaHL1dV5o53Y88JetSz9UECTOuQwLwDoaBAPtCwYh1
aQyzLAj/FPTeLnrJ737W1edNGM95H5huPZO6VroPG7peJE0vb1Os2s32qlUiTDsB
h8s2hl6hW71rtkCl36pGZmuaHa/fQirFHhufuUXJaIuF4WZEh1O2Uu2hk/Epp/XC
JVyt6O4Fto329RHqwH+CE0Bw0wDrIiifX7yq2nBSeSdqnV4k1A9kDaKDVRSgyJA/
9aJI8nfp1Wqrp7NGDLuWGQ4KrgSEhA==
=U5X5
-----END PGP SIGNATURE-----

--0Z64aBdyrr0ml6Pv42NtSeHVWocHBrj9j--
