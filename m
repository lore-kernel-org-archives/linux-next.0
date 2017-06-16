From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Fri, 16 Jun 2017 13:31:44 +1000
Message-ID: <20170616133144.535aa23a@canb.auug.org.au>
References: <20170616113032.306720bf@canb.auug.org.au>
        <1497581467.17727.7.camel@gmail.com>
        <CAGXu5j+gcoqVT6sA-_Eu-Nm5P+58FuVfW=yof1ufpXaZeXC8zA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41167 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751835AbdFPDbr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jun 2017 23:31:47 -0400
In-Reply-To: <CAGXu5j+gcoqVT6sA-_Eu-Nm5P+58FuVfW=yof1ufpXaZeXC8zA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: Daniel Micay <danielmicay@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Hi Kees,

On Thu, 15 Jun 2017 20:20:47 -0700 Kees Cook <keescook@google.com> wrote:
>
> I'm so confused -- isn't this in next? All the build tests I did were
> against yesterday's -next which includes this from what I can see...

It is in next, but gets merged after the kspp tree ... so, this is when
inter-tree dependencies are a pain - I can merge the kspp tree later,
but then you have to remember which trees Linus must merge before you
send your pull request.  That's why we like to have all trees be
effectively stand alone (as much as possible).

-- 
Cheers,
Stephen Rothwell
