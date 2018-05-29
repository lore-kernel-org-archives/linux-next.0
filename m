From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Tue, 29 May 2018 07:41:55 +0200
Message-ID: <20180529054155.GA31118@lst.de>
References: <20180529134209.4b8353f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180529134209.4b8353f1@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>, Alexei Starovoitov <ast@kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

> [Christoph, I noticed that the comment above datagram_poll in
> net/core/datagram.c needs the function name updated]

I'll send a fix for that.

> 
> I have added the following merge fix patch for today:

This looks correct, thanks!
