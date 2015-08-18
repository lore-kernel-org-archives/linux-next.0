From: Inki Dae <inki.dae@samsung.com>
Subject: Re: linux-next: rebase of the drm-exynos tree
Date: Tue, 18 Aug 2015 10:21:32 +0900
Message-ID: <55D2889C.20404@samsung.com>
References: <20150818085050.7a38f4ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33302 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750985AbbHRBVe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Aug 2015 21:21:34 -0400
In-reply-to: <20150818085050.7a38f4ef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Airlie <airlied@linux.ie>

Hi Stephen,

On 2015=EB=85=84 08=EC=9B=94 18=EC=9D=BC 07:50, Stephen Rothwell wrote:
> Hi Inki,
>=20
> I noticed today that your tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git=
#exynos-drm/for-next)
> has been merged by Dave into his drm tree.  Unfortunately, your tree
> has also been rebased onto Linus's v4.2-rc7.  So now the commits
> 0cb600d9be30-f8f66412fa6c in your tree are duplicated of commits
> d36b3004ca2c-2a8cb4894540 in Dave's.  Please tidy this up (i.e. your
> exynos-drm/for-next branch should be commit 2a8cb4894540 or something
> later in Dave's tree) and you should continue your work from there.

Right, I had requested git-pull. Will do re-base on top of Dave's tree.

Thanks,
Inki Dae

>=20
