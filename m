From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: drm-msm tree (Was: Re: linux-next: build failure after merge of the
 regulator tree)
Date: Fri, 10 Apr 2015 09:49:14 +1000
Message-ID: <20150410094914.4c855142@canb.auug.org.au>
References: <20150409143309.3a1fac67@canb.auug.org.au>
	<CAF6AEGtgyHYqmJPgzqSpDgFy1t447V1+0hfaYe1MFJCp-729Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uYxUBYc/KppFFYsiLxgJvj="; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58498 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754201AbbDIXt1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Apr 2015 19:49:27 -0400
In-Reply-To: <CAF6AEGtgyHYqmJPgzqSpDgFy1t447V1+0hfaYe1MFJCp-729Lw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hai Li <hali@codeaurora.org>, Dave Airlie <airlied@linux.ie>, Bjorn Andersson <bjorn.andersson@sonymobile.com>

--Sig_/uYxUBYc/KppFFYsiLxgJvj=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, 9 Apr 2015 11:00:44 -0400 Rob Clark <robdclark@gmail.com> wrote:
>
> Thanks.. btw, would it be possible to get my msm-next branch picked up
> by linux-next?  That seems like it would help to catch these earlier..
>=20
>  git://people.freedesktop.org/~robclark/linux msm-next

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/uYxUBYc/KppFFYsiLxgJvj=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJxAEAAoJEMDTa8Ir7ZwV5sgP/jz0OtWVSFrqBqhRz8N3SCYT
xTgZFLgJOSHuh8hju3yr1EI5RFcVmZTeTm9/d6FZZvCe7hJNg6+yu4tPGa4VTqad
pJrdiBRqm5zcmGV0xsp7DpCQTNbydN3PnBiL/OSuzrYqUr/C/2vfB4EwIkUMEmOO
Jm+29Nz+l2Umh3Kvc3AUnbJccSC+y+zsBMoArO1ZLT9cZq5elNr5ctBRjkUOdEQ6
lc9tj11IOkC4ewXD2jlp2VsnL/O+MdD6Icesc5M5G5bCw/RA5qrEx7wDtnoIbQWr
aT2r8Ax9n4NLnTocAgv10l4aqDptH+rPOfsGM3sAkNx9ckKUG6l9Yxd4hVlH14Fb
5QRvMqb4vWguk8jEarvBGW2FhzLiS8kj96AnNK2K7vt00LKpXQpE1TT3LGSw2eyU
C+WlIpPmMf7p9WCxVBosylYX/DC+6X09WwrYpY2Ms1eJzI5ecnGGXrSNsE/tDVkf
643WuZ/X+RVaVBTQNBI0j21FT3jMeVt2HjFVSpRw6vzk3zO9sX4Q4/Ugh7nzhVxi
oeO2JuthXjl5+uKfNaUVlmD+cdsajyX7aW5xFIM/9lslJOcKP2U0K5W1EihtEyFp
B9DLNroRxIekFv5/og1VGOqfnvIOn3JJdwT3NYZRD4jPwK88DCWjXY2ygIJIX2KW
EE/x1LcquAC9PKlMs0lv
=AN8x
-----END PGP SIGNATURE-----

--Sig_/uYxUBYc/KppFFYsiLxgJvj=--
