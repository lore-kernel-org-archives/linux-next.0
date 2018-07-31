From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Tue, 31 Jul 2018 21:27:25 +1000
Message-ID: <20180731212725.5523d5dd@canb.auug.org.au>
References: <20180727190207.7ce1c9b0@canb.auug.org.au>
        <20180727190647.3525f5f7@canb.auug.org.au>
        <20180727205511.7c0f2e62@canb.auug.org.au>
        <20180727125522.GA6173@arm.com>
        <20180730173356.694fbf4e@canb.auug.org.au>
        <20180731100918.GC23281@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/h_Pcn/AX+rHq_Hoij_BAYX8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180731100918.GC23281@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Kees Cook <keescook@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>, Catalin Marinas <catalin.marinas@arm.com>, Laura Abbott <labbott@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/h_Pcn/AX+rHq_Hoij_BAYX8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Tue, 31 Jul 2018 11:09:18 +0100 Will Deacon <will.deacon@arm.com> wrote:
>
> I've pushed out Laura's fix to the arm64 for-next/core branch, so this
> should be resolved in the next next.

Thanks.  I actually applied Laura's patch to today's linux-next as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/h_Pcn/AX+rHq_Hoij_BAYX8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltgR50ACgkQAVBC80lX
0Gxkggf+I5vS7vNiekkQqPRuo9x5AE+WdFyzudW9KS82YsscJXsd7tDT6jjI7/T0
EEiygPK0fuj9KotzIJ9xJsksCB5OXrlPwkEn74ApMh1BryWhtkjqi2ER6wPCuO5n
mw13WG1uEEj4RZAUBZpY83I/OXgO+kQzprGy9nWvp44VGYMhnmLSZszOpNpHravy
4Mo/VYOdAiWHy6595CITi2Ne0M/gtzCqPqF71JgS95qK3ROJw7A2unx9oDP3O5Y3
hsu46Rl08JtynbieVixUXhdk2O764QBHpLFNJoCwY/vVgz7wiQBJgrD8BFJIrROy
QZObclEv1wfq8vyRYp4XAhvXY9a2Zg==
=YBjO
-----END PGP SIGNATURE-----

--Sig_/h_Pcn/AX+rHq_Hoij_BAYX8--
