From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: linux-next: manual merge of the cris tree
Date: Thu, 15 Jan 2009 18:51:24 -0800
Message-ID: <1232074284.5786.0.camel@brick>
References: <20090116111127.3fc8dbd9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.171]:38748 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754456AbZAPCv1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Jan 2009 21:51:27 -0500
Received: by wf-out-1314.google.com with SMTP id 27so1628219wfd.4
        for <linux-next@vger.kernel.org>; Thu, 15 Jan 2009 18:51:26 -0800 (PST)
In-Reply-To: <20090116111127.3fc8dbd9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, linux-next@vger.kernel.org

On Fri, 2009-01-16 at 11:11 +1100, Stephen Rothwell wrote:
> Hi Jesper,
> 
> Today's linux-next merge of the cris tree got a conflict in
> arch/cris/include/arch-v32/arch/byteorder.h between commit
> aa0effbd1c0269ce7dd13be8dbf13e6b04f30ebd ("cris: introduce asm/swab.h")
> from Linus' tree and commit 0db42c6b23ce26b05b235dbe2e0aa096db194e33
> ("cris: use the new byteorder headers") from the cris tree.
> 
> There was also conflicts in arch/cris/include/asm/byteorder.h.
> 
> I have dropped the cris tree for today.  You should do a merge with
> Linus' tree and fix these conflicts.

Linus wanted a slightly different approach for the byteorder headers,
so the patch in the cris tree is now outdated.  Please drop it.


Cheers,

Harvey
