From: Krzysztof Halasa <khc@pm.waw.pl>
Subject: Re: linux-next: manual merge of the hdlc tree
Date: Fri, 31 Oct 2008 18:50:09 +0100
Message-ID: <m3prlgfycu.fsf@maximus.localdomain>
References: <20081031162913.3cc30025.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from khc.piap.pl ([195.187.100.11]:59782 "EHLO khc.piap.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751373AbYJaRuM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 13:50:12 -0400
In-Reply-To: <20081031162913.3cc30025.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Fri\, 31 Oct 2008 16\:29\:13 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Today's linux-next merge of the hdlc tree got a conflict in
> Documentation/DocBook/wanbook.tmpl between commit
> 89a056df78b113fcab21d71cd24aa1893c09225b ("Rationalise Randy's address a
> bit") from Linus' tree and commit
> 8a8c8f08abe7d3fd82c2853d0e1f391f8bfc96db ("WAN: syncppp.c is no longer
> used by any kernel code. Remove it.") from the hdlc tree.
>
> The former updated a file that the latter removed.  I just removed it.

Thanks. I will request Jeff to pull this code soon (the tree will be
reset) so I hope the conflicts will end in few days.
-- 
Krzysztof Halasa
