From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: next-20170202 build: 4 failures 7 warnings (next-20170202)
Date: Fri, 3 Feb 2017 18:44:42 +0200
Message-ID: <20170203164442.GA3183@rapoport-lnx>
References: <E1cZEYY-0006f4-PQ@optimist>
 <CAP=VYLraQvfRLdFMVCiqS9DtH-GHNYdM+CYZ_hJ+K8GwWLKT+Q@mail.gmail.com>
 <20170203120123.ep5ceio5gzbnismn@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59771 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750937AbdBCQow (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2017 11:44:52 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v13GhU2u064976
        for <linux-next@vger.kernel.org>; Fri, 3 Feb 2017 11:44:52 -0500
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 28cv6ebtn9-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 03 Feb 2017 11:44:52 -0500
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Fri, 3 Feb 2017 16:44:49 -0000
Content-Disposition: inline
In-Reply-To: <20170203120123.ep5ceio5gzbnismn@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Andrew Morton <akpm@linux-foundation.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Hillf Danton <hillf.zj@alibaba-inc.com>, Michal Hocko <mhocko@suse.com>

On Fri, Feb 03, 2017 at 01:01:23PM +0100, Mark Brown wrote:
> On Thu, Feb 02, 2017 at 06:08:44PM -0500, Paul Gortmaker wrote:
> > On Thu, Feb 2, 2017 at 5:23 AM, Build bot for Mark Brown
> 
> > >         arm-allnoconfig
> > > ../mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'
> > > ../mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'
> 
> > Also in sfr build: http://kisskb.ellerman.id.au/kisskb/buildresult/12924855/
> 
> > Bisects as follows:
> 
> > 5b8d82e2e798609e113ec0dae37708f0578b68e2 is the first bad commit
> > commit 5b8d82e2e798609e113ec0dae37708f0578b68e2
> > Author: Mike Rapoport <rppt@linux.vnet.ibm.com>
> > Date:   Thu Feb 2 10:46:41 2017 +1100
> > 
> >     userfaultfd: non-cooperative: add event for memory unmaps
> 
> I'm seeing that showing up as 197b090832eaa4a6e in -next, adding the
> other people who acked/signed off on the commit.

Michal Hocko sent a fix yesterday:

http://www.spinics.net/lists/linux-mm/msg121252.html
