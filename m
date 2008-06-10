From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tip-core merge conflict
Date: Wed, 11 Jun 2008 09:52:26 +1000
Message-ID: <20080611095226.f798bb6a.sfr@canb.auug.org.au>
References: <20080610120857.042ea0f1.sfr@canb.auug.org.au>
	<20080610190434.GC15983@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_Jun_2008_09_52_26_+1000_7.fb6sjNxXLXLjqM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37633 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753856AbYFJXwe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 19:52:34 -0400
In-Reply-To: <20080610190434.GC15983@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Wed__11_Jun_2008_09_52_26_+1000_7.fb6sjNxXLXLjqM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Tue, 10 Jun 2008 21:04:34 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Tue, Jun 10, 2008 at 12:08:57PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's merge of the tip-core tree got a trivial conflict in
> > include/asm-generic/vmlinux.lds.h between commit
> > f1cb2ba8ca4a8b4b76bbf0b795375af52442501b ("generic: add
> > OUTPUT_DATA_SECTION to vmlinux.lds.h") from the kbuild-current tree and
> > commit 6360b1fbb4a939efd34fc770c2ebd927c55506e0 ("move BUG_TABLE into
> > RODATA") from the tip-core tree.
>=20
> I have dropped the offending commit from kbuild.git for now.
> It will be applied late in the merge window.

OK, thanks.  However, I am more than happy to carry these trivial merge
fixes (and Linus does these fixes all the time) so if you want to keep
this sort of thing in your tree, that's OK.  The reason I report them is
that I try to report everything.

The other thing we are considering is having a "late merge" set of trees
that I merge at the end of linux-next.  The mechanics of that are still
being thought about.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_Jun_2008_09_52_26_+1000_7.fb6sjNxXLXLjqM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhPE7oACgkQTgG2atn1QN+EYgCbBct4Qvw+iNlJfDcUgnmNJDBQ
U4oAoIJnR4TkwzUIuPu89qdqUeivJpPm
=lVNa
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Jun_2008_09_52_26_+1000_7.fb6sjNxXLXLjqM--
