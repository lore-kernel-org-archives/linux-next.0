From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Thu, 19 Mar 2015 14:45:25 +1100
Message-ID: <20150319144525.0e78ab05@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WEvUMLAo9yafh5U2Da_oCsJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nikesh Oswal <nikesh@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

--Sig_/WEvUMLAo9yafh5U2Da_oCsJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/soc/soc-dapm.c: In function 'snd_soc_dapm_new_pcm':
sound/soc/soc-dapm.c:3389:4: warning: passing argument 1 of 'snprintf' disc=
ards 'const' qualifier from pointer target type
    snprintf(w_param_text[count], len,
    ^

Introduced by commit c66150824b8a ("ASoC: dapm: add code to configure
dai link parameters").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/WEvUMLAo9yafh5U2Da_oCsJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVCkZaAAoJEMDTa8Ir7ZwVqagP/jMdSHIQMVaAtwcH8an+xTHm
Ds5m5fuYHz/1EDfOvpzJ8j9F8Phd4bjfwtcPsQi14D6OmfWi4H7rb3Y10uhckjwG
Rcy7JxfXITmrxGP7P3qP5SQYwI+6TBC1PGNr2aLy/SfFkeFyRxW4KwotvHeoOvY8
ste64Rj008hGTI0Q0G7FL8T9FoAn4tPpBWSLfdNm3oFMvPi/hSrBDmv2vA+1ywF9
JH3SJdD+Z+i1N0X1LykIWm57nRc5GsjCtU6rGNDgUdZh2n6g3mk3/a1POnqLvJ8m
Pk+1c/TRTsJFIZ00Vxbh/oqxMgqmisvAjKXLamCznusSQFuOP/ab2aXdBtGRZDcn
6eSIahEhhyailgmtfPCeCdJdRWiSOopGjLC/Erv2MTLdEhWKo8okki89ELpEVLSc
EpO8K9nSkG/WmVwfdy0/BJJMH2DnS8VOALPr7YHtZPac/LxBkY5qbj9aqlkmFbHY
ONMIVeFfXtB2gMlQdw+gSlygNWqkNk6jEQ2tACiY0npe5OVu1MvF0JM90QTxTfHI
QhCfzI1OdVr/f9kCx6I12biT7vg01RPbgPOLMTN+cA88J4IL031+GoTuCT7hG0IP
XphLY0LVv44mh4iPjxndv3jSkG3fRmWzQu5JzEdrsxw/zrQEiPyrwtxLvVvRGvoX
Bn7FRxV6OKnpSHCURJ4r
=zaIY
-----END PGP SIGNATURE-----

--Sig_/WEvUMLAo9yafh5U2Da_oCsJ--
