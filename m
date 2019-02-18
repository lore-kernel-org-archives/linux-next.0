From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Mon, 18 Feb 2019 17:51:20 +1100
Message-ID: <20190218175120.3881e6e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VKDVsEiVnq5PvWNRVkS0Nrh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/VKDVsEiVnq5PvWNRVkS0Nrh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/binfmt_script.c

between commit:

  cb5b020a8d38 ("Revert "exec: load_script: don't blindly truncate shebang =
string"")

from Linus' tree and commit:

  76b21f3b9c4d ("exec: load_script: allow interpreter argument truncation")

from the akpm-current tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/VKDVsEiVnq5PvWNRVkS0Nrh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxqVegACgkQAVBC80lX
0GwT5Af8D5P6csVxW2x9ywIHDc6vag/0xXSzxEXQ9xJXhUflctzGU0RiYYfdSbHy
l7KSbVI5Dw5Q1ES493UaboCAhOmokTSxnPCQskaxtzhqNCZvVOkWDu/nr8sEMTdB
hebyeUPl8W6vXLs3AToJPoreq+k6tCr15mSQTFjcejN2gIqU9fMzRGxDkL7Y/lMP
kmkEm+NHPnbX3Q+98oMvnfVRSJavxBkEj/pt23zX9nh1RcXmtKZf2gRfS5S+rOYy
GoJLB7Uo9J7cekhXuwjeRyas/xdZ7jRZzOuUn4aOsfukH1RXE0nbYQ7IaHlJ9yt8
2/ui44vm/6qq3oF/FfXgwIgvR4Oycg==
=HZCq
-----END PGP SIGNATURE-----

--Sig_/VKDVsEiVnq5PvWNRVkS0Nrh--
