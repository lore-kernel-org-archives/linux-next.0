From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: linux-next: build warning after merge of the pm tree
Date: Wed, 29 Oct 2014 23:23:38 +0800
Message-ID: <20141029152338.GA9571@wfg-t540p.sh.intel.com>
References: <20141029135129.40193e14@canb.auug.org.au>
 <1548287.VkQosq7gyk@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:55486 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933194AbaJ2PXn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2014 11:23:43 -0400
Content-Disposition: inline
In-Reply-To: <1548287.VkQosq7gyk@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 29, 2014 at 03:55:19PM +0100, Rafael J. Wysocki wrote:
> On Wednesday, October 29, 2014 01:51:29 PM Stephen Rothwell wrote:
> > Hi Rafael,
> 
> Hi,
> 
> > After merging the pm tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> > 
> > drivers/of/base.c: In function 'of_property_read_string_array':
> > drivers/of/base.c:1472:1: warning: control reaches end of non-void function [-Wreturn-type]
> >  }
> >  ^
> > 
> > Introduced by commit ef23586751cd ("Driver core: Unified device
> > properties interface for platform firmware").
> 
> Thanks for reporting this!
> 
> > Please don't ignore new warnings ...
> 
> I don't as a rule.  I'm not sure why I haven't seen that before (and the kbuild
> robot reports BUILD SUCCESS for that branch).

I do find the build error id:

-rw-rw-r-- 1 kbuild kbuild  272 2014-10-29 23:11 /kbuild-tests/build-error/drivers-of-base.c:warning:control-reaches-end-of-non-void-function

However there happens to be an old one half year ago. Since I never
delete old warnings, it prevents the reporting of the new warning on
your tree..

% cat /kbuild-tests/build-error/drivers-of-base.c:warning:control-reaches-end-of-non-void-function
drivers/of/base.c:1147:1: warning: control reaches end of non-void function [-Wreturn-type]

2014-04-17 02:59:49 lkp-ib04 socfpga-nex:socfpga_for_next_dts_overlays:bdb1f0c2cbe39db8f4a2ac4794001ba2e99cb65b i386-randconfig-i001-0414 f11752c03ccfd747a1f0740955682a
304933361c                         

The easiest way to fix it is to delete any old error/warnings that
have been *inactive* for more than 2 months (which means they are
likely fixed).

Thanks,
Fengguang
