From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for Aug 1
Date: Tue, 1 Aug 2017 15:28:32 +0200
Message-ID: <CAK8P3a3vOHteTswgXr+9cO-wX2HGVb_GXd3w3bByZLR=36MXFg@mail.gmail.com>
References: <20170801173746.6962444d@canb.auug.org.au> <20170801124204.GA457@jagdpanzerIV.localdomain>
 <CAK8P3a2dUdOf4OTLBEMLAVYXSpMyqFSHsRShz7aLEYBjViw61A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a2dUdOf4OTLBEMLAVYXSpMyqFSHsRShz7aLEYBjViw61A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 1, 2017 at 3:20 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Aug 1, 2017 at 2:42 PM, Sergey Senozhatsky
> <sergey.senozhatsky.work@gmail.com> wrote:
>> Hello,
>>
>>
>> seems that commit 979990c6284814617 ("tty: improve tty_insert_flip_char()
>> fast path") panics my kernel.
>>
>> in particular, this part
>
> Looking into it now, sorry for the breakage.

Does this fix it? I definitely got this part wrong as I see now, we must
look up the 'tail' after calling __tty_buffer_request_room, not before.

      Arnd

diff --git a/drivers/tty/tty_buffer.c b/drivers/tty/tty_buffer.c
index 6a8563633d4b..f8eba1c5412f 100644
--- a/drivers/tty/tty_buffer.c
+++ b/drivers/tty/tty_buffer.c
@@ -372,12 +372,13 @@ EXPORT_SYMBOL(tty_insert_flip_string_flags);
  */
 int __tty_insert_flip_char(struct tty_port *port, unsigned char ch, char flag)
 {
-       struct tty_buffer *tb = port->buf.tail;
+       struct tty_buffer *tb;
        int flags = (flag == TTY_NORMAL) ? TTYB_NORMAL : 0;

        if (!__tty_buffer_request_room(port, 1, flags))
                return 0;

+       tb = port->buf.tail;
        if (~tb->flags & TTYB_NORMAL)
                *flag_buf_ptr(tb, tb->used) = flag;
        *char_buf_ptr(tb, tb->used++) = ch;
