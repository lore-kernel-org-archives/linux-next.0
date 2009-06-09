From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH] Bluetooth: depends on RFKILL
Date: Tue, 09 Jun 2009 17:22:24 +0200
Message-ID: <1244560944.3068.14.camel@localhost.localdomain>
References: <1244560060-28112-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from senator.holtmann.net ([87.106.208.187]:40412 "EHLO
	mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751493AbZFIPWY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 11:22:24 -0400
In-Reply-To: <1244560060-28112-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-bluetooth@vger.kernel.org

Hi Alexander,

> Since commit "Bluetooth: Add native RFKILL soft-switch support for all
> devices" (611b30f74b5) bluetooth depends on RFKILL.
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
>  net/bluetooth/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
> index 7725da9..85ec71d 100644
> --- a/net/bluetooth/Kconfig
> +++ b/net/bluetooth/Kconfig
> @@ -3,7 +3,7 @@
>  #
>  
>  menuconfig BT
> -	depends on NET && !S390
> +	depends on NET && RFKILL && !S390
>  	tristate "Bluetooth subsystem support"
>  	help
>  	  Bluetooth is low-cost, low-power, short-range wireless technology

this patch is wrong. I think it just needs an extra

	depends on RFKILL || !RFKILL

It is fine to compile Bluetooth without RFKILL support.

Regards

Marcel
