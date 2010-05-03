From: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: RE: linux-next: build warnings after merge of the
 driver-core.current tree
Date: Mon, 3 May 2010 14:19:26 +0300
Message-ID: <6F5C1D715B2DA5498A628E6B9C124F04016E727F00@hasmsx504.ger.corp.intel.com>
References: <20100503100137.a05c9098.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:56605 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757824Ab0ECLTg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 May 2010 07:19:36 -0400
In-Reply-To: <20100503100137.a05c9098.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>



> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Monday, May 03, 2010 3:02 AM
> To: Greg KH
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; David
> Woodhouse; Winkler, Tomas
> Subject: linux-next: build warnings after merge of the driver-core.current
> tree
> 
> Hi Greg,
> 
> After merging the driver-core.current tree, today's linux-next build
> (powerpc ppc64_defconfig and x86_64 allmodconfig) produced these warning:
>
> drivers/pcmcia/ds.c: In function 'pcmcia_load_firmware':
> drivers/pcmcia/ds.c:761: warning: passing argument 1 of 'release_firmware'
> discards qualifiers from pointer target type
> include/linux/firmware.h:46: note: expected 'struct firmware *' but argument
> is of type 'const struct firmware *'
> drivers/net/cxgb3/cxgb3_main.c: In function 't3_get_edc_fw':
> drivers/net/cxgb3/cxgb3_main.c:1084: warning: passing argument 1 of
> 'release_firmware' discards qualifiers from pointer target type
> include/linux/firmware.h:46: note: expected 'struct firmware *' but argument
> is of type 'const struct firmware *'
> 
> and *lots* more similar warnings ...
> 
> Caused by commit d5ae47f7d90f94a15e668f389c12211a11798b6f
> ("firmware_class: fix memory leak - free allocated pages").  This patch was
> modified from an earlier version that produced different (though many
> fewer) warnings.

Yesterday I posted the fixed version (v3) of this patch http://marc.info/?l=linux-kernel&m=127278850518085&w=2
Thanks
Tomas

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
