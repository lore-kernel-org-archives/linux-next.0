From: Roland Dreier <roland@purestorage.com>
Subject: Re: [PATCH -next] infiniband: fix ipath_chip_init.c build errors
Date: Mon, 10 Oct 2011 12:02:29 -0700
Message-ID: <CAL1RGDWXV2=cYTRAvKuZbquOPS7n-p3NJkYnrzyK_ZAbKsJy6A@mail.gmail.com>
References: <20111007174230.702f4a0bf1fe71dab5e10961@canb.auug.org.au>
 <4E8F683D.9020604@xenotime.net> <CAL1RGDXoiRfR1Ku67tRgbhxzyWQmDrjKCztnVd6wbwi0Uud90Q@mail.gmail.com>
 <4E8F77B8.3000805@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys010aog111.obsmtp.com ([74.125.245.90]:50105 "HELO
	na3sys010aog111.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1754426Ab1JJTCu (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Oct 2011 15:02:50 -0400
In-Reply-To: <4E8F77B8.3000805@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mike Marciniszyn <infinipath@qlogic.com>, linux-rdma@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Fri, Oct 7, 2011 at 3:05 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> First I saw it was in today's linux-next (20111007).

Got it... a latent problem exposed by some include clean up, probably.

Applied, thanks.
