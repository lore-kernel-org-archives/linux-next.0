From: Paolo Bonzini <pbonzini@redhat.com>
Subject: semantic conflict between tip and kvm (was Re: linux-next:
 Signed-off-by missing for commit in the kvm tree)
Date: Tue, 7 Aug 2018 15:09:25 +0200
Message-ID: <8939315c-f509-ad12-3484-4650c7f3b351@redhat.com>
References: <20180807073922.665e1d63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="91gCpN5DVlRuaBBbJ1VsyYqfUmbAzZOaf"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807073922.665e1d63@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--91gCpN5DVlRuaBBbJ1VsyYqfUmbAzZOaf
Content-Type: multipart/mixed; boundary="gH6TBERMb1gtR7mLPYF2VUfk3UqhaVoX5";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?=
 <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <8939315c-f509-ad12-3484-4650c7f3b351@redhat.com>
Subject: semantic conflict between tip and kvm (was Re: linux-next:
 Signed-off-by missing for commit in the kvm tree)
References: <20180807073922.665e1d63@canb.auug.org.au>
In-Reply-To: <20180807073922.665e1d63@canb.auug.org.au>

--gH6TBERMb1gtR7mLPYF2VUfk3UqhaVoX5
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

Stephen,

there is a semantic conflict between tip and kvm:

const __initconst struct hypervisor_x86 x86_hyper_kvm =3D {
	.name			=3D "KVM",
	.detect			=3D kvm_detect,
	.type			=3D X86_HYPER_KVM,
	.init.init_platform	=3D kvmclock_init,
	.init.guest_late_init	=3D kvm_guest_init,
	.init.x2apic_available	=3D kvm_para_available,
	.init.init_platform	=3D kvm_init_platform,
};

Note that .init.init_platform is initialized twice.

The right fix is to keep the kvm version, and add a kvmclock_init() call
to kvm_init_platform.

Thanks,

Paolo


--gH6TBERMb1gtR7mLPYF2VUfk3UqhaVoX5--

--91gCpN5DVlRuaBBbJ1VsyYqfUmbAzZOaf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAltpmgUACgkQv/vSX3jH
roPZkgf/WSDhT/epJdVQN7IDI2ERn4xIMqxdyqA1Y83Twpiz/WrsmFIa24SNTsJt
DTxN1oWINvMi55CLv1BNRlj1uby0EMHwZm59yKvZfm3KhaIgmE+KNtytvaZTErYH
n8qUcYMhwmDS4lIbrjXsgMUvU2+LjVd/AYC95uEavVdg5la5wk13Hc3Y2KUB1p5f
Xrw+12h+4A2n4ciTHXx6YZgMNKWAKRS1fnnAMAJh7nAUXmC7NBO7gpRRT+oJRE75
DrGin8zE7WWv35lIdwoc483WeQP4epztRs16+WLaKuEgQqgu1G3D+l56A4vKQA+1
jptE2eigJgtZbkV7pK0CvgCeKbYo4Q==
=XwHs
-----END PGP SIGNATURE-----

--91gCpN5DVlRuaBBbJ1VsyYqfUmbAzZOaf--
