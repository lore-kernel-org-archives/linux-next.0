From: Thomas Meyer <thomas@m3y3r.de>
Subject: Re: linux-next: Tree for May 19
Date: Mon, 19 May 2008 20:42:00 +0200
Message-ID: <1211222520.30161.3.camel@dhcppc1>
References: <20080519174120.2083ea57.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:51439 "EHLO
	www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758093AbYESSmO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 May 2008 14:42:14 -0400
In-Reply-To: <20080519174120.2083ea57.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Am Montag, den 19.05.2008, 17:41 +1000 schrieb Stephen Rothwell:
> News:
> 	I will stop making full tar balls tomorrow unless someone screams.
> 	The LATEST file now contains the name of the version that the
> patches are based on i.e. today, LATEST-IS-next-20080519 contains "v2=
=2E6.26-rc3".
>=20
> Changes since next-20080516:
>=20
> New tree: bkl-removal  (this is Jonathan Corbet's tree)
>=20
> Removed trees: x86-fixes, sched-fixes (I don't know where they are
> currently).
>=20
> Changed trees: x86 and sched are now the new auto merged trees.
>=20

Is it intentional that kernel.release is:

$ cat include/config/kernel.release=20
2.6.26-rc3-next-20080519-sched-devel.git

all predecessors have had names like:
=EF=BB=BF2.6.26-rc2-next-20080516

greetz




--
To unsubscribe from this list: send the line "unsubscribe linux-next" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
