From: "Eric Miao" <eric.y.miao@gmail.com>
Subject: Re: linux-next: manual merge of the pxa tree
Date: Fri, 19 Sep 2008 03:00:06 +0800
Message-ID: <f17812d70809181200i356f013aoeac6dc1785cacae2@mail.gmail.com>
References: <20080919044626.bdec6d1a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.226]:29239 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754288AbYIRTAH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Sep 2008 15:00:07 -0400
Received: by rv-out-0506.google.com with SMTP id k40so42826rvb.1
        for <linux-next@vger.kernel.org>; Thu, 18 Sep 2008 12:00:07 -0700 (PDT)
In-Reply-To: <20080919044626.bdec6d1a.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

On Fri, Sep 19, 2008 at 2:46 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Eric,
>
> Today's linux-next merge of the pxa tree got a lot of conflicts against
> the arm tree.  Unfortunately, I don't have time today to resolve them, so
> you should probably rebase your tree on the arm tree (or merge the arm
> tree into yours) and resolve the conflicts.

Done. Most of the patches have been merged into the arm tree, so I just
reset the 'for-next' to the mainline again.

Sorry for the noise.
