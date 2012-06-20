From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Wed, 20 Jun 2012 15:01:40 +1000
Message-ID: <20120620150140.64b8bd622e00638d3ceed40c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__20_Jun_2012_15_01_40_+1000_Fe7hRFq.DBSzyeTf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Nanda <snanda@chromium.org>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__20_Jun_2012_15_01_40_+1000_Fe7hRFq.DBSzyeTf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the pm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/built-in.o:(.toc1+0x37f0): undefined reference to `pm_print_times_e=
nabled'

Caused by commit 0eb8c06cb620 ("PM / Sleep: Separate printing suspend
times from initcall_debug") or maybe 1873ce64491a ("M / Sleep: add knob
for printing device resume times").

I have used the pm tree from next-20120619 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__20_Jun_2012_15_01_40_+1000_Fe7hRFq.DBSzyeTf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJP4Vk0AAoJEECxmPOUX5FEg10QAKDTUxNjXmY50oD1H/olvqjw
9hbuK/y2fIM1uvlaxCW1EaDNybt8BLsDb+7LyNJp1ViwOIUtYHCcYEQmBOgmRDDu
YrGax1WNSaq7zX3DHFZ7639a7MZ9WandbO1v+xIYcJcuEVKs9ucIDCAV35U4YQXR
X/juJbMburrwoacICLky8SYl8mMzogyQ2i6NoKE76Mt3oGkpQOIDQIInGxNKCDNA
w0b0SWOsl2xLqUpPsapdjDUw26zugvqoh7SlW0rL5TgWbociw/OEirZoSCobQpyQ
gLKqyrfJzgEZVRCkayte5P8ohk5d/YirFo3uM3GKNxRXNrp0NPECskTql7kh+ibO
jZyH2ngk1jsqszlZiYeQV3FnFNNx8OWyHUyeUhJDFNeo4/KWgk+5IF2KfQc9EHCR
0P/WT1JM2oL/cCRnw1SgYg/SOk1Ti90AhwHFvD2SiMJWRO4RitIThJB9XIEhaaLz
m8siMOqVEdcDmo0zslKGgy+aehK2yryHnNlJvLSFTxhfB0kNllUsfHYdXIvjaPOJ
f1WeLh4pfWdF5JFYWQzaWCtEnL9jxyMU+gNCkTFoar9WvTjZERDcgDkjZY1kU299
8TdQmozs09X0pgxob8usUyBcGniT58wD/LTgbzX7r2Xmbik9wDcSIUW2ByaPg709
plQo9/cZtof6WrtJOZWc
=d29b
-----END PGP SIGNATURE-----

--Signature=_Wed__20_Jun_2012_15_01_40_+1000_Fe7hRFq.DBSzyeTf--
