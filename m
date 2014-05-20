From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the pm tree with the samsung tree
Date: Tue, 20 May 2014 09:27:58 +0900
Message-ID: <013b01cf73c2$5bbe1fb0$133a5f10$@samsung.com>
References: <20140519125124.6504764d@canb.auug.org.au>
 <1911725.FzcK6v311f@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34115 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397AbaETA2E (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 May 2014 20:28:04 -0400
In-reply-to: <1911725.FzcK6v311f@vostro.rjw.lan>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "'Rafael J. Wysocki'" <rjw@rjwysocki.net>, 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Jonghwan Choi' <jhbird.choi@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>

Rafael J. Wysocki wrote:
> 
> On Monday, May 19, 2014 12:51:24 PM Stephen Rothwell wrote:
> >
> > --Sig_/n+GoYBpTr9ERl.sTIEYr/Og
> > Content-Type: text/plain; charset=US-ASCII
> > Content-Transfer-Encoding: quoted-printable
> >
> > Hi Rafael,
> >
> > Today's linux-next merge of the pm tree got conflicts in
> > drivers/cpufreq/exynos-cpufreq.c and drivers/cpufreq/exynos-cpufreq.h
> > between commit 2b07f4085479 ("cpufreq: exynos: Fix the compile error")
> > from the samsung tree and commit e5eaa445b0dc ("cpufreq: exynos: Use
> > dev_err/info function instead of pr_err/info") from the pm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> 
> Thanks for fixing that Stephen!
> 
Same here ;-)

> Kukjin, are you going to handle all Exynos cpufreq commits in the future?
> 
If you're OK, would be better to us I think.

- Kukjin
