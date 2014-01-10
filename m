From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm tree
Date: Fri, 10 Jan 2014 14:00:43 +1100
Message-ID: <20140110140043.1e090e614df48b230202ab3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__10_Jan_2014_14_00_43_+1100_GFrMiVIS9qh/SP1m"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Hemminger <stephen@networkplumber.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__10_Jan_2014_14_00_43_+1100_GFrMiVIS9qh/SP1m
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_vcpu_on_spi=
n':
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1807:4: error: implicit decla=
ration of function 'kvm_vcpu_eligible_for_directed_yield' [-Werror=3Dimplic=
it-function-declaration]
    if (!kvm_vcpu_eligible_for_directed_yield(vcpu))
    ^

Caused by commit 7940876e1330 ("kvm: make local functions static").

I have used the kvm tree from next-20140109 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__10_Jan_2014_14_00_43_+1100_GFrMiVIS9qh/SP1m
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSz2JfAAoJEMDTa8Ir7ZwVn6AP/jp6XvkSCua3h4cyT692ULzU
xm1valW1vKADwnYhEBkxqbRGwU0QRhtPHe/j6I4/S1IZajysSSpoSq2AYGwQlMoM
N3kmJ3g0wAB63ElYstFsNuOY1j10iYK8E2dfON2fV5v3RuF/3/ELo4lfAi+C1s/e
lFLQqe3WnddCBYa7B0pG5j9ziYFWbvVsUvlQWXRmevznqvog9jVcScvS/ov09PoM
f1Dmxw51ocTv7O4yf5TTP8tty5Zxcn2jLd66nWgkpw/+HWgme9Iaa29xNT4XNogS
9/CYhhwBWkAa6WCB6/qG0OSkl4mMTFS/z2ocCwR2DTHi37OTmR0ujkEz4HvFTfeY
/UwKvunhM6NzuS9ydyH8iR6rfWQenDrm/cNcBHUeRiEBs6s+H8NRXnJ15nARXxrK
i1SJWQYERi90FhYCYyQGTEzwRAaBpsUEVcCSEdA+arIe7gAJ8Myw3jHz5QKri123
MjAekUwHenM69tl5h6D21TN6oXIjVqv+9Pq9ZfOnOKXDs52QoaZ8w/T7pNw8qs5u
XaEDavi4doPkEUkJ4X45hBNZv4dAVrQ+Ex/ykN8IC5udWjlVsb2VQBPw32a39ZzA
iOg2TE0GeEa49brR8bljhs1T3zmzpJMUO6XlqBIBusCiISB+SuPsTABQoqstrBLp
A2fx5IqYe0lpydz+WUfu
=IyZI
-----END PGP SIGNATURE-----

--Signature=_Fri__10_Jan_2014_14_00_43_+1100_GFrMiVIS9qh/SP1m--
