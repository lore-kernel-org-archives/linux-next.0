From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the staging
 tree
Date: Wed, 29 Nov 2017 11:18:42 +1100
Message-ID: <20171129111842.15572ff1@canb.auug.org.au>
References: <20171128081651.71a2e92a@canb.auug.org.au>
        <20171128194139.GA2653@kroah.com>
        <20171129095916.062d6f7d@canb.auug.org.au>
        <87609uymhr.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52511 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751402AbdK2ASo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Nov 2017 19:18:44 -0500
In-Reply-To: <87609uymhr.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Michael,

On Wed, 29 Nov 2017 11:09:04 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Isn't the update hook what you want?
> 
> Called by git-receive-pack:
> 
>    Before each ref is updated, if $GIT_DIR/hooks/update file exists and
>    is executable, it is invoked once per ref, with three parameters:
> 
>        $GIT_DIR/hooks/update refname sha1-old sha1-new

"This hook is invoked by git-receive-pack on the remote repository,
 which happens when a git push is done on a local repository."

-- 
Cheers,
Stephen Rothwell
