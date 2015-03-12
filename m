From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Mar 12
Date: Thu, 12 Mar 2015 21:26:31 +1100
Message-ID: <20150312212631.1df37d57@canb.auug.org.au>
References: <20150312165357.3ee9b796@canb.auug.org.au>
	<20150312095811.GK28806@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/psR0Hy7CWU45DNXN7yfS5aI"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46060 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753053AbbCLK0n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2015 06:26:43 -0400
In-Reply-To: <20150312095811.GK28806@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/psR0Hy7CWU45DNXN7yfS5aI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Thu, 12 Mar 2015 09:58:11 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Mar 12, 2015 at 04:53:57PM +1100, Stephen Rothwell wrote:
>=20
> > The sound-asoc tree still had its build failure so I used the version f=
rom
> > next-20150306.
>=20
> Are you sure it's the same failure and not a new one?  This should have
> been fixed yesterday and I just re-checked what's there at the minute
> definitely doesn't have the same problem (and shouldn't have since well
> before you normally do your updates).

This is the error I have been getting for the past couple of days:

sound/soc/codecs/rt5670.c: In function 'is_sys_clk_from_pll':
sound/soc/codecs/rt5670.c:702:38: error: 'struct snd_soc_dapm_widget' has n=
o member named 'codec'
  struct snd_soc_codec *codec =3D source->codec;
                                      ^

The line number has changed (from 519 to 702) but the function name and
text is the same.

There was another error (the bad merge resolution) that is gone today.

Bard Liao pointed at this patch today:
http://mailman.alsa-project.org/pipermail/alsa-devel/2015-January/086618.ht=
ml
which is not in the sound-asoc tree I fetched today (top commit
ddb1fb8f0089).  I just did another fetch and it didn't change.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/psR0Hy7CWU45DNXN7yfS5aI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAEBCAAGBQJVAWndAAoJEMDTa8Ir7ZwV11YP+I6TG0lVyqv94uk1PjZE9gHI
ieFJDL1+gjfl6BBUxy0axAJVzKsOSHWbaqktuJ+dJFkaceqp1VpagXE2b6UCtO6N
x1otjuOOP2h2LxXSNhlhhuhnYPRBsPth/6UAygRkBSZBtiW33Mql6ybu/xPaF+n4
OT+d75LPhAPQQlevKn2JDo/vJQF5CGyH+i58z3djM2s0zWi2znydOoQpWs1quoi2
0FvkVtIvharzzEs7Ost9sXifNIGC50l4mYInD/YQvWKn9cK9n3RGg7ME+fGMBtIg
QmDuvm205GQhfJpUdkyDeaPYPNACKIR2bg2gkYjjq2P4y2kD57SVQdaLiV19lv75
uz4Ybu+6sv5N9QMq2bnw6VlwV6mkNEaqXOWLIj4kojoSg9VOQOSykbIRUXHs7wG4
p42MYJpFVKhLCOC0TqvsvES0Xa763tBDAEgZTF87rhY996dPaP5gUE6wnkB7hm++
yusjUqY5M3RtILoI/EuRadEPag1DM5Ab+3VuV8MvBzpL3AJYMPgqmewkW8FYPaYP
kwYEz+pgok9VfE9nSgwEg5ggFJ5gDueUrrS7QfRWmi1eE56j1EWezYg7xFb63sBG
TmOYommxdV8gfgcghHVyc8QjkbE+6GzjwdUU6IGw3SOohmSemgtLFib52qdnyKC1
2tmnHrZZpheWybqcIKU=
=8/rC
-----END PGP SIGNATURE-----

--Sig_/psR0Hy7CWU45DNXN7yfS5aI--
