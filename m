From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH] Staging: agnx: switch config_interface to
	bss_info_changed
Date: Tue, 12 May 2009 15:51:56 +0400
Message-ID: <a4423d670905120451p5cd8b194yf3fd5572f92f083b@mail.gmail.com>
References: <1242127393-4298-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:39881 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803AbZELLv5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2009 07:51:57 -0400
In-Reply-To: <1242127393-4298-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@suse.de
Cc: johannes@sipsolutions.net, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>

2009/5/12 Alexander Beregalov <a.beregalov@gmail.com>:
> Fix this build error:
> drivers/staging/agnx/pci.c: In function 'agnx_config_interface':
> drivers/staging/agnx/pci.c:315: error: dereferencing pointer to incomplete type
> ..
> drivers/staging/agnx/pci.c:424: error: unknown field 'config_interface' specified in initializer
>
> config_interface was removed in 2d0ddec5b2b
> ("mac80211: unify config_interface and bss_info_changed")
>
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---

stlc45xx has the same problem (drivers/staging/stlc45xx/stlc45xx.c:2360)
It is not so simple, I do not know how to fix it.
