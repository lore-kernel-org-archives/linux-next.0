From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv2] staging/winbond: fix a style error
Date: Fri, 25 Apr 2014 14:06:18 -0700
Message-ID: <20140425210618.GA24727@kroah.com>
References: <20140325143637.GA1477@powerline.azcom-win.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:50346 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812AbaDYVD0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Apr 2014 17:03:26 -0400
Content-Disposition: inline
In-Reply-To: <20140325143637.GA1477@powerline.azcom-win.it>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michele Curti <michele.curti@gmail.com>
Cc: linux-next@vger.kernel.org, pavel@ucw.cz

On Tue, Mar 25, 2014 at 03:36:37PM +0100, Michele Curti wrote:
> 
> Removed a few spaces that cause coding style error.
> 
> Signed-off-by: Michele Curti <michele.curti@gmail.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> ---
>  drivers/staging/winbond/wb35tx_s.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/drivers/staging/winbond/wb35tx_s.h b/drivers/staging/winbond/wb35tx_s.h
> index 715f87d..dc12008 100644
> --- a/drivers/staging/winbond/wb35tx_s.h
> +++ b/drivers/staging/winbond/wb35tx_s.h
> @@ -12,7 +12,7 @@
>  /* Internal variable for module */
>  struct wb35_tx {
>         /* For Tx buffer */
> -       u8      TxBuffer[ MAX_USB_TX_BUFFER_NUMBER ][ MAX_USB_TX_BUFFER ];
> +       u8      TxBuffer[MAX_USB_TX_BUFFER_NUMBER][MAX_USB_TX_BUFFER];
> 
>         /* For Interrupt pipe */
>         u8      EP2_buf[MAX_INTERRUPT_LENGTH];

The patch is whitespace damaged and can not be applied :(
