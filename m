From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Multiple for-next branches from same tree
Date: Fri, 8 Mar 2013 00:46:45 +1100
Message-ID: <20130308004645.c9d079895f428e53e325840d@canb.auug.org.au>
References: <51382DCA.5010209@synopsys.com>
	<20130307222446.d2b14a7a3785ef99dbf098b8@canb.auug.org.au>
	<51388731.5020805@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__8_Mar_2013_00_46_45_+1100_ZEW8SkH9e9ozE2lI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:43229 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751184Ab3CGNq4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Mar 2013 08:46:56 -0500
In-Reply-To: <51388731.5020805@synopsys.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-next <linux-next@vger.kernel.org>

--Signature=_Fri__8_Mar_2013_00_46_45_+1100_ZEW8SkH9e9ozE2lI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

On Thu, 7 Mar 2013 17:55:21 +0530 Vineet Gupta <Vineet.Gupta1@synopsys.com>=
 wrote:
>
> On Thursday 07 March 2013 04:54 PM, Stephen Rothwell wrote:
> >
> > On Thu, 7 Mar 2013 11:33:54 +0530 Vineet Gupta <Vineet.Gupta1@synopsys.=
com> wrote:
> >> With ARC arch merged in 3.9-rc1 I feel the need for a revised workflow.
> >>
> >> I intend to have 2 branches for -next exposure: for-curr and for-next.
> >> * for-curr would contain the bug fixes for this release to be sent to =
Linus at
> >> some point in time.
> >> * for-next obviously is next release stuff and will be rebased off for=
-curr.
> > I have several sets of branches like that and it works fine.
> >
> > Occasionally, the branches will conflict, but that can be sorted by
> > merging the for-curr branch into the for-next branch after Linus has
> > merged the for-curr branch.
>=20
> Thanks for your reply Stephen. In that case, can you add the following ad=
ditional
> arc branch to -next
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-curr

Done.

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

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Fri__8_Mar_2013_00_46_45_+1100_ZEW8SkH9e9ozE2lI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJROJpFAAoJEECxmPOUX5FE3u0QAJ+WbPzueuSrDKzOZ3VkZFSf
rynapMkxyy7Kxv3bS0cqStoxiMJ5Sd++wXfgJlUhJAPVHSO/fbnzoDrDZG7YWY90
gaMTymH6ogeBkBvpngF3UOAsQFB8F8QNvof9ArIup75dh+9HJ4Q9wgqdeQGv2Lqc
vpnNequp35u5PaqR2GIYk5krY9HIkM/rTbpxjdj9GQOErWnCQP42nlmsGY7QjWez
+U1HeI74gj0NS5RZ5XYsn2XRlxwSBnaVEVawmTD1sdW/m+/Bm0UfAkz8BZY9gexl
0UVZOI4vJd4xZBispd1j5BuC+l/zBxXAYED+wXY5GCvhgZ5XpeipcwL+FPwMq9x7
GSBdg3Y1kwOvPVmRQGEfdeQ0JceVGd+V4PUBeDqQqavV74Vbr5ZvCj+GGm+dwVj2
vEB6rYy75xTmq9g3X0MAg0BPP7eUF9SLyAIAcLNjdYKWOP9Y3Kjq/EXbNqJ7Mocp
3CMGso41xGA7+EgResgNjX5y6m36aYOkih6IRSaO6+xUJw3Zh6iE6NtY9YMJeZYJ
VtKVMDQAtRh4u4okHJvsE6NEdXcRN2aWn0Gk5E6KGSHfipfH11u0mMA11CJwN4C9
AbXSd091/OS5shFatp0GmJY4GhniqZVp+9JbBOKD2+0UKvrZHnH17yxgbjXSJulH
V1r3F0dgX5eG9XDC/HxL
=q/1i
-----END PGP SIGNATURE-----

--Signature=_Fri__8_Mar_2013_00_46_45_+1100_ZEW8SkH9e9ozE2lI--
