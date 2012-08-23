From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio-lw tree
Date: Thu, 23 Aug 2012 23:43:10 +0200
Message-ID: <CACRpkdaOyA2jPLkimQEtPFVYyRpxQGV7nV+6kiZ5_+mV827ytw@mail.gmail.com>
References: <20120706161455.dd899154fbc8a79ee530572f@canb.auug.org.au>
	<CACRpkdbZddOBf0PXFJjr_aRD3TEa9hSvXjAjf3--8Ko_W0zZcg@mail.gmail.com>
	<w3psjd55kwl.wl%kuninori.morimoto.gx@renesas.com>
	<CACRpkdb=bg7fc1HEW5U2PBjs_hLDRgGUNP=O6BEJRmYfCiSWpA@mail.gmail.com>
	<87r4slg063.wl%kuninori.morimoto.gx@renesas.com>
	<CACRpkdYSLRiAQd3kGGv8xktAvi+YbBSe1hGqMX2y7fFXQOHPXQ@mail.gmail.com>
	<87sjbfy0ue.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:61622 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758315Ab2HWVnM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Aug 2012 17:43:12 -0400
Received: by wgbfm10 with SMTP id fm10so1106314wgb.1
        for <linux-next@vger.kernel.org>; Thu, 23 Aug 2012 14:43:10 -0700 (PDT)
In-Reply-To: <87sjbfy0ue.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Wed, Aug 22, 2012 at 7:03 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> Now, these fixup patches were accepted.
>   http://git.kernel.org/tip/17d83127d4c2b322dd8f217e0ac08c66eb403779
>   http://git.kernel.org/tip/b3ae66f209e8929db62b5a5f874ab2cdcf5ef1d4
>
> Could you please re-check this dropped patch ?

Yes! I've applied it. Check that it lands nicely in -next.

Yours,
Linus Walleij
