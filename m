From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the char-misc tree
Date: Tue, 2 Oct 2018 19:12:36 +1000
Message-ID: <20181002191236.0aa50539@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EluHv0xidCUDsi2vr6bU4ra"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/EluHv0xidCUDsi2vr6bU4ra
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (i386
defconfig) produced this warning:

drivers/nvmem/core.c:496:1: warning: 'nvmem_find_cell_by_index' defined but=
 not used [-Wunused-function]
 nvmem_find_cell_by_index(struct nvmem_device *nvmem, int index)
 ^~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  e888d445ac33 ("nvmem: resolve cells from DT at registration time")

--=20
Cheers,
Stephen Rothwell

--Sig_/EluHv0xidCUDsi2vr6bU4ra
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluzNoQACgkQAVBC80lX
0GxxgwgAnE7f/0v1TZErS/gDfJZgMGRQql0EvwBXfU1hqKvpzTY8Db/u1j4+O7m4
+wMnshHVkEo8b32YcBI5/G5j1JAUYB7/elUUjNiPAjTzME39gwXak9NQ4RXlcxaN
3xzdvnotydRcMQ0yj24q3U0n3OwmpUmy1HQpOEGKL2IEkZQUuX4UviFPrfiFJndi
fYb7VZ228UUCWDsxoKi2dmPHcr67eR9f+0kx3N6LtF1cVikwE6W1W1kZ2bwoQQbj
i9XhErKLpJrkI4H3I9IhnIlGos4AMj2lrggE2K7P9eyjukKWZrmIhSxt0i12yEjv
ApkqtYOb5to6oOXLcjCI/toQ4uC/Uw==
=GC0t
-----END PGP SIGNATURE-----

--Sig_/EluHv0xidCUDsi2vr6bU4ra--
