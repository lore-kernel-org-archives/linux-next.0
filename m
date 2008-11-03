From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the slab tree
Date: Mon, 03 Nov 2008 11:39:15 +0200
Message-ID: <1225705155.22949.16.camel@penberg-laptop>
References: <20081103152610.52588248.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:43857 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754893AbYKCJiY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 04:38:24 -0500
In-Reply-To: <20081103152610.52588248.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Andrew Morton <akpm@linux-foundation.org>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>

On Mon, 2008-11-03 at 15:26 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the slab tree got a conflict in mm/vmstat=
=2Ec
> between commit 556adecba110bf5f1db6c6b56416cfab5bcab698 ("vmscan: sec=
ond
> chance replacement for anonymous pages") from Linus' tree and commit
> 9fb8a023ad432b0ca884790a8a05991180ab42b6 ("slub: Trigger defragmentat=
ion
> from memory reclaim") from the slab tree.
>=20
> Just context changes.  I fixed it up (see below) and will carry the f=
ix
> for a few days (during which time I hope it is fixed in the slab tree=
).

=EF=BB=BFI fixed up this by rebasing the whole series to 2.6.28-rc3. Th=
anks!
