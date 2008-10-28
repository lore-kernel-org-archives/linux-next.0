From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the v4l-dvb tree
Date: Tue, 28 Oct 2008 23:04:07 +1100
Message-ID: <20081028230407.6253b57d.sfr@canb.auug.org.au>
References: <20081014182846.d60f2e8b.sfr@canb.auug.org.au>
	<20081027181632.97d18410.sfr@canb.auug.org.au>
	<20081028094827.1c4e4f97@pedra.chehab.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Oct_2008_23_04_07_+1100_YpDTOD0olZ=3LfUX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32959 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753434AbYJ1MES (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 08:04:18 -0400
In-Reply-To: <20081028094827.1c4e4f97@pedra.chehab.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__28_Oct_2008_23_04_07_+1100_YpDTOD0olZ=3LfUX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Tue, 28 Oct 2008 09:48:27 -0200 Mauro Carvalho Chehab <mchehab@infradead=
.org> wrote:
>
> Now, everything is simpler and I hope it will work like a charm.

Excellent, here's hoping.

> I've just updated today my linux-next tree. I'm now using branch "master"=
 for
> V4L/DVB patches. "stable" is now just a copy of your "stable" branch.

OK, understood.

> I have one doubt about what would work better for you: should I merge als=
o the
> patches for the current kernel version, that I intend to send upstream, o=
r it
> would be better to just have there the newer patches for the next version?

You can either do that merge, or I can fetch a second tree from you (as I
do from several others) that just contains commits for the current
release i.e. usually just fixes. (see e.g. powerpc-merge,
driver-core.current and the other current trees).  I merge these early
after stating from Linus' tree.  The thinking is that these trees are
usually small or empty, but they mean that I don't have to worry about
bugs in Linus' tree that have already been fixed but the fixes haven't
been merged by Linus yet.

If you also merge that fixes tree into your next tree (to fix conflicts)
then that is OK as well (and is sometimes better/easier than merging the
whole of Linus' current tree).

> Anyway, please start pushing from=20
                       ^^^^^^^
fetching :-)

>  ssh://master.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-next.git =
master

OK, starting tomorrow.

Thanks for sorting this out.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Oct_2008_23_04_07_+1100_YpDTOD0olZ=3LfUX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkG/7cACgkQjjKRsyhoI8woOACdEgYF9jQQsbzobONvhzdGk8Dt
aLQAn1b48z59qiehFhC4PeeJ117P+Ecp
=0DeX
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Oct_2008_23_04_07_+1100_YpDTOD0olZ=3LfUX--
