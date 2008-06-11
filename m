From: "Felipe Balbi" <felipebalbi@users.sourceforge.net>
Subject: Re: [ANNOUNCE] linux-staging tree created
Date: Wed, 11 Jun 2008 03:07:30 +0300
Message-ID: <31e679430806101707s357e4b0dm79c3f9a95c784320@mail.gmail.com>
References: <20080610190540.GA25066@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.189]:20158 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754488AbYFKAHc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Jun 2008 20:07:32 -0400
Received: by fk-out-0910.google.com with SMTP id 18so1658221fkq.5
        for <linux-next@vger.kernel.org>; Tue, 10 Jun 2008 17:07:31 -0700 (PDT)
In-Reply-To: <20080610190540.GA25066@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, linux-next@vger.kernel.org, kernel-janitors@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

hi,

On Tue, Jun 10, 2008 at 10:05 PM, Greg KH <greg@kroah.com> wrote:
> Oh great, not yet-another-kernel-tree, just what the world needs...
>
> Yes, this is an announcement of a new kernel tree, linux-staging.  It is
> a quilt series of patches that can be found at:
>        git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>
>
> In a long and meandering thread with some of the other kernel developers
> a week or so ago, it came up that there is no single place for companies
> and developers to put their code for testing while it gets cleaned up
> for submission into the kernel tree.  All of the different subsystems
> have trees, but they generally only want code that is about to go into
> this release, or the next one.  For stuff that is farther off, there is
> no place to go.

That's great. I started working on the test and measurement class
driver. Do you want me to send preliminary patches or just the final
one ?

-- 
Best Regards,

Felipe Balbi
felipebalbi@users.sourceforge.net
