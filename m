From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Subject: Re: linux-next: manual merge of the net tree with the net-current
	tree
Date: Tue, 24 Nov 2009 23:52:24 -0800
Message-ID: <9929d2390911242352l4ff1359dt9a9ecba381df3432@mail.gmail.com>
References: <20091124141122.63e81c55.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:59103 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448AbZKYHwS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2009 02:52:18 -0500
In-Reply-To: <20091124141122.63e81c55.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bruce Allan <bruce.w.allan@intel.com>

On Mon, Nov 23, 2009 at 19:11, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> Hi all,
>
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/e1000e/ich8lan.c between commit
> 818f33313caab9be2a10458500dbed4a88c1b334 ("e1000e: do not initiate
> autonegotiation during OEM configuration") from the net-current tree =
and
> commit 94d8186a693284344ee5cb9734086c7a2370241a ("e1000e: cleanup ops
> function pointers") from the net tree.
>
> Just context changes. I fixed it up (see below) and can carry the fix=
 for
> a while.
> --
> Cheers,
> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
>

I am checking your merge changes to e1000e now, sorry for the delayed r=
esponse.

--=20
Cheers,
Jeff
