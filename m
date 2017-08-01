From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Tree for Aug 1
Date: Tue, 1 Aug 2017 21:42:04 +0900
Message-ID: <20170801124204.GA457@jagdpanzerIV.localdomain>
References: <20170801173746.6962444d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170801173746.6962444d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

Hello,


seems that commit 979990c6284814617 ("tty: improve tty_insert_flip_char()
fast path") panics my kernel.

in particular, this part

@@ -26,7 +27,7 @@ static inline int tty_insert_flip_char(struct tty_port *port,
                *char_buf_ptr(tb, tb->used++) = ch;
                return 1;
        }
-       return tty_insert_flip_string_flags(port, &ch, &flag, 1);
+       return __tty_insert_flip_char(port, ch, flag);
 }



I see various callstacks, but all endup in llist_del_first() -> fatal exception
in interrupt -> panic()


...
uart_insert_char()
  __tty_insert_flip_char()
    __tty_buffer_request_room()
      llist_del_first()

or

...
kdb_event()
  puts_queue()
    __tty_insert_flip_char()
      __tty_buffer_request_room()
        llist_del_first()



to reproduce:

1) screen /dev/ttyS0 115200
2) send several chars down to /dev/ttyS0, enough to panic() the kernel.


reverting that __tty_insert_flip_char(port, ch, flag) seems to work
on my side.

	-ss
