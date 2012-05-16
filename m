From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kbuild tree with the sparc-next
 tree
Date: Wed, 16 May 2012 13:44:30 +1000
Message-ID: <20120516134430.14f8e43c6f75604410dae815@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__16_May_2012_13_44_30_+1000_+W9pYOm1rJDFczPV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__16_May_2012_13_44_30_+1000_+W9pYOm1rJDFczPV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Today's linux-next merge of the kbuild tree got a conflict in
arch/sparc/boot/Makefile between commit 51f19cfa76d7 ("sparc32: drop
build time btfixup patching") from the sparc-next tree and commit
95698570510b ("kbuild: refactor final link of sparc32") from the kbuild
tree.

I have no idea, so I used the version from the sparc-next tree.

Sam, can you have a look and work this out, please?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__16_May_2012_13_44_30_+1000_+W9pYOm1rJDFczPV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPsyKeAAoJEECxmPOUX5FEAikQAJdVUWSO3A30SPG9J/EewWEL
J1IfvuNLc3JsbK51hKuWJK1mcXzHBCUKbu2AKXN+FEoh4IUB9FMsFOyv+jzt4wl8
fk0WfWO77ZOzMr2BNBJ2wSPIccVKyeOiU+o0et5F5c8+aP488ojTfwGF9wet0wpY
vgXoWFbPryKBAUT3R+qSuAvkX1pIUjrti6NybKaBnJWK+PLiziCQmOBRAz7067Hh
uzeG8Op4Tk91ON0YeOb9b6A/K7GKAUsK0LzzFXxLEC2Y15pOORWJhCTksmP4Tz2h
YRJdtSZovpl2dssgLCbalufkg0CbjQJpaLSftqKgvHbtzFD7Y2+DUwgi3Ss77mEU
u05XWT+uxfPAAX0x2Qbw3bQqcHPcBG9ZFRlsNHm02wCfPkAqzS9+RDWiaCMHzU7H
rBY0RGAxtr5AjT8nogiACpw/54YFKE1uL3a4FX0hsHRg07JHPkr87oo5FqGCVxjj
wRS9xdxrRQCAO4IJA//Cs8Ne4ZIzXgTlAdEH0k0cSIBCViPzXCjopTUR8sg9lkv4
Pi6IXrm6/jYEayfSFz8e5kGtAvQcl2h2ObQl+Vt4UbF0OtmZOzvtidsbo3vR4aGd
heJj1BMCRGQXbbgSUmS2VdLDhwEGQeP//CV9DFJqhWPe2kYABFanAXftrOFvbUvM
DHtZs3EaDd+XrJA2Gtfg
=yLdb
-----END PGP SIGNATURE-----

--Signature=_Wed__16_May_2012_13_44_30_+1000_+W9pYOm1rJDFczPV--
