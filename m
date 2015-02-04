From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound-asoc tree with the sound tree
Date: Wed, 4 Feb 2015 13:44:58 +1100
Message-ID: <20150204134458.474cd19a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jtld7cBDF=dXD=DS8PVWEFd"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44033 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752743AbbBDCpE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Feb 2015 21:45:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

--Sig_/jtld7cBDF=dXD=DS8PVWEFd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in
sound/soc/intel/sst-mfld-platform-pcm.c between commit ef46c7af93f9
("ALSA: pcm: Embed struct device") from the sound tree and commit
8686f251e482 ("ASoC: intel: Remove unnecessary
snd_pcm_lib_preallocate_free_for_all()") from the sound-asoc tree.

I fixed it up (the latter removed more than the former) and can carry
the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/jtld7cBDF=dXD=DS8PVWEFd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0YeuAAoJEMDTa8Ir7ZwVAegP/RVb/eRROIgUZkXzsW9zUozM
vhxdbtTCTELU7CkcTyXTnMCgIoobIv6cRhc6oJhqtw5WEeAnAAA1CGGySTg8MNNG
P6ajtkrqEi9blzA3gD4kux4pPCGWP2WOku9xRNW4A2UfrZGGCcNqRUP5xAsrBA8n
jQy94BcoEaX8oetRCQ8tK02/ruXuW3Ln8FemtGFJ17SKFloR3PinIqd5+GteStDy
/Av2spLaW+U0zvWvgqdCGrTydM+dtsQQIS4bYEJDzc6eB4k8hOlZ/UaUMeUHSWo/
ozjEjwYtyv8DNVvjFCXBjpoVkAa/YZItowJDqdrTaRQJjPb+o3L40uX0Ifx0/ego
GZZ41Sy8LqVCtZoKqHKK5HwAZwX4uE9d02BcsNiyTW753cHy9nJC/L8Zaz9JUeGV
2+27Xa6ek8U787TUUnE84W+k7tTqTmgESc6e7uanm4kh7rakgiq7bp/tHs93sFGf
MYwtKNNLL+SjW+dIdiTogidY807pEF3CVkATkhKIapCBvr+K8WB+idyTZ9HW+Fjf
UAMLVCqHvaeV9Y5WMDf/0s9nJzxV2zP3ZqFum0VA14iavugOIF2wanpgpHo59bTh
BGUIoXELh2HN1PcKYPKrcIL8J7tZfpb9AWx4i6MVFfCo21a3nzucQnLvRRB3coZ6
9ImdcmZ5J6Cp6tuS9ri1
=g0z1
-----END PGP SIGNATURE-----

--Sig_/jtld7cBDF=dXD=DS8PVWEFd--
