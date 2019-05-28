From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the sound-asoc tree
Date: Wed, 29 May 2019 07:56:14 +1000
Message-ID: <20190529075614.150b1877@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eDmfDfBWBHbIHswnSV_47HK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>, Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, Keyon Jie <yang.jie@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Libin Yang <libin.yang@intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/eDmfDfBWBHbIHswnSV_47HK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  be1b577d0178 ("ASoC: SOF: Intel: hda: fix the hda init chip")

Fixes tag

  Fixes: 8a300c8fb17 ("ASoC: SOF: Intel: Add HDA controller for Intel DSP")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  1183e9a634db ("ASoC: SOF: ipc: fix a race, leading to IPC timeouts")

Fixes tag

  Fixes: 53e0c72d98b ("ASoC: SOF: Add support for IPC IO between DSP and Ho=
st")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  5661ad9490ee ("ASoC: SOF: control: correct the copy size for bytes kcontr=
ol put")

Fixes tag

  Fixes: c3078f53970 ("ASoC: SOF: Add Sound Open Firmware KControl support")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  fab4edf42d2d ("ASoC: SOF: pcm: remove warning - initialize workqueue on o=
pen")

Fixes tag

  Fixes: e2803e610ae ("ASoC: SOF: PCM: add period_elapsed work to fix

has these problem(s):

  - SHA1 should be at least 12 digits long
  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes
Please do not split Fixes tags over more than one line.

In commit

  04ea642ff62a ("ASoC: SOF: pcm: clear hw_params_upon_resume flag correctly=
")

Fixes tag

  Fixes: 868bd00f495 ("ASoC: SOF: Add PCM operations support")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  0bce512e784d ("ASoC: SOF: core: fix error handling with the probe workque=
ue")

Fixes tag

  Fixes: c16211d6226 ("ASoC: SOF: Add Sound Open Firmware driver core")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  13931ae31b67 ("ASoC: SOF: core: remove snd_soc_unregister_component in ca=
se of error")

Fixes tag

  Fixes: c16211d6226 ("ASoC: SOF: Add Sound Open Firmware driver core")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  b85459aafae6 ("ASoC: SOF: core: remove DSP after unregistering machine dr=
iver")

Fixes tag

  Fixes: c16211d6226 ("ASoC: SOF: Add Sound Open Firmware driver core")

has these problem(s):

  - SHA1 should be at least 12 digits long

Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/eDmfDfBWBHbIHswnSV_47HK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlztrn4ACgkQAVBC80lX
0GxqHgf/Yq/rkW3q0vgeiMRe4oU0VQiOar6RSlvfA2ZXM8x0CrTHxnO2PrBPMmR2
uy0wkIM8cxaVf+C9wvDT1kobn4JNL0TBd8cEIAV0yL1NiCFGU4trhQBd1h7OIF21
HA52u2PmXJ69PCjfHcHHbGMQ/eJZou3n+zXKmhJDSRTJtNvHoYJhfOELrtO50U4l
06eciKHtzLKA30aq082YV8JEkJljh+i6TvgzpXok6+M8PQlj5vMgJZ4u97XneDij
H2kleKZb7j8jB4h1EnskiOLuACvjHe/59lCF0XiYRmjGRWjtrJj2W2So3+BUHTXR
SKdzCRBVDjszafrCE+ZnixVADs97bA==
=tdQC
-----END PGP SIGNATURE-----

--Sig_/eDmfDfBWBHbIHswnSV_47HK--
