From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Fixes tag needs some work in the tty.current tree
Date: Fri, 29 Mar 2019 20:47:18 +0100
Message-ID: <20190329194718.GE12004@kroah.com>
References: <20190328072734.2093d03c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190328072734.2093d03c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Razvan Stefanescu <razvan.stefanescu@microchip.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 28, 2019 at 07:27:34AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   69646d7a3689 ("tty/serial: atmel: RS485 HD w/DMA: enable RX after TX is stopped")
> 
> Fixes tag
> 
>   Fixes: b389f173aaa1 ("tty/serial: atmel: RS485 half duplex w/DMA: enable
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags across more than 1 line.

Is there a script somewhere that I can use to run on my tree before I
push it out, much like I do now for the signed-off-by checks?

thanks,

greg k-h
