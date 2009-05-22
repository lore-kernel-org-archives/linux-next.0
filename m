From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for May 22 (staging/)
Date: Fri, 22 May 2009 09:05:46 -0700
Message-ID: <4A16CD5A.9050806@xenotime.net>
References: <20090522185110.3f95b03e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:57605 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752133AbZEVQDO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 May 2009 12:03:14 -0400
Received: from ::ffff:71.182.83.218 ([71.182.83.218]) by xenotime.net for <linux-next@vger.kernel.org>; Fri, 22 May 2009 09:03:12 -0700
In-Reply-To: <20090522185110.3f95b03e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090521:


Saw these build warnings on x86_64:

drivers/staging/agnx/pci.c:64:3: warning: "/*" within comment
drivers/staging/agnx/pci.c:223:2: warning: "/*" within comment

drivers/staging/slicoss/slicoss.c:1875:warning: unused variable 'failure'
drivers/staging/stlc45xx/stlc45xx.c:2240: warning: 'struct ieee80211_if_conf' declared inside parameter list
drivers/staging/stlc45xx/stlc45xx.c:2240: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/staging/stlc45xx/stlc45xx.c:2248: error: dereferencing pointer to incomplete type
drivers/staging/stlc45xx/stlc45xx.c:2248: error: dereferencing pointer to incomplete type
drivers/staging/stlc45xx/stlc45xx.c:2360: error: unknown field 'config_interface' specified in initializer
drivers/staging/stlc45xx/stlc45xx.c:2522: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'long unsigned int'
drivers/staging/stlc45xx/stlc45xx.c:2524: warning: format '%x' expects type 'unsigned int', but argument 2 has type 'long unsigned int'
drivers/staging/stlc45xx/stlc45xx.c:2524: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'long unsigned int'

drivers/staging/rt3070/common/../../rt2870/common/../../rt2860/common/spectrum.c:1577: warning: format '%d' expects type 'int', but argument 3 has type 'long unsigned int'
drivers/staging/rt3070/../rt2870/../rt2860/rt_linux.c:841: warning: format '%d' expects type 'int', but argument 3 has type 'long unsigned int'



There are also 2 outstanding patches for comedi build failures that need to
be applied so that more work can be done on comedi....

-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
