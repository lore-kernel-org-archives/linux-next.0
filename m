From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Fri, 27 Jan 2012 10:35:58 +0100
Message-ID: <201201271035.59156.rjw@sisk.pl>
References: <20120127125315.e6e70511badf68c4e760afc3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:52739 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751323Ab2A0JcX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jan 2012 04:32:23 -0500
In-Reply-To: <20120127125315.e6e70511badf68c4e760afc3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Frid <afrid@nvidia.com>, Antti Miettinen <amiettinen@nvidia.com>, Diwakar Tundlam <dtundlam@nvidia.com>, Scott Williams <scwilliams@nvidia.com>, Yu-Huan Hsu <yhsu@nvidia.com>, markgross <markgross@thegnar.org>, Linux PM mailing list <linux-pm@vger.kernel.org>

On Friday, January 27, 2012, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/power/process.c: In function 'thaw_kernel_threads':
> kernel/power/process.c:199:2: error: 'g' undeclared (first use in this function)
> kernel/power/process.c:199:2: note: each undeclared identifier is reported only once for each function it appears in
> kernel/power/process.c:199:2: error: 'p' undeclared (first use in this function)
> 
> Caused by commit 625278ca8016 ("PM / QoS: Simplify PM QoS expansion/merge").
> 
> Clearly never built :-(  At least, not in this form.
> 
> I have used the pm tree from next-20120125 for today.

Sorry for the breakage.

I took a broken version of that patch from my quilt queue by mistake,
should be fixed now.

Thanks,
Rafael
