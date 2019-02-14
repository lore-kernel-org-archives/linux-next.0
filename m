From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the leds tree
Date: Thu, 14 Feb 2019 14:46:10 +1100
Message-ID: <20190214144610.3672e9d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H2THokzX89Ba/ZuAYJAh2TO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Kazior <michal@plume.com>
List-Id: linux-next.vger.kernel.org

--Sig_/H2THokzX89Ba/ZuAYJAh2TO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jacek,

After merging the leds tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_firmware_loaded':
drivers/leds/leds-lp55xx-common.c:217:1: warning: label 'out' defined but n=
ot used [-Wunused-label]
 out:
 ^~~

Introduced by commit

  905c2157dd19 ("leds: lp55xx: fix null deref on firmware load failure")

--=20
Cheers,
Stephen Rothwell

--Sig_/H2THokzX89Ba/ZuAYJAh2TO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxk5IIACgkQAVBC80lX
0GyRAQf/TKhSksH6I9jPAssqIRA81LLgLzSzlUsfiVFWhrY5J1jAY8/UV5IU6Ema
SP+oM4G3O2oN3ZIGgQ44AmF22tfECeArEVzt5Jl3CWKizBhY5gT3XbEUa9E8bj1j
veheUsKZ1bbh2pd3Crbs+02kpRfFRAvxsgrxco8u3MofHeuxo84cQvZRs3QLybzX
fNFWbGu3IidTYYZ+7sE/XJcuVR07+Xu3L1vuqzICHAndWPjhFleY5JweVZ/x/uXf
/fmC2mv+JzzOaGiKU4TmCOJEX39/P12mVef/9o6MO5JX/oDH3noAUozT9HkyXvXq
eE6jw4jSIaiadTQ6wkRvHxlW9earHg==
=Vtch
-----END PGP SIGNATURE-----

--Sig_/H2THokzX89Ba/ZuAYJAh2TO--
