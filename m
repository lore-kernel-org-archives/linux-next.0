From: Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH] EDAC: Document HW_EVENT_ERR_DEFERRED type
Date: Thu, 1 Dec 2016 22:49:18 +0100
Message-ID: <20161201214918.wjt2axxmuca65qip@pd.tnic>
References: <20161201195753.rrxgwvltptq4gegp@yaz-fedora.dyhomenet>
 <1480623893-76399-1-git-send-email-Yazen.Ghannam@amd.com>
 <20161201202741.gb3lkeohdo26fofu@pd.tnic>
 <20161201193645.1b5e4f24@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53098 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751606AbcLAVtW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Dec 2016 16:49:22 -0500
Content-Disposition: inline
In-Reply-To: <20161201193645.1b5e4f24@vento.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Yazen Ghannam <Yazen.Ghannam@amd.com>, linux-next@vger.kernel.org

On Thu, Dec 01, 2016 at 07:36:45PM -0200, Mauro Carvalho Chehab wrote:
> I'm wandering if DEFERRED is the best name here... Maybe it could be
> called, instead HW_EVENT_ERR_NON_URGENT or something like that.

No, that's what the error is called in the hw documentation. It is
really a *deferred* uncorrectable error. Deferred in the sense that it
hasn't been consumed yet.

> Boris, yeah, I can take care on it. I'll send my pull request
> after yours, to avoid any issues.

Ok, cool.

Thanks.

-- 
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imendörffer, Jane Smithard, Graham Norton, HRB 21284 (AG Nürnberg)
-- 
