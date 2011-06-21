From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the trivial tree
Date: Tue, 21 Jun 2011 15:10:27 +1000
Message-ID: <20110621151027.8de6c5b3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__21_Jun_2011_15_10_27_+1000_.KoEc7l7Rr.DPQFa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41026 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750848Ab1FUFKa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jun 2011 01:10:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, matt mooney <mfm@muteddisk.com>, Vitaliy Ivanov <vitalivanov@gmail.com>, Jiri Kosina <jkosina@suse.cz>

--Signature=_Tue__21_Jun_2011_15_10_27_+1000_.KoEc7l7Rr.DPQFa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/usbip/userspace/src/utils.h between commit e44ba033c565
("treewide: remove duplicate includes") from the trivial tree and commit
4cbab52d18fc ("staging: usbip: userspace: move header includes out
utils.h") from the staging tree.

The latter supercedes the former, so I used it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__21_Jun_2011_15_10_27_+1000_.KoEc7l7Rr.DPQFa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOACfDAAoJEDMEi1NhKgbsCoQH/3R9lM1tKRhgqHu+XT9MaFaL
6qnydqOyYCUJqfOrFxfZwpCzrP7afi1vgum79lbs98vtLbEADIg2H+N4v+tabsyz
xS1SEbuJkSDpr0QLaLaA8IwdXCMHEPzGwK3XAMNc32WTyRxCgc1d6lNGIVAFcLBY
NYaK7lM9bJDoPkyW/20Qd8Ebp0I3yM/gNRn8mi/L94NKBIQpfGSUAjc207rPT3rp
9QfjySrE/ev/BeUtKS6N15RKubyHM0lGQR5BEGHLjhXCjaaSI6VANPP4biWJ1zan
nVI5Wux/Y7VgfXNLXKdw2zjITBWhQl5gKuZbK5UVYo2Vp+TFjRBg/Y4hdGvgRIA=
=fo9S
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Jun_2011_15_10_27_+1000_.KoEc7l7Rr.DPQFa--
