From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rcu tree with Linus' tree
Date: Tue, 26 Sep 2017 13:42:19 +1000
Message-ID: <20170926134219.02b65fca@canb.auug.org.au>
References: <20170926130018.421ed780@canb.auug.org.au>
        <20170926032628.GT3521@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55237 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966548AbdIZDmV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Sep 2017 23:42:21 -0400
In-Reply-To: <20170926032628.GT3521@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>

Hi Paul,

On Mon, 25 Sep 2017 20:26:28 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
>
> This conflict will disappear tomorrow, as I have merged the commit
> from Linus's tree in place of mine and have added another commit that 
> removes the READ_ONCE()s.  Same result, but no conflict.  ;-)

Thanks, I figured something like that would happen.
-- 
Cheers,
Stephen Rothwell
