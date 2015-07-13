From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Mon, 13 Jul 2015 13:23:09 +1000
Message-ID: <20150713132309.4ad9b4c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1eMLN+ApNd_PPK8w47g7_ME"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-Id: linux-next.vger.kernel.org

--Sig_/1eMLN+ApNd_PPK8w47g7_ME
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

warning: (SND_SOC_ALL_CODECS) selects SND_SOC_STI_SAS which has unmet direc=
t dependencies (SOUND && !M68K && !UML && SND && SND_SOC && SND_SOC_STI)

Introduced by commit

  32a726b2e089 ("ASoC: sti-sas: Add sti platform codec")

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/1eMLN+ApNd_PPK8w47g7_ME
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVoy8oAAoJEMDTa8Ir7ZwV2K8P/izIED29t6NqOOQM16l+DxNU
GqhSUKkrh9Mr3Y8fciBg5hrFnFx/GsZ6g1H9HlgFPG25dbT8ohQrYWBcDVr6GQ01
fc1I5fDgRrDot3oSIVGnqFkHVNHiuvUSH3QvPCrACdEvYo6/hKEMw+c+gSY5/SFA
VmnhgD09v+4lbTNBm1ETcmFe6c5QGtl+zGANroL0cEImtUz0gc3ZdySLaL0QUwv9
C6EGeaTbgrnTgit/vIZadTFutXZu5J/jQTFBpKP3WKDcsMJnzLqSKmJYp2her1sF
uZNU/n78Qz1dtTLyICUW8932KTXPwI8wH7O6XFeGbH630iObt5NqvOAJ+XjknCLI
7OMpSxWMqr1BFk3axEj1W0AkOIdFOYyNSXWr8syVC3VsWeKaKHkM12pTtV7uYjgi
M0oq+FxzlcLGCtWTgFwOqTAyMtKowZziyx/UD7Qyuz3AaB0859fSfkmw2AlSIvlF
cUFwfJKypIhaMsLqQbD1U5IkDzc1OwiVCkbX3LSURP87ZT2pmxDHBaBfdkaaxADG
20S2l2+YUbYa0uG3Wnor/AQn/B3DFfnGICK9ev0FW4vDlxEqfGWT/khia2lSLXDh
EFNkMROc+iMX1AQ0u3oDKm/wolF1CCVVzsauULwlYq80+gZWQ7Z6vB9sf7af9o6h
rOSHal4pKZTdzL/+2ud1
=Rrqp
-----END PGP SIGNATURE-----

--Sig_/1eMLN+ApNd_PPK8w47g7_ME--
