From: Paul Moore <paul.moore@hp.com>
Subject: Re: linux-next: lblnet tree build failure
Date: Tue, 18 Nov 2008 09:26:11 -0500
Message-ID: <200811180926.11318.paul.moore@hp.com>
References: <20081118151112.aa7fa93d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g1t0027.austin.hp.com ([15.216.28.34]:18118 "EHLO
	g1t0027.austin.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750854AbYKRO0e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Nov 2008 09:26:34 -0500
In-Reply-To: <20081118151112.aa7fa93d.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Monday 17 November 2008 11:11:12 pm Stephen Rothwell wrote:
> Hi Paul,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> In file included from include/net/cipso_ipv4.h:43,
>                  from net/ipv4/ip_options.c:26:
> include/net/netlabel.h:512: error: redefinition of
> 'netlbl_cfg_cipsov4_add' include/net/netlabel.h:477: error: previous
> definition of 'netlbl_cfg_cipsov4_add' was here
> include/net/netlabel.h:517: error: redefinition of
> 'netlbl_cfg_cipsov4_del' include/net/netlabel.h:482: error: previous
> definition of 'netlbl_cfg_cipsov4_del' was here
> include/net/netlabel.h:522: error: conflicting types for
> 'netlbl_cfg_cipsov4_map_add' include/net/netlabel.h:490: error:
> previous definition of 'netlbl_cfg_cipsov4_map_add' was here
>
> I have dropped the lblnet tree for today.

Okay, sorry about that, I'll get it fixed up for tomorrow.

-- 
paul moore
linux @ hp
