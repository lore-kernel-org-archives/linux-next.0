From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: [PATCH] EDAC: Document HW_EVENT_ERR_DEFERRED type
Date: Thu, 1 Dec 2016 20:00:15 -0200
Message-ID: <20161201200015.616247fc@vento.lan>
References: <20161201195753.rrxgwvltptq4gegp@yaz-fedora.dyhomenet>
        <1480623893-76399-1-git-send-email-Yazen.Ghannam@amd.com>
        <20161201202741.gb3lkeohdo26fofu@pd.tnic>
        <20161201193645.1b5e4f24@vento.lan>
        <20161201214918.wjt2axxmuca65qip@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:59821
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752572AbcLAWAX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2016 17:00:23 -0500
In-Reply-To: <20161201214918.wjt2axxmuca65qip@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@suse.de>
Cc: Yazen Ghannam <Yazen.Ghannam@amd.com>, linux-next@vger.kernel.org

Em Thu, 1 Dec 2016 22:49:18 +0100
Borislav Petkov <bp@suse.de> escreveu:

> On Thu, Dec 01, 2016 at 07:36:45PM -0200, Mauro Carvalho Chehab wrote:
> > I'm wandering if DEFERRED is the best name here... Maybe it could be
> > called, instead HW_EVENT_ERR_NON_URGENT or something like that.  
> 
> No, that's what the error is called in the hw documentation. It is
> really a *deferred* uncorrectable error. Deferred in the sense that it
> hasn't been consumed yet.

OK.

> > Boris, yeah, I can take care on it. I'll send my pull request
> > after yours, to avoid any issues.  
> 
> Ok, cool.
> 
> Thanks.

Patch applied.

Thanks!
Mauro
