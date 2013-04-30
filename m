From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH -next] tty.h: fix build errors when PROC_FS is not
 enabled
Date: Tue, 30 Apr 2013 09:39:02 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1304300938520.31619@chino.kir.corp.google.com>
References: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au> <517E9A4F.1080609@infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:62394 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932376Ab3D3QjE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Apr 2013 12:39:04 -0400
Received: by mail-pd0-f181.google.com with SMTP id q10so397123pdj.26
        for <linux-next@vger.kernel.org>; Tue, 30 Apr 2013 09:39:04 -0700 (PDT)
In-Reply-To: <517E9A4F.1080609@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Mon, 29 Apr 2013, Randy Dunlap wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build error when CONFIG_PROC_FS is not enabled:
> 
> include/linux/tty.h: In function 'proc_tty_register_driver':
> include/linux/tty.h:698:52: error: parameter name omitted
> include/linux/tty.h: In function 'proc_tty_unregister_driver':
> include/linux/tty.h:699:54: error: parameter name omitted
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: David Rientjes <rientjes@google.com>
