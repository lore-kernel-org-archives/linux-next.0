From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: misc things
Date: Tue, 19 May 2009 17:46:15 +1000
Message-ID: <20090519174615.ee6a6881.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__19_May_2009_17_46_15_+1000_4da4Ud3WxixKPPUR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46267 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751520AbZESHqW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 May 2009 03:46:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Tue__19_May_2009_17_46_15_+1000_4da4Ud3WxixKPPUR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

A couple of things:

	it was suggested that my postings about problems (merge
conflicts/build errors/new warnings) in linux-next be sent to
linux-kernel.  For now, I am cross posting them to linux-next and
linux-kernel.  Let me know what you all think.

	being as we are beyond -rc6, I expect all the maintainers are
busy stabilising their trees in anticipation of the new merge window.
(/me prepares for a rush of new stuff in linux-next ...)

	its nice to see so many fewer red results in the builds
(http://kisskb.ellerman.id.au/kisskb/branch/9/).

	maintainers of trees included in linux-next may want to have a
look and see if some of those trees are still relevant.  Some of them
have not had any updates since the previous merge window (or earlier).  If
a tree is defunct (or served it short term purpose), please let me know
and I will remove it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__19_May_2009_17_46_15_+1000_4da4Ud3WxixKPPUR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoSY8cACgkQjjKRsyhoI8xpkgCfW78jqBsT1uJcrvjmALedQFpX
tasAniPPcBCKjEFlgT9MCacIeXyOfh4x
=4x3l
-----END PGP SIGNATURE-----

--Signature=_Tue__19_May_2009_17_46_15_+1000_4da4Ud3WxixKPPUR--
