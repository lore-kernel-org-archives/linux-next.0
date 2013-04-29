From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 29 (include/linux/proc_fs.h: proc_net_mkdir)
Date: Mon, 29 Apr 2013 09:17:36 -0700
Message-ID: <517E9D20.7080403@infradead.org>
References: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:56596 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757127Ab3D2QSD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Apr 2013 12:18:03 -0400
In-Reply-To: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/29/13 02:17, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130426:
> 

when CONFIG_PROC_FS is not enabled:

  CC      init/main.o
In file included from init/main.c:16:0:
include/linux/proc_fs.h: In function 'proc_net_mkdir':
include/linux/proc_fs.h:69:2: error: implicit declaration of function 'proc_mkdir_data' [-Werror=implicit-function-declaration]
include/linux/proc_fs.h:69:2: warning: return makes pointer from integer without a cast [enabled by default]




-- 
~Randy
