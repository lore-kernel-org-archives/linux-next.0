From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the slab tree
Date: Mon, 03 Nov 2008 11:39:07 +0200
Message-ID: <1225705147.22949.14.camel@penberg-laptop>
References: <20081103151911.b18d641a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:43857 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754873AbYKCJiR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 04:38:17 -0500
In-Reply-To: <20081103151911.b18d641a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>, Lee Schermerhorn <Lee.Schermerhorn@hp.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Hugh Dickins <hugh@veritas.com>, Daisuke Nishimura <nishimura@mxp.nes.nec.co.jp>, Andrew Morton <akpm@linux-foundation.org>

On Mon, 2008-11-03 at 15:19 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the slab tree got a conflict in mm/vmscan=
=2Ec
> between commit 4f98a2fee8acdb4ac84545df98cccecfd130f8db ("vmscan: spl=
it
> LRU lists into anon & file sets") from Linus' tree and commit
> 9fb8a023ad432b0ca884790a8a05991180ab42b6 ("slub: Trigger defragmentat=
ion
> from memory reclaim") from the slab tree.
>=20
> Overlapping changes.  I fixed it up (see below) and will carry the fi=
x
> for a few days (during which time I hope it will be fixed in the slab
> tree).

=EF=BB=BFI fixed up this by rebasing the whole series to 2.6.28-rc3. Th=
anks!
