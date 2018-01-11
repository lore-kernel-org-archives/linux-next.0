From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: manual merge of the kspp tree with the net tree
Date: Thu, 11 Jan 2018 12:52:07 -0800
Message-ID: <CAGXu5j+QLEXhEap=emvz7kB7Z4gqucy_yy2RVfu1xrKq_hxx4A@mail.gmail.com>
References: <20180111154031.577c213b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180111154031.577c213b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Windsor <dave@nullcore.net>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 10, 2018 at 8:40 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> Today's linux-next merge of the kspp tree got a conflict in:
>
>   net/sctp/socket.c
>
> between commit:
>
>   c76f97c99ae6 ("sctp: make use of pre-calculated len")
>
> from the net tree and commit:
>
>   3511d716f5a8 ("sctp: Copy struct sctp_sock.autoclose to userspace using put_user()")
>
> from the kspp tree.
>
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks! And yes, confirmed, the kspp tree version should be used to
resolve this conflict.

-Kees

-- 
Kees Cook
Pixel Security
