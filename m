From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: build warning after merge of the mac80211 tree
Date: Fri, 29 Jan 2016 09:21:15 +0100
Message-ID: <1454055675.3369.0.camel@sipsolutions.net>
References: <20160129150601.16f80af5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from s3.sipsolutions.net ([5.9.151.49]:60020 "EHLO sipsolutions.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752265AbcA2IVS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Jan 2016 03:21:18 -0500
In-Reply-To: <20160129150601.16f80af5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2016-01-29 at 15:06 +1100, Stephen Rothwell wrote:
> Hi Johannes,
>=20
> After merging the mac80211 tree, today's linux-next build (i386
> defconfig)
> produced this warning:
>=20
> In file included from include/net/wext.h:4:0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from net/socket.c:97:
> include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush'
> defined but not used [-Wunused-function]
> =C2=A0static void wireless_nlevent_flush(void) {}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0^
>=20
> Introduced by commit
>=20
> =C2=A0 3730abeab65b ("cfg80211/wext: fix message ordering")
>=20
> Missing inline :-(

Oops. Fixed, thanks.

johannes
