From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Fri, 17 Aug 2018 10:32:55 +0200
Message-ID: <84803922-9430-43d2-7db6-e9c0dd02da6a@redhat.com>
References: <20180723144641.62b2b226@canb.auug.org.au>
 <20180816101515.24d0b49f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="va2T1wBdwSrHwBAFRTvzJAFCnG1iHKtTA"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180816101515.24d0b49f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--va2T1wBdwSrHwBAFRTvzJAFCnG1iHKtTA
Content-Type: multipart/mixed; boundary="KOIs3meSzZMIIu5yUSGuMz8FTgbRswz2o";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?=
 <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Message-ID: <84803922-9430-43d2-7db6-e9c0dd02da6a@redhat.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
References: <20180723144641.62b2b226@canb.auug.org.au>
 <20180816101515.24d0b49f@canb.auug.org.au>
In-Reply-To: <20180816101515.24d0b49f@canb.auug.org.au>

--KOIs3meSzZMIIu5yUSGuMz8FTgbRswz2o
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 16/08/2018 02:15, Stephen Rothwell wrote:
>>  -#define ARM64_HAS_STAGE2_FWB			31
>>  +#define ARM64_MISMATCHED_CACHE_TYPE		31
>> ++#define ARM64_HAS_STAGE2_FWB			32
>>  =20
>> --#define ARM64_NCAPS				32
>> ++#define ARM64_NCAPS				33
>>  =20
>>   #endif /* __ASM_CPUCAPS_H */
> This is now a conflict between Linus' tree and the kvm-arm tree (and
> presumably soon the kvm tree).

This should have been sorted out using topic branches.  I'll handle it
myself by splitting the pull request in two, but please try to organize
better the changes in non-KVM-specific arch/arm and arch/arm64 files.

Thanks,

Paolo


--KOIs3meSzZMIIu5yUSGuMz8FTgbRswz2o--

--va2T1wBdwSrHwBAFRTvzJAFCnG1iHKtTA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAlt2iDgACgkQv/vSX3jH
roNupQgAgcVLFG86iqscCth8pKx1/84CtidFnLAGyAmjkm2CUVE1TFrgwp8zEWv0
C5QeF3L80L2f8FuPk8SLxhfCXhXVqI8ji4mya7T0kiu6bJnz9s7S3L01of9knSdl
KgWNB7cTQaZVCK9gQbM/KnNwCcNwwpdSmEB4x7GVLyDCPWhu7BnPo7+KyDRDg9fw
CJA3go5liyKm6N1+vPjFPLAhlc24St9y+XYBjs43pFR1zeJYeK2Hqz1eShOk1sBL
0EpRgOg7SduZwwE8RWLi0kXdIGXeBWHmsGGyV3P0x8IwZdfRW/NgXQGK25ABNlf/
cC7uJ3UUrlEIAbXo43UoIn64IMB/6w==
=Z//r
-----END PGP SIGNATURE-----

--va2T1wBdwSrHwBAFRTvzJAFCnG1iHKtTA--
