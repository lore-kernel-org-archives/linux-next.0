From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 13 Mar 2018 20:51:19 +1100
Message-ID: <20180313205119.6ca3c1aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9BBFIhizv9ofbGLUrbIy8xR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/9BBFIhizv9ofbGLUrbIy8xR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (lots of
configuations) failed like this:

(from the i386 defconfig build)

In file included from include/linux/memcontrol.h:29:0,
                 from include/linux/swap.h:9,
                 from include/linux/suspend.h:5,
                 from arch/x86/kernel/asm-offsets.c:13:
include/linux/mm.h: In function 'get_mm_hiwater_rss':
include/linux/mm.h:1569:9: error: first argument to '__builtin_choose_expr'=
 not a constant
include/linux/mm.h: In function 'get_mm_hiwater_vm':
include/linux/mm.h:1574:9: error: first argument to '__builtin_choose_expr'=
 not a constant

and many more ...

Caused by commit

  c7c133f3d5ff ("kernel.h: skip single-eval logic on literals in min()/max(=
)")
(and perhaps the folloups)

Just a few of my builds actaully worked (including those I do
during the day).  For complete logs see
http://kisskb.ellerman.id.au/kisskb/head/13556/ .

I guess it could be compiler version specific.  The failing ones are
done with gcc 4.6.3.  My successful ones with gcc 7.3.1.

--=20
Cheers,
Stephen Rothwell

--Sig_/9BBFIhizv9ofbGLUrbIy8xR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqnnxgACgkQAVBC80lX
0Gz3JggAowomfSVljr6M6qFqE/Eoa2rb7wJLq3KrB81NDc4G0s4Q2W4sIrop44IV
KuNybNR2LvduG8/dw9aFVQKQRzT4ClPmI8oj8uAnK1sC52lDteKrDQ3wnRMN2tLv
AE1zMyT+ttUKU8QUC7M/bqMZkb5yfAf/vnrUvspS23ZZFcvUtukrYZ/J2jTukbEg
kwxNcKwXjvy0vvbIaQ/Ne9ws/F0UzvIxpyAVKZ8GvnSxAG5c+9do0O37aW9WRb/I
R5OVrVuFbQj/jBd5GzV5RUpKP64o3j6zPt8EfhB3ql7SA7fUnAQVTlB1fWP9Qae9
naJBhfEUU2850jEG5TyQ++CJumYb5A==
=Skke
-----END PGP SIGNATURE-----

--Sig_/9BBFIhizv9ofbGLUrbIy8xR--
