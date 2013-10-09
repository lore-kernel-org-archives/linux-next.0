From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the tty-next tree
Date: Tue, 8 Oct 2013 23:19:20 -0700
Message-ID: <20131009061920.GA5645@kroah.com>
References: <1381239855-16314-1-git-send-email-treding@nvidia.com>
 <1381239855-16314-5-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1381239855-16314-5-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Sascha Hauer <s.hauer@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Oct 08, 2013 at 03:44:15PM +0200, Thierry Reding wrote:
> Today's linux-next merge of the tty-next tree got a conflict in
> 
> 	drivers/tty/serial/imx.c
> 
> caused by commits e2c2725 (serial: imx: Use NULL as the last argument of
> add_preferred_console()) and b4e788d (Revert "serial: i.MX: evaluate
> linux,stdout-path property").
> 
> The former commit only changes a parameter from 0 to NULL I assume it
> doesn't solve the build breakage mentioned as reason for the revert, so
> I kept the reversion.

That sounds correct, thanks.

greg k-h
