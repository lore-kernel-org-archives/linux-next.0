From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the staging tree
Date: Wed, 29 Nov 2017 11:09:04 +1100
Message-ID: <87609uymhr.fsf@concordia.ellerman.id.au>
References: <20171128081651.71a2e92a@canb.auug.org.au> <20171128194139.GA2653@kroah.com> <20171129095916.062d6f7d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60305 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751239AbdK2AJG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Nov 2017 19:09:06 -0500
In-Reply-To: <20171129095916.062d6f7d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Greg,
>
> On Tue, 28 Nov 2017 20:41:39 +0100 Greg KH <greg@kroah.com> wrote:
>>
>> I need to set up a git hook for this :(
>
> I couldn't find an appropriate hook for fetching or merging other
> trees :-( Instead I run the attached script below after each fetch.

Isn't the update hook what you want?

Called by git-receive-pack:

   Before each ref is updated, if $GIT_DIR/hooks/update file exists and
   is executable, it is invoked once per ref, with three parameters:

       $GIT_DIR/hooks/update refname sha1-old sha1-new

cheers
