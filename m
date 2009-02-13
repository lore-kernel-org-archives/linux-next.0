From: Frank Seidel <fseidel@suse.de>
Subject: Re: [PATCH next 2/2] pohmelfs: fix printk format warnings
Date: Fri, 13 Feb 2009 14:08:21 +0100
Message-ID: <499570C5.5090001@suse.de>
References: <20090213125944.GB7003@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns1.suse.de ([195.135.220.2]:36726 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753038AbZBMNNp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Feb 2009 08:13:45 -0500
In-Reply-To: <20090213125944.GB7003@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: zbr@ioremap.net, gregkh@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Alexander Beregalov schrieb:
> drivers/staging/pohmelfs/inode.c:917: warning: format '%u' expects type 'unsigned int', but argument 4 has type 'size_t'
> drivers/staging/pohmelfs/inode.c:1036: warning: format '%u' expects type 'unsigned int', but argument 7 has type 'size_t'
> drivers/staging/pohmelfs/trans.c:164: warning: format '%u' expects type 'unsigned int', but argument 5 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:170: warning: format '%u' expects type 'unsigned int', but argument 7 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:517: warning: format '%u' expects type 'unsigned int', but argument 6 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:600: warning: format '%u' expects type 'unsigned int', but argument 6 has type '__kernel_size_t'
> drivers/staging/pohmelfs/trans.c:610: warning: format '%u' expects type 'unsigned int', but argument 7 has type '__kernel_size_t'
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
Signed-off-by: Frank Seidel <frank@f-seidel.de>

Looks of for me.
