From: Paul Moore <paul.moore@hp.com>
Subject: Re: linux-next: lblnet tree build warnings
Date: Fri, 13 Mar 2009 12:09:15 -0400
Message-ID: <200903131209.15880.paul.moore@hp.com>
References: <20090313163252.6333812e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g5t0009.atlanta.hp.com ([15.192.0.46]:32687 "EHLO
	g5t0009.atlanta.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751650AbZCMQJW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2009 12:09:22 -0400
In-Reply-To: <20090313163252.6333812e.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Friday 13 March 2009 01:32:52 am Stephen Rothwell wrote:
> Hi Paul,
>
> Today's linux-next build (powerpc ppc64_defconfig) produced these
> warnings:
>
> In file included from net/ipv4/ip_options.c:26:
> include/net/cipso_ipv4.h: In function 'cipso_v4_req_delattr':
> include/net/cipso_ipv4.h:264: warning: 'return' with a value, in function
> returning void In file included from net/ipv4/sysctl_net_ipv4.c:22:
> include/net/cipso_ipv4.h: In function 'cipso_v4_req_delattr':
> include/net/cipso_ipv4.h:264: warning: 'return' with a value, in function
> returning void

Thanks, those should now be fixed.

> Caused by commit d584c27edca286826e9145a3158f03e3bc81a6c0 ("netlabel:
> Label incoming TCP connections correctly in SELinux").  (BTW, that commit
> has no Signed-off-by.)

Yes, there are two or three patches in the lblnet-2.6_next tree that do not 
currently have sign-offs.  These patches are still undergoing review (RFC 
patches) and I'm not yet comfortable seeing these patches hit mainline and I 
found leaving off a sign-off is about the only reliable way to prevent patches 
from being merged.

I've included these RFC patches in the lblnet-2.6_next tree as a way to try 
and determine any merge difficulties with other upcoming work in advance as I 
do expect the patches to be signed-off for the 2.6.30 window.  If that goes 
against the current -next policy let me know and I'll remove them.

Thanks.

-- 
paul moore
linux @ hp
