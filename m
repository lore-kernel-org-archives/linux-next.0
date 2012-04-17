From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH -next] tty: add missing tty_port_tty_get() call to raw3215_wakeup
Date: Tue, 17 Apr 2012 14:35:32 +0200
Message-ID: <4F8D6394.7070905@suse.cz>
References: <20120417111634.GA4382@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:59614 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932155Ab2DQMfj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Apr 2012 08:35:39 -0400
Received: by wibhj6 with SMTP id hj6so516201wib.1
        for <linux-next@vger.kernel.org>; Tue, 17 Apr 2012 05:35:38 -0700 (PDT)
In-Reply-To: <20120417111634.GA4382@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On 04/17/2012 01:16 PM, Heiko Carstens wrote:
> Fix compile error caused by "TTY: con3215, use tty from tty_port":
> 
>  CC      drivers/s390/char/con3215.o
> drivers/s390/char/con3215.c: In function 'raw3215_wakeup':
> drivers/s390/char/con3215.c:339:16: error: 'struct raw3215_info' has no member named 'tty'
> make[1]: *** [drivers/s390/char/con3215.o] Error 1
> make: *** [drivers/s390/char/] Error 2

Aha, that's because I rebased the tasklet removal patch on the top of
the other two patches so I don't see the error in my local tree.

> Cc: Jiri Slaby <jslaby@suse.cz>

Acked-by: Jiri Slaby <jslaby@suse.cz>

and thanks.

> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> ---
>  drivers/s390/char/con3215.c |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/s390/char/con3215.c b/drivers/s390/char/con3215.c
> index e928e04..6c0116d 100644
> --- a/drivers/s390/char/con3215.c
> +++ b/drivers/s390/char/con3215.c
> @@ -336,7 +336,11 @@ static inline void raw3215_try_io(struct raw3215_info *raw)
>  static void raw3215_wakeup(unsigned long data)
>  {
>  	struct raw3215_info *raw = (struct raw3215_info *) data;
> -	tty_wakeup(raw->tty);
> +	struct tty_struct *tty;
> +
> +	tty = tty_port_tty_get(&raw->port);
> +	tty_wakeup(tty);
> +	tty_kref_put(tty);
>  }
>  
>  /*
> 
-- 
js
suse labs
