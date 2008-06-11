From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [Rt2400-devel] next-20080611 rt2x00: build failure
Date: Wed, 11 Jun 2008 12:46:26 -0500 (CDT)
Message-ID: <32664704.1213206386295.JavaMail.oracle@acsmt301.oracle.com>
References: <20080611100748.d35829f4.randy.dunlap@oracle.com> <200806111948.49976.IvDoorn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:47651 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755303AbYFKRqm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jun 2008 13:46:42 -0400
In-Reply-To: <200806111948.49976.IvDoorn@gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rt2400-devel@lists.sourceforge.net, Ivo van Doorn <ivdoorn@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-next@vger.kernel.org

--- Original Message ---
> > when CONFIG_INPUT=n and
> > # CONFIG_NEW_LEDS is not set
> > CONFIG_LEDS_CLASS=y
> 
> Does below patch help?

Nope, sorry, same build errors.

> ---
> diff --git a/drivers/net/wireless/rt2x00/Kconfig
> b/drivers/net/wireless/rt2x00/Kconfig
> index 0ace761..c4d1f67 100644
> --- a/drivers/net/wireless/rt2x00/Kconfig
> +++ b/drivers/net/wireless/rt2x00/Kconfig
> @@ -36,6 +36,7 @@ config RT2X00_LIB_FIRMWARE
>  config RT2X00_LIB_RFKILL
>  	boolean
>  	depends on RT2X00_LIB
> +	depends on INPUT
>  	select RFKILL
>  	select INPUT_POLLDEV
>  

