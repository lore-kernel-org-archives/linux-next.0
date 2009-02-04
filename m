From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for February 4 (sound/isa/msnd)
Date: Wed, 04 Feb 2009 09:19:06 -0800
Message-ID: <4989CE0A.6060603@oracle.com>
References: <20090204192215.1045f2aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:18321 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752127AbZBDRTX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2009 12:19:23 -0500
In-Reply-To: <20090204192215.1045f2aa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090203:
> 
> Undropped trees:
> 	sound


When CONFIG_PNP=n:

sound/isa/msnd/msnd_pinnacle.c:891: error: 'isapnp' undeclared (first use in this function)



-- 
~Randy
