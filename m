From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the wireless tree with the
	net-current tree
Date: Wed, 8 Jul 2009 10:04:25 -0400
Message-ID: <20090708140425.GE4253@tuxdriver.com>
References: <20090708124005.ecbf2907.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:35990 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755322AbZGHOP7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2009 10:15:59 -0400
Content-Disposition: inline
In-Reply-To: <20090708124005.ecbf2907.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Wed, Jul 08, 2009 at 12:40:05PM +1000, Stephen Rothwell wrote:
> Hi John,
>=20
> Today's linux-next merge of the wireless tree got a conflict in
> drivers/net/wireless/p54/p54common.c between commit
> 0ca1b08eba627b4245efd0f71b55a062bf163777 ("Revert "p54: Use SKB list
> handling helpers instead of by-hand code."") from the net-current tre=
e
> and commit 373234a7c69600397aea39c1452806736df2dfc5 ("p54: Modify p54
> files for new organization") from the wireless tree.
>=20
> For today, I just ignored the net-current change.  This will need fix=
ing.

There is some code reorganization happening in wireless-next-2.6,
resulting in a couple of files getting deleted.  I'm guessing that
if/when Dave pulls net-2.6 into net-next-2.6 (which wireless-next-2.6
gets rebased upon) then this should resolve itself.

Hth!

John
--=20
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
			=A1Viva Honduras Libre!
