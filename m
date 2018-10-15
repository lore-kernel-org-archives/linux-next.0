From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: qemu boot failures with today's linux-next
Date: Mon, 15 Oct 2018 19:20:53 +1100
Message-ID: <20181015192053.12642c96@canb.auug.org.au>
References: <20181015191859.2f600de5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Vu.At.mRm/vQ+CfwE8pWC90"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181015191859.2f600de5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Vu.At.mRm/vQ+CfwE8pWC90
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Oct 2018 19:18:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next tree does not boot in qemu (with kvm or without).
> Here is the (non-kvm) boot log (the kvm one is basically the same):

I should have said that the kernel build is pseries_le_defconfig.

--=20
Cheers,
Stephen Rothwell

--Sig_/Vu.At.mRm/vQ+CfwE8pWC90
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvETeUACgkQAVBC80lX
0GyihAf/T7TG1Jkgu7LYC1xKwuMumSd1BdFvzsE048n6nd/deH1zDnOMS4sEhSHb
XXZEcwtzpYw0QDZnT4VMHsG1nTLOxsfOrZeBxUCF64EN/0Y6yMI5m06sOyl7pb4b
svkshYhvct6YHrocIRIj6fJWQ9diYsAz6IHX6ou17asO9DjKWMU7L9O6S3DF/qVF
QLcQ6rS0J4ksYQtp47UNxfTPpEx2wR1+oG3rjeILwzQYMYxZH7zyZbukPTOBAwRI
Sr+HL16/1wqFs8KiIW7SAqKJNS1KiWIuMOc2AYyc9UU0Bjyr8QknYeCfHCcz1FqA
KwvRdPR02QqxuvFrTbmgq1qpW8LoJg==
=R3Xk
-----END PGP SIGNATURE-----

--Sig_/Vu.At.mRm/vQ+CfwE8pWC90--
