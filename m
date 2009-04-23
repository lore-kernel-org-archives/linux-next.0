From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: April 22 Next : net/rfkill randconfig failure
Date: Thu, 23 Apr 2009 13:54:24 +0400
Message-ID: <a4423d670904230254v672798ddtda443e549ef45490@mail.gmail.com>
References: <20090422154247.dbffd285.sfr@canb.auug.org.au>
	 <49EEF38D.8000801@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.29]:45635 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753527AbZDWJyZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2009 05:54:25 -0400
In-Reply-To: <49EEF38D.8000801@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wireless@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>

2009/4/22 Sachin Sant <sachinp@in.ibm.com>:
> Today's next tree build (x86 randconfig) failed with
>
> net/rfkill/rfkill.c: In function 'update_rfkill_state':
> net/rfkill/rfkill.c:99: error: implicit declaration of function
> 'rfkill_led_trigger'
> make[2]: *** [net/rfkill/rfkill.o] Error 1
>
> .config attached
>

Add CCs
