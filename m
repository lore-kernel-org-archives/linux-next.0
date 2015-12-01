From: Mark Brown <broonie@kernel.org>
Subject: linux-next: build failure after merge of the modules tree
Date: Tue, 1 Dec 2015 20:23:12 +0000
Message-ID: <20151201202312.d791b81fa0accaaf5b2f7ab5@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__1_Dec_2015_20_23_12_+0000_Q=/DcZRBIROvi16X"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__1_Dec_2015_20_23_12_+0000_Q=/DcZRBIROvi16X
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the modules tree, today's linux-next x86 allmodconfig build (=
20151201) failed like this:

/home/broonie/next/next/arch/x86/kernel/livepatch.c: In function 'klp_write=
_module_reloc':
/home/broonie/next/next/arch/x86/kernel/livepatch.c:75:22: error: 'struct m=
odule' has no member named 'core_ro_size'
  if (loc < core + mod->core_ro_size)
                      ^
/home/broonie/next/next/scripts/Makefile.build:258: recipe for target 'arch=
/x86/kernel/livepatch.o' failed
make[3]: *** [arch/x86/kernel/livepatch.o] Error 1

I've used the modules tree from the previous -next (which looks to be what'=
s in Linus' tree already) instead. Or at least I'll try to, it looks like I=
 had a bit of driver error with the scripts here...

--Signature=_Tue__1_Dec_2015_20_23_12_+0000_Q=/DcZRBIROvi16X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXgGwAAoJECTWi3JdVIfQJdsIAIRITXMxB3JHPHrx21TxK/M8
AqTKZuAkYd+HNvcAiMq4iASKVhUT565JNHGlIel1M/C63K0G5zsvGjrUrFhI+n7I
i2x/ssVi9NkXzG1VPW90yluXpw23dn8lcq9LxRwcGW5Upg7kMZS9+9lwIR6qVoBn
10Okjg5YEWWiQE8FN86E4Sh9aHu6JBUTuCZDvYQnIBykcL3wgQSDYYHjDNbvvC69
ygITLNumLzEghrME4clTViaKhco51TI/toJDGE7WK9GKz/Rn8rKaqPP+Xy3RPJ9E
8xv6Iv8XpaayRU/xsPsjnO7OeYshNovGqijI+BzCY3u42gFsWjNpmttA8vKAszM=
=nw0a
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Dec_2015_20_23_12_+0000_Q=/DcZRBIROvi16X--
