From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: slab tree build failure
Date: Mon, 7 Sep 2009 09:10:18 +0300
Message-ID: <84144f020909062310u37ecdddfw31c6cc9a22ccabd9@mail.gmail.com>
References: <20090907153723.0c984c83.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f217.google.com ([209.85.220.217]:57136 "EHLO
	mail-fx0-f217.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758947AbZIGGKR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2009 02:10:17 -0400
In-Reply-To: <20090907153723.0c984c83.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, Catalin Marinas <catalin.marinas@arm.com>

Hi Stephen,

On Mon, Sep 7, 2009 at 8:37 AM, Stephen Rothwell<sfr@canb.auug.org.au> =
wrote:
> Hi all,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> net/wireless/scan.c: In function 'cfg80211_inform_bss':
> net/wireless/scan.c:499: error: implicit declaration of function 'kme=
mleak_ignore'
>
> Caused by commit 74ce35c0d2261896ed4d49799311a894520f7a94 ("cfg80211:
> clear cfg80211_inform_bss() from kmemleak reports") from the wireless
> tree (which should have included linux/kmemleak.h into
> net/wireless/scan.c). =A0Some interaction with the slab tree has expo=
sed
> this.
>
> I have reverted the above commit for today.

AFAICT, you're interested in kmemleak.git, not slab.git. Catalin?

                                Pekka
