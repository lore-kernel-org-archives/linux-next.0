From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the net tree with the
	wireless-current tree
Date: Wed, 22 Jul 2009 10:03:51 -0400
Message-ID: <20090722140351.GC5276@tuxdriver.com>
References: <20090722120000.4b0f2901.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:54386 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754993AbZGVOQB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2009 10:16:01 -0400
Content-Disposition: inline
In-Reply-To: <20090722120000.4b0f2901.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Christian Lamparter <chunkeey@web.de>

On Wed, Jul 22, 2009 at 12:00:00PM +1000, Stephen Rothwell wrote:
> Hi David,
>=20
> Today's linux-next merge of the net tree got a conflict in
> net/wireless/scan.c between commit
> 9e81eccf199d910e5ea8db377a43478e4eccd033 ("cfg80211: double free in
> __cfg80211_scan_done") from the wireless-current tree and commit
> 667503ddcb96f3b10211f997fe55907fa7509841 ("cfg80211: fix locking") fr=
om
> the net tree.
>=20
> Overlapping additions.  I fixed it up (I think - see below) and can c=
arry
> the fix as ncessary.

Looks fine, thanks!

--=20
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
			=A1Viva Honduras Libre!
