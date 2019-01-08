From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 8 Jan 2019 20:50:19 +1100
Message-ID: <20190108205019.63ee0e04@canb.auug.org.au>
References: <20190108131141.730e9c4f@canb.auug.org.au>
        <78f2ee4a-9851-2b5c-18c6-ba3f3e6bd302@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/87.Na2.kJfnNg6cGqx_2SRQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78f2ee4a-9851-2b5c-18c6-ba3f3e6bd302@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/87.Na2.kJfnNg6cGqx_2SRQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Anshuman,

On Tue, 8 Jan 2019 10:24:18 +0530 Anshuman Khandual <anshuman.khandual@arm.=
com> wrote:
>
> Just curious why the NUMA_NO_NODE definition did not get resolved from th=
e local
> numa.h which had the same ones copied over from linux/numa.h but anyways =
the fix
> looks okay.

I assume that <numa.h> is /usr/include/numa.h (i.e. the system include
file which is whatever the distro installed) while <linux/numa.h> comes
out of the tools/include directory (i.e. the one we copied over from
the kernel source).

--=20
Cheers,
Stephen Rothwell

--Sig_/87.Na2.kJfnNg6cGqx_2SRQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw0clsACgkQAVBC80lX
0Gyu+wf+Mi/Q5OCYzDZUasaeWYGUHXu/OXxjIu2y36/h5i02Ri640GLXplJJhqRL
o2gjCMgcjaI8KMdP80XKF32axAYFmM0119rZu7C/Y4yf/J/1BsdcLGB00e6SQ36X
aE6q9HhTjB9xVnNCvAYaoK8F9alvUc5+4vhdgQxeQfL39fw+4Fr/fcJvtj0O/+n2
oH1V7do26aq1x014NjLjEMXmtBKq0MIV1rEPaS2PsERIuN9doIFhJVkw/pTZIqen
powB9B2hBnWQs6X8ww0brtCSurMvt+Fp+CDQHevTpcuNDGfX+VBPkP1sEwjA+rT5
1sndaFfn7uI5jJewhzgrD519x1RpVg==
=sVHt
-----END PGP SIGNATURE-----

--Sig_/87.Na2.kJfnNg6cGqx_2SRQ--
