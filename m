From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Sat, 22 Aug 2015 09:40:03 +1000
Message-ID: <1440200403.13795.1.camel@ellerman.id.au>
References: <20150821182535.4423868e@canb.auug.org.au>
	 <55D6E86E.105@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40871 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751792AbbHUXkG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 21 Aug 2015 19:40:06 -0400
In-Reply-To: <55D6E86E.105@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anshuman Khandual <khandual@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>

On Fri, 2015-08-21 at 14:29 +0530, Vasant Hegde wrote:
> On 08/21/2015 01:55 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the nvdimm tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> 
> Stephen,
> 
> Thanks for reporting! I checked powerpc tree.. This is because of commit
> 8a8d9181 in powerpc tree.. Basically Michael missed one hunk (below hunk in
> opal-api.h)

Hmm, looks like it.

I do remember the patch didn't apply to my tree, so I guess I accidentally
dropped a hunk when I was forcing it to apply.

I also should have looked closer, as the following aren't in the skiboot
version of opal-api.h. The skiboot and Linux versions of opal-api.h should be
in sync as much as possible.

> +/* LED Mode */
> +#define POWERNV_LED_MODE_LIGHT_PATH    "lightpath"
> +#define POWERNV_LED_MODE_GUIDING_LIGHT "guidinglight"
> +
> +/* LED type */
> +#define POWERNV_LED_TYPE_IDENTIFY      "identify"
> +#define POWERNV_LED_TYPE_FAULT         "fault"
> +#define POWERNV_LED_TYPE_ATTENTION     "attention"

Furthermore, I don't see the first two used at all, and the bottom three are
only used in one place in the driver. So I've just sucked the values into the
driver code and dropped the #defines. Patch coming shortly.

Also we're obviously not building this in any of our defconfigs. Can you please
send a patch to enable it for pseries_defconfig and ppc64_defconfig.

cheers
