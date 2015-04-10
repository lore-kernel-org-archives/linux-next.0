From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Fri, 10 Apr 2015 19:08:29 +1000
Message-ID: <20150410190829.75f92150@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n00DLRP4=K50jolNG=eJd6I"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/n00DLRP4=K50jolNG=eJd6I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpio/gpio-sch.c:28:32: fatal error: uapi/linux/pci_ids.h: No such f=
ile or directory
 #include <uapi/linux/pci_ids.h>
                                ^

Caused by commit d1e10dc8c104 ("gpio: sch: use uapi/linux/pci_ids.h
directly"). Clearly this depends on some other patch.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/n00DLRP4=K50jolNG=eJd6I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJ5MXAAoJEMDTa8Ir7ZwV0yMQAIjQwRdMkGn/W7Y9qcsvdITw
omuQdfhkDAsCQ989KVPRoOlagmsCZCCECwo1KSgGJJVlB0k6nLXHcM4p/mdkRf+u
QoxVvXiRUGlRL9IN9QQAbJDXogkkCAnOStU+YspKEZazi2B4DugHSHsIZN9mQtJs
7jVs71inhzjaYAldkyNrR+Gog86CYmbcwWAPFOvcE1zoVoe/W9II6DNa47tPKK3i
SpFrH53jrCrP9BJO7mwmWy4LK7BFz4CFlhYyvjrc5+eiSZ2HR+kivOGhNU0WJnrR
5Dp/2TxpO35qng3L1xYwnfoKuWbHvjhEff2QcvgsAEyheazIJGQLUp67dyzYQ9qo
ePY5PEWN89+x/hxroSs1JsOwarih+uvxKcaxqPYGzqzfDgBSHgcvbKytx4aqLTZy
DucuLKCS62OcgOBrqQfNDlJoskFN8DKHI6slBZYXuO3QmN52x9qKIdC+ZRGM1t0Q
2TEZL8B7DbsoPpHJnhIBZcXR0uyal50qVwECzsNykUCRkzQ0zLkU33OQzCzJ9bVv
dzyHT4fFp8cbbwyoRpJoAWjlT/CHSFCIuzWFqvaslYitBcL+peGSmACqQVX+w1sM
YQCn3VYP2v0CYdI5MXre4ItHvXTC3yBiZZpRQ7pFnof7FF3/nECZ7+yaQDX1wh8d
3Sb1HfmAid5qhqU3MIpz
=hvZh
-----END PGP SIGNATURE-----

--Sig_/n00DLRP4=K50jolNG=eJd6I--
