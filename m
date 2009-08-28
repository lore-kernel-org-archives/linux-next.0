From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound tree build failure
Date: Fri, 28 Aug 2009 11:23:39 +1000
Message-ID: <20090828112339.88f4be05.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__28_Aug_2009_11_23_39_+1000_=keHP43CMQlHOkUh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42596 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751058AbZH1BXp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Aug 2009 21:23:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__28_Aug_2009_11_23_39_+1000_=keHP43CMQlHOkUh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_proc_write':
sound/core/oss/mixer_oss.c:1168: error: implicit declaration of function 'p=
rinkt'
sound/core/seq/seq_device.c: In function 'snd_seq_device_register_driver':
sound/core/seq/seq_device.c:327: error: implicit declaration of function 'p=
rinkt'

Caused by commit 36ce99c1dcab2978fc1900f19b431adedd8f99f6 ("ALSA: Add
debug module option").

I have used the version of the sound tree from next-20090827 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__28_Aug_2009_11_23_39_+1000_=keHP43CMQlHOkUh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqXMZsACgkQjjKRsyhoI8yYSACgrxJ+q7PcYkBOY1brxAk871AG
v8cAnjg13H1vUXn1FUBoeKhgabxbDulf
=XVRI
-----END PGP SIGNATURE-----

--Signature=_Fri__28_Aug_2009_11_23_39_+1000_=keHP43CMQlHOkUh--
