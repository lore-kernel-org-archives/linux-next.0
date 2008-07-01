From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Tue, 01 Jul 2008 09:32:11 +0100
Message-ID: <1214901131.29199.31.camel@pc1117.cambridge.arm.com>
References: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com>
	 <20080630125110.1dc5689a.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:56586 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754402AbYGAIch convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 04:32:37 -0400
In-Reply-To: <20080630125110.1dc5689a.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-next@vger.kernel.org

On Mon, 2008-06-30 at 12:51 -0700, Andrew Morton wrote:
> On Fri, 06 Jun 2008 18:33:00 +0100
> Catalin Marinas <catalin.marinas@arm.com> wrote:
>=20
> > This series of patches allows the kernel to be compiled to Thumb-2 =
mode
> > (on ARMv7 CPUs). The patches have been posted a few times on the li=
st
> > and the comments were implemented (hopefully I haven't missed any).
> >=20
> > If/when there are no more comments, I'd like the series to be merge=
d
> > into the -mm tree if Andrew agrees. It was tested and generated aga=
inst
> > the 2.6.26-rc2-mm1 kernel.
[...]
> OK, I added this tree to -mm.  Nobody is likely to test or review it
> there, but at least I might pick up on any merge or build issues.

Thanks.

> If you're hankering for a 2.6.27 merge of this material it might be
> more appropriate to add it to linux-next.

I aim for the =EF=BB=BFpost 2.6.27 merge window (i.e. patches available=
 in
2.6.28).

But isn't linux-next targeted to subsystem maintainers only (i.e. get
them merged via RMK's trees)? Or an "Acked-by: RMK" would be enough.

--=20
Catalin
