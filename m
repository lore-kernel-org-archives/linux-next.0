From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: Re: linux-next: manual merge of the selinux tree with the net-next
 tree
Date: Fri, 9 Mar 2018 09:52:45 -0300
Message-ID: <20180309125244.GA5105@localhost.localdomain>
References: <20180305124054.09966cb0@canb.auug.org.au>
 <20180308130703.7365f733@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180308130703.7365f733@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul@paul-moore.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Haines <richard_c_haines@btinternet.com>, Xin Long <lucien.xin@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 08, 2018 at 01:07:03PM +1100, Stephen Rothwell wrote:
> The resolution now looks like below (there were more changes to this
> file in the net-next tree).  It will keep changing every time this file
> is touched :-(

Ugh, sorry for that, Stephen.

Considering how much of a hassle this already is, I'll hold off the
mtu refactoring I have and only post it when all this reaches Linus'
tree.  This refactoring is touching nearly every single line that the
SELinux patches touched too (where it added accounting for the IP
options) and the fixup would be a complete nightmare.

Probably I won't be able to post the sctp_outq_flush refactoring too,
but I have to check that more carefully.

  Marcelo
