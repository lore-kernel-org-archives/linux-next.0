From: Kevin Hilman <khilman@linaro.org>
Subject: Re: mmotm 2013-08-27-16-51 uploaded
Date: Thu, 5 Sep 2013 13:05:38 -0700
Message-ID: <CAGa+x85d-RWYPkmTVapzcYFEzPhUU7YLJHZVGK0cGc=AudYubQ@mail.gmail.com>
References: <20130827235227.99DB95A41D6@corp2gmr1-2.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:54933 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755660Ab3IEUFj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Sep 2013 16:05:39 -0400
Received: by mail-we0-f169.google.com with SMTP id t60so2183501wes.0
        for <linux-next@vger.kernel.org>; Thu, 05 Sep 2013 13:05:38 -0700 (PDT)
In-Reply-To: <20130827235227.99DB95A41D6@corp2gmr1-2.hot.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: mm-commits@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, vbabka@suse.cz, Olof Johansson <olof@lixom.net>

On Tue, Aug 27, 2013 at 4:52 PM,  <akpm@linux-foundation.org> wrote:

> This mmotm tree contains the following patches against 3.11-rc7:
> (patches marked "*" will be included in linux-next)

[...]

> * mm-munlock-manual-pte-walk-in-fast-path-instead-of-follow_page_mask.patch

As has already been pointed out[1], this one introduced a new warning
in -next (also lovingly acknowledged in the mmotm series file[2]) and
it seems that Vlastimil has posted an updated version[3].  Any plans
to pick up the new version for -next (or at least drop the one causing
the new warning?)

Kevin


[1] http://marc.info/?l=linux-mm&m=137764226521459&w=2
[2] http://www.ozlabs.org/~akpm/mmotm/series
[2] http://marc.info/?l=linux-mm&m=137778135631351&w=2
