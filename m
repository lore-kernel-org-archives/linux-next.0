From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: manual merge of the async_tx tree with Linus' tree
Date: Fri, 27 May 2011 09:53:36 +0200
Message-ID: <20110527095336.25007886@endymion.delvare>
References: <20110527133003.8299b429.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:32778 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752470Ab1E0HzQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 May 2011 03:55:16 -0400
In-Reply-To: <20110527133003.8299b429.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Havard Skinnemoen <hskinnemoen@gmail.com>, Jiri Kosina <jkosina@suse.cz>, Viresh Kumar <viresh.kumar@st.com>

Hi Stephen, Dan,

On Fri, 27 May 2011 13:30:03 +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the async_tx tree got a conflict in
> drivers/dma/dw_dmac.c between commit e05503ef1186 ("Haavard Skinnemoen
> has left Atmel") from Linus' tree and commit aecb7b64dd9e
> ("dmaengine/dw_dmac: Update maintainer-ship") from the async_tx tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Dan's patch is just plain wrong. MODULE_AUTHOR is about who wrote the
code, not who maintains it. A change of maintainer should lead to an
update or addition to file MAINTAINERS.

Thanks Viresh for stepping in, BTW, new maintainers are always welcome.

(As a side note, the relevance of MODULE_AUTHOR given the development
and maintenance model the Linux kernel has embraced can certainly be
discussed, but that's a different story.)

-- 
Jean Delvare
