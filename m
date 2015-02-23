From: Corey Minyard <minyard@acm.org>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Sun, 22 Feb 2015 20:12:41 -0600
Message-ID: <54EA8C99.50000@acm.org>
References: <20150223102312.7029616b@canb.auug.org.au>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:46875 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752157AbbBWCMo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 22 Feb 2015 21:12:44 -0500
In-Reply-To: <20150223102312.7029616b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Corey Minyard <cminyard@mvista.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/22/2015 05:23 PM, Stephen Rothwell wrote:
> Hi Corey,
>
> While fetching the ipmi tree
> (git://git.code.sf.net/p/openipmi/linux-ipmi#for-next), I get this
> error:
>
> fatal: Couldn't find remote ref refs/heads/for-next
>
Hmm, I haven't touched that tag.  Sourceforge has been doing some
strange things lately, I'm wondering if I should switch to something
else.  I guess I could have accidentally deleted it, too.

Anyway, those changes are all in Linus' tree, so I just moved for-next
to master.

Thanks,

-corey
