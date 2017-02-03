From: Michal Hocko <mhocko@kernel.org>
Subject: Re: next-20170202 build: 4 failures 7 warnings (next-20170202)
Date: Fri, 3 Feb 2017 18:21:12 +0100
Message-ID: <20170203172110.GK19325@dhcp22.suse.cz>
References: <E1cZEYY-0006f4-PQ@optimist>
 <CAP=VYLraQvfRLdFMVCiqS9DtH-GHNYdM+CYZ_hJ+K8GwWLKT+Q@mail.gmail.com>
 <20170203120123.ep5ceio5gzbnismn@sirena.org.uk>
 <20170203164442.GA3183@rapoport-lnx>
 <CAK8P3a3MkTfHyHi=ggrvygV-tCSP+2=jNuT_kX-GKt5d=FYtkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49843 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750879AbdBCRVS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Feb 2017 12:21:18 -0500
Content-Disposition: inline
In-Reply-To: <CAK8P3a3MkTfHyHi=ggrvygV-tCSP+2=jNuT_kX-GKt5d=FYtkQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>, Mark Brown <broonie@kernel.org>, linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Hillf Danton <hillf.zj@alibaba-inc.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Fri 03-02-17 18:04:41, Arnd Bergmann wrote:
> On Fri, Feb 3, 2017 at 5:44 PM, Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> 
> >> >     userfaultfd: non-cooperative: add event for memory unmaps
> >>
> >> I'm seeing that showing up as 197b090832eaa4a6e in -next, adding the
> >> other people who acked/signed off on the commit.
> >
> > Michal Hocko sent a fix yesterday:
> >
> > http://www.spinics.net/lists/linux-mm/msg121252.html
> 
> Sorry I missed that, and sent another copy now. It seems that Michal
> only fixed mm/nommu.c though, while I caught another hunk in ipc/shm.c
> that also needs to be fixed.

I have missed that one because the microblaze allnoconfig doesn't have
CONFIG_SYSVIPC enabled. Thanks for catching that.
 
> Let me know if I should resend that one line change by itself.

ip/shm.c fix up should be sent to Andrew so that he can fold it into the
original patch.
-- 
Michal Hocko
SUSE Labs
