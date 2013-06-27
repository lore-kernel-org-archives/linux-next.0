From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH linux-next] fb: make fp_get_options name argument const
Date: Thu, 27 Jun 2013 10:51:31 +0200
Message-ID: <20130627085131.GJ305@game.jcrosoft.org>
References: <1371565386-23335-1-git-send-email-vincent.stehle@freescale.com>
 <51CAEAD5.40601@ti.com>
 <1927037966.2377585.1372310085417.JavaMail.root@redhat.com>
 <51CBDC28.9080808@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148]:59432 "EHLO
	mo5.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753458Ab3F0Iz1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 27 Jun 2013 04:55:27 -0400
Received: from mail30.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id C7434FF9B3F
	for <linux-next@vger.kernel.org>; Thu, 27 Jun 2013 10:55:24 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <51CBDC28.9080808@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: David Airlie <airlied@redhat.com>, Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@freescale.com>, linux-next@vger.kernel.org, linux-fbdev@vger.kernel.org, trivial@kernel.org

On 09:31 Thu 27 Jun     , Tomi Valkeinen wrote:
> On 27/06/13 08:14, David Airlie wrote:
> >>>
> >>>
> >>> Hi,
> >>>
> >>> I remarked this warning while building linux-next with imx_v6_v7_defconfig.
> >>> Is changing fb_get_options prototype "permitted", please?
> >>
> >> I don't see how changing the parameter to const could break anything, so
> >> I've applied this to fbdev-3.11 branch.
> >>
> > 
> > Hi Tomi,
> > 
> > What tree does Jean-Christophe PLAGNIOL-VILLARD control?
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/plagnioj/linux-fbdev.git
> 
> > he said he merged the original patch to fix this from Ville, but I've no idea
> > where it ended up, so I just didn't merge it to drm-next at the time.
> > 
> > Message-Id: <1370619787-15341-3-git-send-email-ville.syrjala@linux.intel.com>
> > 
> > is the original properly attributed fix.
> 
> Hmm, ok. He asked me to collect fbdev patches as he's been away, so I
> went through my inbox and picked up what's there. I can't see the patch
> from Ville in Jean-Christophe's tree.
> 
> Jean-Christophe, have you taken that (and maybe other patches) but you
> haven't pushed them to the kernel.org tree?

Sorry get seek for few days and did not push my tree (too much tired)

I'm pushing it today

Best Regards,
J.
