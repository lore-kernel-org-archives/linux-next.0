From: Steve Sakoman <steve@sakoman.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Thu, 4 Oct 2018 06:34:31 -1000
Message-ID: <CAOSpxdYzm6fTd88gP_OdrTuqbf-kJr3t+3ObPU9vMCHqYJSgHg@mail.gmail.com>
References: <20181004151501.280d8282@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004151501.280d8282@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: Greg Kroah-Hartman <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Steinmetz <ast@domdv.de>, Eric C Gallimore <egallimore@ucsd.edu>
List-Id: linux-next.vger.kernel.org

Interesting indeed. Who would have thought someone would be using the
"unused" padding variable!

How would folks prefer we fix this, in the referenced patch or by
eliminating the use of "unused" in samsung.c?

Steve
On Wed, Oct 3, 2018 at 7:19 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the tty tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/tty/serial/samsung.c: In function 's3c24xx_serial_rx_enable':
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:138:2: note: in expansion of macro 'rx_enabled'
>   rx_enabled(port) = 1;
>   ^~~~~~~~~~
> drivers/tty/serial/samsung.c: In function 's3c24xx_serial_rx_disable':
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:153:2: note: in expansion of macro 'rx_enabled'
>   rx_enabled(port) = 0;
>   ^~~~~~~~~~
> drivers/tty/serial/samsung.c: In function 's3c24xx_serial_stop_tx':
> drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither array nor pointer nor vector
>  #define tx_enabled(port) ((port)->unused[0])
>                                          ^
> drivers/tty/serial/samsung.c:165:7: note: in expansion of macro 'tx_enabled'
>   if (!tx_enabled(port))
>        ^~~~~~~~~~
> drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither array nor pointer nor vector
>  #define tx_enabled(port) ((port)->unused[0])
>                                          ^
> drivers/tty/serial/samsung.c:185:2: note: in expansion of macro 'tx_enabled'
>   tx_enabled(port) = 0;
>   ^~~~~~~~~~
> drivers/tty/serial/samsung.c: In function 's3c24xx_serial_start_tx':
> drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither array nor pointer nor vector
>  #define tx_enabled(port) ((port)->unused[0])
>                                          ^
> drivers/tty/serial/samsung.c:343:7: note: in expansion of macro 'tx_enabled'
>   if (!tx_enabled(port)) {
>        ^~~~~~~~~~
> drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither array nor pointer nor vector
>  #define tx_enabled(port) ((port)->unused[0])
>                                          ^
> drivers/tty/serial/samsung.c:347:3: note: in expansion of macro 'tx_enabled'
>    tx_enabled(port) = 1;
>    ^~~~~~~~~~
> drivers/tty/serial/samsung.c: In function 's3c24xx_serial_stop_rx':
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:392:6: note: in expansion of macro 'rx_enabled'
>   if (rx_enabled(port)) {
>       ^~~~~~~~~~
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:399:3: note: in expansion of macro 'rx_enabled'
>    rx_enabled(port) = 0;
>    ^~~~~~~~~~
> drivers/tty/serial/samsung.c: In function 's3c24xx_serial_rx_drain_fifo':
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:621:8: note: in expansion of macro 'rx_enabled'
>     if (rx_enabled(port)) {
>         ^~~~~~~~~~
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:623:6: note: in expansion of macro 'rx_enabled'
>       rx_enabled(port) = 0;
>       ^~~~~~~~~~
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:631:6: note: in expansion of macro 'rx_enabled'
>       rx_enabled(port) = 1;
>       ^~~~~~~~~~
> drivers/tty/serial/samsung.c: In function 's3c24xx_serial_shutdown':
> drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither array nor pointer nor vector
>  #define tx_enabled(port) ((port)->unused[0])
>                                          ^
> drivers/tty/serial/samsung.c:981:3: note: in expansion of macro 'tx_enabled'
>    tx_enabled(port) = 0;
>    ^~~~~~~~~~
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:990:3: note: in expansion of macro 'rx_enabled'
>    rx_enabled(port) = 0;
>    ^~~~~~~~~~
> drivers/tty/serial/samsung.c: In function 's3c24xx_serial_startup':
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:1015:2: note: in expansion of macro 'rx_enabled'
>   rx_enabled(port) = 1;
>   ^~~~~~~~~~
> drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither array nor pointer nor vector
>  #define tx_enabled(port) ((port)->unused[0])
>                                          ^
> drivers/tty/serial/samsung.c:1029:2: note: in expansion of macro 'tx_enabled'
>   tx_enabled(port) = 1;
>   ^~~~~~~~~~
> drivers/tty/serial/samsung.c: In function 's3c64xx_serial_startup':
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:1080:2: note: in expansion of macro 'rx_enabled'
>   rx_enabled(port) = 1;
>   ^~~~~~~~~~
> drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither array nor pointer nor vector
>  #define tx_enabled(port) ((port)->unused[0])
>                                          ^
> drivers/tty/serial/samsung.c:1082:2: note: in expansion of macro 'tx_enabled'
>   tx_enabled(port) = 0;
>   ^~~~~~~~~~
> drivers/tty/serial/samsung.c: In function 's3c24xx_serial_resume_noirq':
> drivers/tty/serial/samsung.c:86:41: error: subscripted value is neither array nor pointer nor vector
>  #define tx_enabled(port) ((port)->unused[0])
>                                          ^
> drivers/tty/serial/samsung.c:1966:8: note: in expansion of macro 'tx_enabled'
>     if (tx_enabled(port))
>         ^~~~~~~~~~
> drivers/tty/serial/samsung.c:87:41: error: subscripted value is neither array nor pointer nor vector
>  #define rx_enabled(port) ((port)->unused[1])
>                                          ^
> drivers/tty/serial/samsung.c:1968:8: note: in expansion of macro 'rx_enabled'
>     if (rx_enabled(port))
>         ^~~~~~~~~~
>
> Caused by commit
>
>   c550f01c810f ("serial:serial_core: Allow use of CTS for PPS line discipline")
>
> Looks like a suprise from some "interesting" previous development.
>
> I have used the tty tree from next-20181003 for today.
> --
> Cheers,
> Stephen Rothwell
