From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with the ceph tree
Date: Fri, 26 Jun 2015 18:33:26 +1000
Message-ID: <20150626183326.7287706a@canb.auug.org.au>
References: <20150626111755.5f0635bd@canb.auug.org.au>
	<CAOi1vP8-Fz2FABJZdt6_aZq_TNGFBhGuanV-n9kBvdFmyRMsyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jC7ZUGI_7G/TPBggUUzGeCi"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40408 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752222AbbFZIde (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jun 2015 04:33:34 -0400
In-Reply-To: <CAOi1vP8-Fz2FABJZdt6_aZq_TNGFBhGuanV-n9kBvdFmyRMsyw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ilya Dryomov <idryomov@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Sage Weil <sage@newdream.net>, linux-next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yan, Zheng" <zyan@redhat.com>

--Sig_/jC7ZUGI_7G/TPBggUUzGeCi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ilya,

On Fri, 26 Jun 2015 11:21:52 +0300 Ilya Dryomov <idryomov@gmail.com> wrote:
>
> > Sage: that ceph tree commit has no Signed-off-by from its
> > committer :-(  The same is true for almost all the commits in the ceph
> > tree ... and the committer (Ilya) is not listed as a maintainer of that
> > tree ... and its on github :-(
>=20
> Well, it has Signed-off-by from a person who is listed as a maintainer
> of fs/ceph (Zheng).  We share the same tree for three components: rbd
> (drivers/block/rbd.c), cephfs (fs/ceph) and libceph (net/ceph) which is
> used by both rbd and cephfs (we should probably split libceph into its
> own MAINTAINERS entry).  The volume of commits is not that high and
> we prefer to not clutter our 30-40 commits per cycle with a bunch of
> merges, so when one of us rebases the committer stamp gets wiped.

Then the person who rebases it must add a Signed-off-by line since they
are then on the handling path from the author to Linus.

> As for github, is that a bad thing?  ceph-client.git is certainly not
> the only github tree in linux-next.

Yeah, it just means that I am a bit more suspicious of things there.
You are *not* listed in my contacts for the ceph tree not are you
listed in the MAINTAINERS file for that tree.

Also the tree listed in MAINTAINERS is:

T:      git git://git.kernel.org/pub/scm/linux/kernel/git/sage/ceph-client.=
git

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/jC7ZUGI_7G/TPBggUUzGeCi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVjQ5cAAoJEMDTa8Ir7ZwVhisP/j5sXZPkas8kVHO014h9AAt3
zpKFwaFALcxcJa1LVHTOIP+OoFcNpA4c41gPxtTyFrUry0BQWer7aHvBsvklJO/i
qFSWKCezk/RqzxN7ETbI46L4mdUCNy39JBpYPkJcRozrSc42w7GsLY8J77ENdFSo
mpa3EjVkLU+KDHd5o6pk1RCutUNhn0m3DP3V/hbAXVXt8W3ZKWg4HstZXrfB/hNt
80MkEzBMtUJbPNZiqB6OyOklrF65fT12ne6iFbGTAw6kH7jh/2V15zyY7kmweXvi
z/ePcNgqUJ0Ezxk70riUzwWZe+4RYoI7uJVcilZ3ZUrV+oN9Sn1MA8Nf6EEZKnsp
uOkFgAmGC0oeSe6dY6yhbZlkc0SFo73qOQI5AfRblUuT78zzq+RBnjukRG/e5VWm
XCCmRkb53E+dtnc7UzsrWvdhEoPTpYQQTCG47DEZCLLFtlfjU6PTWZJ0kcGoivVZ
CMBOaqSdFvFMizXonn/iW5D3SMbEuXX6n3sQ0Q1xcBFdPO7C8XDZPaX92nuTzQts
i2X/oHbfOcIkLk8kBpu00NM8ppDO7buJxFvRaHLZ2w8idEZ/BjyrFQWHqS1ErWNn
vAkqmaD0CZdXZLDE3HfKpDcdTBSR01YFcSaHhdP+Bp/IkeRR5OiuB0H/M4POHwhZ
fP/4KCeZKLv5lUPsDvy8
=g3EJ
-----END PGP SIGNATURE-----

--Sig_/jC7ZUGI_7G/TPBggUUzGeCi--
