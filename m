From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the vfs tree
Date: Fri, 13 Mar 2015 16:31:02 +1100
Message-ID: <20150313163102.742e95b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/icxZGPiOZFMlRYLCMAdoR75"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39501 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750973AbbCMFbI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Mar 2015 01:31:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>

--Sig_/icxZGPiOZFMlRYLCMAdoR75
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
lib/Makefile between commit d879cb83417a ("move iov_iter.c from mm/ to
lib/") from the vfs tree and commits 2e731a72801a ("lib: move
find_last_bit to lib/find_next_bit.c") and 2bbf16381c7a ("lib: rename
lib/find_next_bit.c to lib/find_bit.c") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc lib/Makefile
index 58f74d2dd396,442018a65723..000000000000
--- a/lib/Makefile
+++ b/lib/Makefile
@@@ -24,8 -24,8 +24,8 @@@ obj-y	+=3D lockref.
 =20
  obj-y +=3D bcd.o div64.o sort.o parser.o halfmd4.o debug_locks.o random32=
.o \
  	 bust_spinlocks.o kasprintf.o bitmap.o scatterlist.o \
 -	 gcd.o lcm.o list_sort.o uuid.o flex_array.o clz_ctz.o \
 +	 gcd.o lcm.o list_sort.o uuid.o flex_array.o iov_iter.o clz_ctz.o \
- 	 bsearch.o find_last_bit.o find_next_bit.o llist.o memweight.o kfifo.o \
+ 	 bsearch.o find_bit.o llist.o memweight.o kfifo.o \
  	 percpu-refcount.o percpu_ida.o rhashtable.o reciprocal_div.o
  obj-y +=3D string_helpers.o
  obj-$(CONFIG_TEST_STRING_HELPERS) +=3D test-string_helpers.o

--Sig_/icxZGPiOZFMlRYLCMAdoR75
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVAnYaAAoJEMDTa8Ir7ZwVDGYP/3dDjImAPBStAyQMB4BvhuTF
FK5XgeFOEaH+dfXRhFqBC/6bB58MMUVzJemXaHog8VOcU+FgWC/SyHdn8mm7te4X
vNQkkqv62vHGgtf9tyQn49JfxokB9FNsR0rS+iUoFiELG2AwREDst+IBpJGoTdfK
30bRvjid5jtQnL/AMdnEHQNpePHNjK0Mt72YIov+aSF49CGLV6nJcVBSCVr7KhsV
gkfUbEFAwHA/DEq94mg7M6UpvPqiutEW+c3pYkTA6BkFeToqj3LFhOZyMUB7nYZP
l9LsNgFwQwK96c1RhO2jppjAmEJdZCar2fXD4MZZ3m0o02uPdrxo1G6Poxf0W+yE
BprxCrw6E/s/simmOY22V2mUFIsqMvDy8HJthThgT5yo6n5lEL7WcQRWCL5VvV4Q
at0VfR3sS/oNSDmhplgHIWuL56dZv4UicMzHTGec//yzLEIzGSE0ZpH/Jw9wAm4y
UN1WS6biEXU8u2dVzMYF9+zanM6Y6OAAJsWA6deMMs2xDXVZyIh8ktx4aEGTYH32
6R2/lpqfVuF1A1oVmg1SzZ5zXA2q5wBdRzlmEl/nOP9dR2GYJOB1qqZ3sfwAXSc4
acG6u+NhKnfJSGwPeQjmVmrEqZOjAK13kArzkNpnERvlL1WGufAiT4seiDs5pC1o
ak+xBKWQJ+m9m/WarJyN
=ogoF
-----END PGP SIGNATURE-----

--Sig_/icxZGPiOZFMlRYLCMAdoR75--
