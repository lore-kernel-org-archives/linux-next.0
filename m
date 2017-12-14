From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the v4l-dvb-next tree with the vfs
 tree
Date: Fri, 15 Dec 2017 09:43:48 +1100
Message-ID: <20171215094348.63f4da81@canb.auug.org.au>
References: <20171211112854.42a7a70a@canb.auug.org.au>
        <20171214141913.5c6ede97@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35201 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753990AbdLNWnv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Dec 2017 17:43:51 -0500
In-Reply-To: <20171214141913.5c6ede97@vento.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Young <sean@mess.org>

Hi Mauro,

On Thu, 14 Dec 2017 14:19:13 -0200 Mauro Carvalho Chehab <mchehab@osg.samsung.com> wrote:
>
> FYI,
> 
> I had to rebase the patch series on the top of media tree.
> 
> You'll likely be facing the same conflicts with vfs after the
> rebase, with different changeset identifiers.

Thanks for letting me know ... it was fine ("git rerere" is very useful :-))

-- 
Cheers,
Stephen Rothwell
